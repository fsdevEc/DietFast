import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: screenSize.height*0.38,
            child: CustomPaint(
              painter: _HeaderBackLoginPainter(),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenSize.height*0.35,
            child: CustomPaint(
              painter: _HeaderFrontLoginPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderFrontLoginPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Color(0xff73a270);
    paint.style = PaintingStyle.fill;

    final path = new Path();
    path.lineTo(0, size.height*0.14);
    path.quadraticBezierTo(size.width*0.55, size.height*0.07, size.width*0.65, size.height*0.43);
    path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _HeaderBackLoginPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = Color(0xff73a270).withOpacity(0.2);
    paint.style = PaintingStyle.fill;
    
    final path = new Path();
    path.lineTo(0, size.height*0.21);
    path.quadraticBezierTo(size.width*0.55, size.height*0.13, size.width*0.6, size.height*0.5);
    path.quadraticBezierTo(size.width*0.7, size.height*0.92, size.width, size.height);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}