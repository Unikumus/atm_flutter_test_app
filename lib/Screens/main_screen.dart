import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Bloc/bloc.dart';
import '../Elements/custom_app_bar.dart';
import '../Elements/display_data.dart';
import '../Elements/gradient_shape.dart';
import '../Const/app_colors.dart';
import 'dart:math' as math;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  var pageWidth;
  var pageHeight;
  var inputValue;


  outputData _receivedData;

  outputData _initialData = outputData(
    data1: "Банкомат выдал следующие купюры:",
    data2: "50 X 100 рублей\n100 X 200 рублей\n100 X 2000 рублей",
    data3: "5 X 500 рублей\n10 X 1000 рублей\n10 X 5000 рублей",

    data4: "Баланс банкомата:",
    data5: "50 X 100 рублей\n100 X 200 рублей\n100 X 2000 рублей",
    data6: "5 X 500 рублей\n10 X 1000 рублей\n10 X 5000 рублей",

    data7: false,

  );

  Bloc _bloc = Bloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    pageWidth = MediaQuery.of(context).size.width;
    pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar:  PreferredSize(
        child: CustomAppBar(),
        preferredSize:  Size( MediaQuery.of(context).size.width, 100.0),
      ),

      body: SafeArea(
        child: StreamBuilder<Object>(
          initialData: _initialData,
          stream: _bloc.outputStateStream,
          builder: (context, snapshot) {

            if (snapshot.hasData) {_receivedData = snapshot.data as outputData;}

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      child: Container(
                        width: pageWidth,
                        height: 170,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                          child:  GradientShape(firstColor: AppColors.PRIMARY_COLOR_SECOND, secondColor: AppColors.PRIMARY_COLOR_FIRST,),
                        ),
                      ),
                    ),
                    //InputField
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(30.0),
                        width: 150,
                        child: Column(

                          children: [
                            Text("Введите сумму",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white),),

                            TextField(

                              textAlign: TextAlign.center,
                              onChanged: (val){
                                inputValue = val;
                              },
                              style: TextStyle(

                                  fontSize: 30.0,
                                  color: Colors.white),
                                  decoration: InputDecoration(
                                       contentPadding:  EdgeInsets.symmetric(vertical: 1.0),

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),

                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
                                    ),

                                  ),
                            ),

                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                //Button
                Container(
                  width: 200,
                  height: 60,
                  margin: EdgeInsets.only(bottom: 22, top: 16),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    color: AppColors.PRIMARY_COLOR_THIRD,
                    textColor: Colors.white,
                    onPressed: () {
                      _bloc.inputEventSink.add(inputValue);
                    },
                    child: Text(
                      "Выдать сумму".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: 10,
                  color:  AppColors.PRIMARY_COLOR_SECOND.withOpacity(0.06),
                ),

                DisplayData(data1: _receivedData.data1, data2: _receivedData.data2, data3: _receivedData.data3, data4:_receivedData.data7),

                Container(
                  height: 10,
                  color:  AppColors.PRIMARY_COLOR_SECOND.withOpacity(0.06),
                ),

                DisplayData(data1: _receivedData.data4, data2: _receivedData.data5, data3: _receivedData.data6 ),

                Container(
                  height: 10,
                  color: AppColors.PRIMARY_COLOR_SECOND.withOpacity(0.06),
                ),

                Container(
                  child: Transform.rotate(
                    angle: 180 * math.pi/180,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                        child:  GradientShape(firstColor: AppColors.PRIMARY_COLOR_FIRST, secondColor: AppColors.PRIMARY_COLOR_SECOND,),
                      ),
                    ),
                  ),
                ),

              ],
            );
          }
        ),
      ),
    );
  }

}

