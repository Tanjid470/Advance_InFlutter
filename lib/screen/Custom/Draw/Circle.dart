

import 'package:flutter/material.dart';

class Circle extends CustomPainter{
  final double dx;
  final double dy;
  Circle(this.dx, this.dy);
  
    
  @override
  void paint(Canvas canvas, Size size) {
      final paint = Paint()
      ..strokeWidth = 50
      ..color = Color.fromARGB(255, 251, 252, 251)
      ..style = PaintingStyle.fill;

    //changing offset(dx,dy) you can draw anywhere
    canvas.drawCircle( Offset(dx, dy), 80,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
  
}