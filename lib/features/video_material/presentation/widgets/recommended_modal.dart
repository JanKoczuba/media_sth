import 'package:flutter/material.dart';
import 'package:media_sth/core/presentation/styles/app_borders.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';

class RecommendedModal extends StatelessWidget {
  const RecommendedModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppBorders.recommendedCardBorder,
      ),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
    );
  }
}
