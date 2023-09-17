import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PeiChart extends CustomPainter {
  final List<DataItem> dataset;
  PeiChart(this.dataset);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width, size.height);
    var startAngle = 0.0;
    final  radius = 280.0;
    Rect rect =
        Rect.fromCenter(center: center, width: radius, height: radius);

    for (var element in dataset) {
      final sweepAngle = element.value * 360 * pi / 180;
      final paint = Paint()
        ..color = element.color
        ..style = PaintingStyle.fill;
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

            final linepaint = Paint()
        ..color = const Color.fromARGB(255, 252, 247, 247)
        ..style = PaintingStyle.fill
        ..strokeWidth=3;
      final dx=radius/2.0*cos(startAngle);
      final dy=radius/2.0*sin(startAngle);
      var radiusPoint=center+Offset(dx,dy);
      canvas.drawLine(center,radiusPoint, linepaint);
      startAngle += sweepAngle;
    }

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

class DataItem {
  final double value;
  final String label;
  final Color color;

  DataItem(this.value, this.color, this.label);
}
