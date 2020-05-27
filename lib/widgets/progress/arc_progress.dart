import 'package:flutter/material.dart';

class ArcProgress extends CustomPaint {
  ArcProgress({double circleSize,
    int startAngle = 0,
    int endAngle = 0,
    int strokeWidth = 4,
    Color arcColor,
    bool drawBackground = false,
    Color bgColor})
      : super(
      size: Size(circleSize, circleSize),
      painter: ArcProgressPainter(
          circleSize.round(),
          startAngle,
          endAngle,
          strokeWidth,
          arcColor,
          drawBackground,
          bgColor
      )
  );
}

class ArcProgressPainter extends CustomPainter {
  final int arcSize;
  final int startAngle;
  final int endAngle;
  final bool drawBackground;

  Paint _arcPaint;
  Paint _bgPaint;
  double _radian;

  ArcProgressPainter(this.arcSize,
      this.startAngle,
      this.endAngle,
      int strokeWidth,
      Color arcColor,
      this.drawBackground,
      Color bgColor) {
    _arcPaint = _initPaint(arcColor, strokeWidth.roundToDouble());

    _radian = 3.14 / 180;

    if (drawBackground) {
      _bgPaint = _initPaint(bgColor, strokeWidth.roundToDouble());
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset offset = Offset(arcSize / 2, arcSize / 2);
    Rect rect = Rect.fromCircle(
        center: offset,
        radius: arcSize / 2 - 1 //just to have line in the middle of (for example) avatar bg
    );

    if(drawBackground) {
      double endRadians = 360 * _radian;
      canvas.drawArc(rect, 0, endRadians, false, _bgPaint);
    }

    double startRadians = startAngle * _radian;
    double endRadians = endAngle * _radian;
    canvas.drawArc(rect, startRadians, endRadians, false, _arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Paint _initPaint(Color color, double strokeWidth) {
    return Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;
  }
}
