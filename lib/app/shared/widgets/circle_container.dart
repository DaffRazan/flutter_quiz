import 'package:flutter/material.dart';

class CircleContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Paint outerBorderPaint1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final Paint outerBorderPaint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final double startAngle = 0;
    final double sweepAngle = 2 * 3.14159265359;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle / 2,
      false,
      outerBorderPaint1,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle + sweepAngle / 2,
      sweepAngle / 2,
      false,
      outerBorderPaint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
