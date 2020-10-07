import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientShape extends StatelessWidget {

  var firstColor;
  var secondColor;

  GradientShape({this.firstColor, this.secondColor});


  Widget PathShapeA (){

    return ClipPath(
      clipper: BezierClipperA(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              firstColor.withOpacity(0.7),
              secondColor.withOpacity(0.7),
            ], //
            tileMode: TileMode.repeated,
          ),
        ),
        height:  370,
        width: 376,
      ),
    );

  }

  Widget PathShapeB (){

    return ClipPath(
      clipper: BezierClipperB(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              firstColor.withOpacity(0.7),
              firstColor.withOpacity(0.7),
            ], //
            tileMode: TileMode.repeated,
          ),
        ),
        height:  368,
        width: 376,
      ),
    );

  }

  Widget PathShapeC (){

    return ClipPath(
      clipper: BezierClipperC(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              firstColor.withOpacity(0.2),
              secondColor.withOpacity(0.2),
            ], //
            tileMode: TileMode.repeated,
          ),
        ),
        height:  400,
        width: 376,
      ),
    );

  }

  Widget PathShapeD (){

    return ClipPath(
      clipper: BezierClipperD(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              firstColor.withOpacity(0.4),
              secondColor.withOpacity(0.4),
            ], //
            tileMode: TileMode.repeated,
          ),
        ),
        height:  366,
        width: 376,
      ),
    );

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child:  Center(
        child: Stack(
          children: [

            PathShapeA (),
            PathShapeB (),
            PathShapeC (),
            PathShapeD (),

          ],

        ),
      ),
    );
  }
}


class BezierClipperA extends  CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = Path();
    final double _xScaling = size.width / 376;
    final double _yScaling = size.height / 370;
    path.lineTo(376 * _xScaling,349.3 * _yScaling);
    path.cubicTo(376 * _xScaling,349.3 * _yScaling,317 * _xScaling,392.3 * _yScaling,184.6 * _xScaling,354.5 * _yScaling,);
    path.cubicTo(52.19999999999999 * _xScaling,316.7 * _yScaling,0 * _xScaling,318.2 * _yScaling,0 * _xScaling,318.2 * _yScaling,);
    path.cubicTo(0 * _xScaling,318.2 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,376 * _xScaling,0 * _yScaling,376 * _xScaling,0 * _yScaling,);
    path.cubicTo(376 * _xScaling,0 * _yScaling,376 * _xScaling,349.3 * _yScaling,376 * _xScaling,349.3 * _yScaling,);
    path.cubicTo(376 * _xScaling,349.3 * _yScaling,376 * _xScaling,349.3 * _yScaling,376 * _xScaling,349.3 * _yScaling,);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class BezierClipperB extends  CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = Path();
    final double _xScaling = size.width / 376;
    final double _yScaling = size.height / 368;
    path.lineTo(0 * _xScaling,0 * _yScaling);
    path.cubicTo(0 * _xScaling,0 * _yScaling,376 * _xScaling,0 * _yScaling,376 * _xScaling,0 * _yScaling,);
    path.cubicTo(376 * _xScaling,0 * _yScaling,376 * _xScaling,367 * _yScaling,376 * _xScaling,367 * _yScaling,);
    path.cubicTo(344.8 * _xScaling,369.8 * _yScaling,303.5 * _xScaling,367.6 * _yScaling,253.2 * _xScaling,353.2 * _yScaling,);
    path.cubicTo(120.4 * _xScaling,315.3 * _yScaling,0 * _xScaling,328.8 * _yScaling,0 * _xScaling,328.8 * _yScaling,);
    path.cubicTo(0 * _xScaling,328.8 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class BezierClipperC extends  CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = Path();
    final double _xScaling = size.width / 376;
    final double _yScaling = size.height / 400;
    path.lineTo(0 * _xScaling,323.3 * _yScaling);
    path.cubicTo(0 * _xScaling,323.3 * _yScaling,103.8 * _xScaling,373.7 * _yScaling,217.7 * _xScaling,354 * _yScaling,);
    path.cubicTo(331.59999999999997 * _xScaling,334.3 * _yScaling,376 * _xScaling,396 * _yScaling,376 * _xScaling,396 * _yScaling,);
    path.cubicTo(376 * _xScaling,396 * _yScaling,376 * _xScaling,-4 * _yScaling,376 * _xScaling,-4 * _yScaling,);
    path.cubicTo(376 * _xScaling,-4 * _yScaling,0 * _xScaling,-4 * _yScaling,0 * _xScaling,-4 * _yScaling,);
    path.cubicTo(0 * _xScaling,-4 * _yScaling,0 * _xScaling,323.3 * _yScaling,0 * _xScaling,323.3 * _yScaling,);
    path.cubicTo(0 * _xScaling,323.3 * _yScaling,0 * _xScaling,323.3 * _yScaling,0 * _xScaling,323.3 * _yScaling,);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}

class BezierClipperD extends  CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = Path();
    final double _xScaling = size.width / 376;
    final double _yScaling = size.height / 366;
    path.lineTo(0 * _xScaling,364.2 * _yScaling);
    path.cubicTo(0 * _xScaling,364.2 * _yScaling,59.9 * _xScaling,377 * _yScaling,157.6 * _xScaling,334.9 * _yScaling,);
    path.cubicTo(255.29999999999998 * _xScaling,292.79999999999995 * _yScaling,376 * _xScaling,356.9 * _yScaling,376 * _xScaling,356.9 * _yScaling,);
    path.cubicTo(376 * _xScaling,356.9 * _yScaling,376 * _xScaling,0 * _yScaling,376 * _xScaling,0 * _yScaling,);
    path.cubicTo(376 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,0 * _xScaling,0 * _yScaling,);
    path.cubicTo(0 * _xScaling,0 * _yScaling,0 * _xScaling,364.2 * _yScaling,0 * _xScaling,364.2 * _yScaling,);
    path.cubicTo(0 * _xScaling,364.2 * _yScaling,0 * _xScaling,364.2 * _yScaling,0 * _xScaling,364.2 * _yScaling,);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

}