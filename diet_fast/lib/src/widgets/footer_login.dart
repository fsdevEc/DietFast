import 'package:flutter/material.dart';

class FooterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _FooterBackLoginPainter(),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _FooterFrontLoginPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class _FooterFrontLoginPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Color(0xff73a270);
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.85);
    path.quadraticBezierTo(size.width*0.4, size.height*0.75, size.width*0.68, size.height*0.8);
    path.quadraticBezierTo(size.width*0.9, size.height*0.82, size.width, size.height*0.7);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _FooterBackLoginPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff73a270).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    
    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.82);
    path.quadraticBezierTo(size.width*0.4, size.height*0.71, size.width*0.65, size.height*0.76);
    path.quadraticBezierTo(size.width*0.85, size.height*0.81, size.width, size.height*0.65);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}