import 'package:flutter/material.dart';

abstract class AppBorders {
  static const _radius12 = Radius.circular(12.0);
  static const recommendedCardBorder = BorderRadius.only(
    topRight: _radius12,
    topLeft: _radius12,
  );
}
