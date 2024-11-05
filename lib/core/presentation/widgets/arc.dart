import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';

class Arc extends StatelessWidget {
  const Arc({
    required this.diameter,
    super.key,
  });

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(diameter),
      size: Size(diameter, diameter),
      child: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: diameter / 2,
        color: AppColors.white,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.diameter);

  final double diameter;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColors.greenAccent;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, 0),
        height: diameter,
        width: diameter,
      ),
      -math.pi,
      -math.pi,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
