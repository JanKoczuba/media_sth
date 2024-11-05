import 'package:flutter/material.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';
import 'package:media_sth/core/presentation/styles/app_padings.dart';

class RoundedBackgroundIcon extends StatelessWidget {
  const RoundedBackgroundIcon({
    required this.icon,
    required this.showBorder,
    super.key,
  });

  final Icon icon;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(
                color: AppColors.white,
              )
            : null,
      ),
      child: Padding(
        padding: AppPaddings.roundedIcon,
        child: icon,
      ),
    );
  }
}
