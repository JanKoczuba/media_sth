import 'package:flutter/material.dart';
import 'package:media_sth/core/presentation/styles/app_borders.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';
import 'package:media_sth/core/presentation/styles/app_spacing.dart';
import 'package:media_sth/features/video_material/presentation/widgets/recommended_modal_content.dart';
import 'package:media_sth/features/video_material/presentation/widgets/recommended_modal_header.dart';

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
          children: [
            RecommendedModalHeader(),
            AppSpacing.spacing8Height,
            RecommendedModalContent(),
          ],
        ),
      ),
    );
  }
}
