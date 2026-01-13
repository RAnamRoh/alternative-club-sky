
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final bool isDashed;

  LinePainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.isDashed = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    if (isDashed) {
      const double dashHeight = 5.0;
      const double dashSpacing = 3.0;
      double startY = 0;

      while (startY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight),
          paint,
        );
        startY += dashHeight + dashSpacing;
      }
    } else {
      // Draw a solid line
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}