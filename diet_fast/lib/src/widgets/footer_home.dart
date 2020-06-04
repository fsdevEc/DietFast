import 'package:flutter/material.dart';

class FooterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _FooterBackHomePainter(),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _FooterFrontHomePainter(),
            ),
          )
        ],
      ),
    );
  }
}

class _FooterFrontHomePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Color(0xff73a270);
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.68);
    path.quadraticBezierTo(size.width*0.25, size.height*0.62, size.width*0.5, size.height*0.65);
    path.quadraticBezierTo(size.width*0.85, size.height*0.7, size.width, size.height*0.35);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _FooterBackHomePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff73a270).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    
    final path = new Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height*0.64);
    path.quadraticBezierTo(size.width*0.25, size.height*0.58, size.width*0.5, size.height*0.61);
    path.quadraticBezierTo(size.width*0.85, size.height*0.66, size.width, size.height*0.31);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}