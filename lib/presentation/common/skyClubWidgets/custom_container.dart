import 'package:flutter/material.dart';

class WavyContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Color color;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const WavyContainer({
    Key? key,
    this.height,
    this.width,
    this.color = Colors.transparent,
    this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SharpWaveClipper(),
      child: Container(
        height: height,
        width: width,
        color: color,
        padding: padding,
        child: child,
      ),
    );
  }
}

class SharpWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start the path from the top-left corner
    path.moveTo(0, size.height * 0.2);

    // Create sharp wave pattern
    const double waveWidth = 20;
    const double waveHeight = 30;

    for (double x = 0; x < size.width; x += waveWidth) {
      path.lineTo(x + waveWidth / 2, size.height * 0.2 - waveHeight); // Up
      path.lineTo(x + waveWidth, size.height * 0.2); // Down
    }

    // Draw the remaining container body
    path.lineTo(size.width, size.height); // Bottom-right
    path.lineTo(0, size.height); // Bottom-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
