import 'package:flutter/material.dart';

class BookingDetailHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9402985, 0);
    path.cubicTo(
        size.width * 0.9684418,
        0,
        size.width * 0.9825134,
        size.height * -0.000002008282,
        size.width * 0.9912567,
        size.height * 0.02662464);
    path.cubicTo(size.width, size.height * 0.05325127, size.width,
        size.height * 0.09610818, size.width, size.height * 0.1818182);
    path.lineTo(size.width, size.height * 0.8239173);
    path.cubicTo(
        size.width * 0.9792866,
        size.height * 0.8423818,
        size.width * 0.9639522,
        size.height * 0.9086855,
        size.width * 0.9639522,
        size.height * 0.9876545);
    path.cubicTo(
        size.width * 0.9639522,
        size.height * 0.9918000,
        size.width * 0.9639970,
        size.height * 0.9959182,
        size.width * 0.9640806,
        size.height);
    path.lineTo(size.width * 0.04762119, size.height);
    path.cubicTo(
        size.width * 0.04771313,
        size.height * 0.9957182,
        size.width * 0.04776119,
        size.height * 0.9913909,
        size.width * 0.04776119,
        size.height * 0.9870273);
    path.cubicTo(
        size.width * 0.04776090,
        size.height * 0.8937773,
        size.width * 0.02637755,
        size.height * 0.8181818,
        0,
        size.height * 0.8181818);
    path.lineTo(0, size.height * 0.1818182);
    path.cubicTo(
        0,
        size.height * 0.09610818,
        size.width * -6.602657e-7,
        size.height * 0.05325127,
        size.width * 0.008742418,
        size.height * 0.02662464);
    path.cubicTo(size.width * 0.01748549, size.height * -0.000002010636,
        size.width * 0.03155791, 0, size.width * 0.05970149, 0);
    path.lineTo(size.width * 0.9402985, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
