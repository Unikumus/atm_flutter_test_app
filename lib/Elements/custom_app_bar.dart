import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Const/app_colors.dart';


class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(
          top: MediaQuery.of(context).padding.top
      ),
      child:  Padding(
        padding: const EdgeInsets.only(
            left: 30.0,
            top: 20.0,
            bottom: 20.0
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/images/icon_atm.png',
              width: 26,
              height: 26,
            ),
            SizedBox(width: 5,),
            Text(
              'ATM',
              style:  TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
      decoration:  BoxDecoration(
          gradient:  LinearGradient(
              colors: [
                AppColors.PRIMARY_COLOR_SECOND,
                AppColors.PRIMARY_COLOR_FIRST,
              ]
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.PRIMARY_COLOR_SECOND,
              blurRadius: 20.0,
              spreadRadius: 1.0,
            )
          ]
      ),
    );
  }
}
