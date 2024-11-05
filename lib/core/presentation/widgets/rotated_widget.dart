import 'package:flutter/material.dart';

class RotatedWidget extends StatelessWidget {
  const RotatedWidget({
    required this.angle,
    required this.rotatedWidget,
    super.key,
  });

  final double angle;
  final Widget rotatedWidget;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: rotatedWidget,
    );
  }
}
