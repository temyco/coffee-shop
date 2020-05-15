import 'package:flutter/material.dart';

class ArcProgressPainter extends CustomPainter {

  final int arcSize;
  final int startAngle;
  final int endAngle;

  Paint _arcPaint;
  double _radian;

  ArcProgressPainter(this.arcSize, this.startAngle, this.endAngle, int strokeWidth, Color color) {
    _arcPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth.roundToDouble()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    _radian = 3.14 / 180;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(arcSize / 2, arcSize / 2);
    Rect rect = Rect.fromCircle(
        center: offset,
        radius: arcSize / 2 - 1 //just to have line in the middle of (for example) avatar bg
    );

    double startRadians = startAngle * _radian;
    double endRadians = endAngle * _radian;
    canvas.drawArc(rect, startRadians, endRadians, false, _arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}