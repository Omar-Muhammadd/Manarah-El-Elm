import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  List<DrawingPoints> pointsList = [];
  List<Offset> offsetPoints = [];

  DrawingPainter({required this.pointsList});

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        if (pointsList[i + 1].points == Offset.infinite) {
          continue;
        }
        canvas.drawLine(
            pointsList[i].points, pointsList[i + 1].points, pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        // منطقك الحالي للتعامل مع الحالة عندما يكون هناك نقطة واحدة فقط
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoints {
  Paint paint;
  Offset points;

  DrawingPoints({required this.paint, required this.points});
}
