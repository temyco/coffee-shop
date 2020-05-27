import 'package:flutter/material.dart';

class LinearProgress extends CustomPaint {

  LinearProgress({double width,
    double height,
    double maxProgress = 1,
    double currentProgress = 0,
    Color background = Colors.white,
    Color progress = Colors.green})
      : super(
      size: Size(width, height),
      painter: LinearProgressPainter(
          maxProgress, currentProgress, background, progress, height
      )
  );
}

class LinearProgressPainter extends CustomPainter {

  final double maxProgress;
  final double currentProgress;

  Paint _background;
  Paint _progress;

  LinearProgressPainter(this.maxProgress,
      this.currentProgress,
      Color background,
      Color progress,
      double strokeWidth) {
    _background = Paint()
      ..color = background;
    _applyBaseParameters(_background, strokeWidth);

    _progress = Paint()
      ..color = progress;
    _applyBaseParameters(_progress, strokeWidth);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset start = Offset(0, 0);
    Offset end = Offset(size.width, 0);
    double progress = currentProgress / maxProgress;
    double progressEndPoint = size.width * progress;
    Offset endProgress = Offset(progressEndPoint, 0);

    canvas.drawLine(start, end, _background);
    canvas.drawLine(start, endProgress, _progress);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  void _applyBaseParameters(Paint paint, double strokeWidth) {
    paint.strokeWidth = strokeWidth;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
  }
}
