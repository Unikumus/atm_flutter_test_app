import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Const/app_colors.dart';



class DisplayData extends StatelessWidget {

  String data1;
  String data2;
  String data3;

  bool data4;


  DisplayData({this.data1, this.data2, this.data3, this.data4});

  @override
  Widget build(BuildContext context) {
    return  Container(

        padding: EdgeInsets.only(left: 20, right: 20),

        child:

        data4 == true ?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data1, textAlign: TextAlign.center, style: TextStyle(fontSize: 18,  color: AppColors.PRIMARY_COLOR_THIRD))
          ],
        ):

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data1, textAlign: TextAlign.left, style: TextStyle(fontSize: 13,  color: Colors.grey)),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data2, style: TextStyle(fontSize: 14, color:   AppColors.PRIMARY_COLOR_SECOND)),
                  Text(data3, style: TextStyle(fontSize: 14,  color:   AppColors.PRIMARY_COLOR_SECOND)),
                ],
              ),
            ),
          ],
        )
    );
  }
}
