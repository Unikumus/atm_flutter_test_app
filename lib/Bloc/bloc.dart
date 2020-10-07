import 'dart:async';
import 'dart:math' as math;

class outputData{
  String data1;
  String data2;
  String data3;

  String data4;
  String data5;
  String data6;

  bool data7;

  outputData({  this.data1, this.data2, this.data3, this.data4, this.data5, this.data6, this.data7 });
}


class Bloc{

final _inputEventController = StreamController();
StreamSink get inputEventSink => _inputEventController.sink;


final _outputStateController = StreamController<outputData>();
Stream<outputData> get outputStateStream => _outputStateController.stream;

var limits = {
  100: 50, // 50 шт X 100 рублей
  200: 100, // 100 шт X 200 рублей
  500: 5, // 5 шт X 500 рублей
  1000: 10, // 10 шт X 1000 рублей
  2000: 100, // 100 шт X 2000 рублей
  5000: 10, // 10 шт X 5000 рублей
};


getMoney(amountRequired, limits) {

  var myKeys = limits.keys.toList()..sort();
  var nominals = myKeys.reversed.toList(); // отсортированные номиналы купюр


  dynamic  collect(amount, nominals) {

    if(amount == 0) return {};
    if (nominals.length == 0) {return {};}

    int currentNominal = nominals[0]; // текущий (первый) номинал в массиве
    int availableNotes = limits[currentNominal]; // число доступных банкнот текущего номинала
    int notesNeeded = (amount / currentNominal).floor(); // число банкнот текущего номинала необходимых для выдачи
    int numberOfNotes = (math.min(availableNotes.toDouble(), notesNeeded.toDouble())).round(); // фактическое число банкнот текущего номинала необходимых для выдачи

    for( int i = numberOfNotes; i >= 0; i--){
    // рекурсия
      var result = collect(amount - (i * currentNominal) , nominals.sublist(1));

      if (result != null || result.length != 0) {
        if(i >= 0 ){return  {currentNominal: i, ...result};}
        else {return result;}
      }
    }
  }
  return collect(amountRequired, nominals);
}


// проверка
verification(res, val, lim){


  var myKeys = res.keys.toList()..sort();
  var resSortKeys = myKeys.reversed.toList(); // отсортированные номиналы купюр

  int totalSumm = 0;

  for( var i = res.length-1 ; i >= 0; i-- ) {
    int step = res[resSortKeys[i]];
    totalSumm += resSortKeys[i]*step;
  }

  // проверка
  if(totalSumm == val) {

    List<String> totalSumm = List<String>();
    List<String> fin = List<String>();

    Map<int, int> newLimits = Map<int, int>();


    for (var i = 5; i >= 0; i--) {
      int step = res[resSortKeys[i]];
      totalSumm.add(step.toString() + " Х " + resSortKeys[i].toString() + " рублей" + "\n");
      fin.add((lim[resSortKeys[i]] - res[resSortKeys[i]]).toString() + " Х " + resSortKeys[i].toString() + " рублей" + "\n");

    }


    for (var i = 0; i <= 5; i++) {
      newLimits[resSortKeys[i] ] = (lim[resSortKeys[i]] - res[resSortKeys[i]]);

    }

      List outputData = List();
      outputData = [totalSumm, fin, newLimits]; // сумма выдачи, значения для экрана, новые лимиты

    return outputData;
  }
  else return null;

}



void _mapEventToState(event) {

  var result = getMoney(int.parse(event), limits);

  var outputValue = verification(result, int.parse(event), limits);

  if(outputValue != null){

    limits = outputValue[2];

    outputData myData = outputData(
      data1: "Банкомат выдал следующие купюры:",
      data2: outputValue[0][0]+outputValue[0][1]+outputValue[0][2],
      data3: outputValue[0][3]+outputValue[0][4]+outputValue[0][5],

      data4: "Баланс банкомата:",
      data5: outputValue[1][0]+outputValue[1][1]+outputValue[1][2],
      data6: outputValue[1][3]+outputValue[1][4]+outputValue[1][5],

      data7: false,
    );

    _outputStateController.sink.add(myData);

  }
  else {

    outputData myData = outputData(
      data1: "Банкомат не может выдать,\nзапрашиваемую сумму",
      data2: outputValue[0][0]+outputValue[0][1]+outputValue[0][2],
      data3: outputValue[0][3]+outputValue[0][4]+outputValue[0][5],

      data4: "Баланс банкомата:",
      data5: outputValue[1][0]+outputValue[1][1]+outputValue[1][2],
      data6: outputValue[1][3]+outputValue[1][4]+outputValue[1][5],

      data7: true,
    );

    _outputStateController.sink.add(myData);

  }

}

Bloc(){
_inputEventController.stream.listen(_mapEventToState);
}

void dispose(){
  _inputEventController.close();
  _outputStateController.close();
}


}