import 'package:flutter/material.dart';

class HeaderGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenSize.height*0.25,
            child: CustomPaint(
              painter: _HeaderBackGeneralPainter(),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenSize.height*0.2,
            child: CustomPaint(
              painter: _HeaderFrontGeneralPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderFrontGeneralPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Color(0xff73a270);
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.65, size.height, size.width, size.height*0.6);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _HeaderBackGeneralPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff73a270).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    
    final path = new Path();
    path.lineTo(0, size.height*0.4);
    path.quadraticBezierTo(size.width*0.65, size.height, size.width, size.height*0.6);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}