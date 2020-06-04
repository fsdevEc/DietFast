import 'package:flutter/material.dart';

class FooterGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: screenSize.height*0.125,
              child: CustomPaint(
                painter: _FooterBackGeneralPainter(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              height: screenSize.height*0.1,
              child: CustomPaint(
                painter: _FooterFrontGeneralPainter(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FooterFrontGeneralPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Color(0xff73a270);
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.3, size.height);    
    path.quadraticBezierTo(size.width*0.15, size.height*0.3, 0,0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _FooterBackGeneralPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff73a270).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    
    final path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.35, size.height);    
    path.quadraticBezierTo(size.width*0.2, size.height*0.4, 0,0);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}