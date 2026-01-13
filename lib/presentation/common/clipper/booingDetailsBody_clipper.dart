import 'package:flutter/material.dart';

class BookingDetailBodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    // The SVG path starts here, translated to Flutter's Path methods
    path.moveTo(size.width * 0.9610955, 0); // M 321.967 0

    // Top-right corner curve
    path.cubicTo(size.width * 0.9626716, size.height * 0.0346329, size.width * 0.9789075,
        size.height * 0.0628139, size.width, size.height * 0.0689975); // C 322.495 8.48...

    path.lineTo(size.width, size.height); // V 245
    path.lineTo(size.width * 0.9902657, size.height); // H 331.739

    // Scalloped bottom edge
    // This part creates the repeating semi-circle cuts at the bottom
    double scallopStartX = 0.9465821;
    for (int i = 0; i < 11; i++) {
      path.cubicTo(
          size.width * (scallopStartX - 0.01633), size.height * 0.9829224,
          size.width * (scallopStartX - 0.03134), size.height * 0.9714286,
          size.width * (scallopStartX - 0.0388), size.height * 0.9714286
      );
      path.cubicTo(
          size.width * (scallopStartX - 0.04626), size.height * 0.9714286,
          size.width * (scallopStartX - 0.05172), size.height * 0.9829224,
          size.width * (scallopStartX - 0.05919), size.height
      );
      if (i < 10) {
        path.lineTo(size.width * (scallopStartX - 0.0841), size.height);
      }
      scallopStartX -= 0.0841;
    }

    path.lineTo(0, size.height); // H 0
    path.lineTo(0, size.height * 0.0698384); // V 17.1104

    // Top-left corner curve
    path.cubicTo(size.width * 0.02377164, size.height * 0.0675110, size.width * 0.04283731,
        size.height * 0.0375870, size.width * 0.04463612, 0); // C 7.96...

    path.close(); // Z

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}