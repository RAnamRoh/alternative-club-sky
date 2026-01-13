import 'dart:ui';

import 'package:flutter/material.dart';

class FlightPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final dashWidth = 5;
    final dashSpace = 3;

    // Calculate height based on width
    double arcHeight = size.width * 0.5; // Adjust multiplier as needed

    // Define the arc path to use the full width and calculated height
    final path = Path();
    path.addArc(
      Rect.fromLTWH(0, (size.height - arcHeight) / 2, size.width, arcHeight),
      3.14, // Starting angle (radians)
      3.14,  // Sweep angle (radians)
    );

    // Draw dotted arc
    double totalLength = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (totalLength < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(totalLength, totalLength + dashWidth),
          paint,
        );
        totalLength += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FlightPathWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(300, 300),
              painter: FlightPathPainter(),
            ),
            Positioned(
              top: 140,
              child: Icon(
                Icons.airplanemode_active,
                color: Colors.blue,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


