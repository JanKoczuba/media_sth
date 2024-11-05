import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_sth/core/presentation/styles/app_borders.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';
import 'package:media_sth/core/presentation/styles/app_padings.dart';
import 'package:media_sth/core/presentation/styles/app_text_styles.dart';
import 'package:media_sth/core/presentation/widgets/rotated_widget.dart';
import 'package:media_sth/core/presentation/widgets/rounded_background_icon.dart';
import 'package:media_sth/features/video_material/domain/models/video_material_recommendations.dart';

class RecommendedModalContentCard extends StatelessWidget {
  const RecommendedModalContentCard({
    required this.model,
    super.key,
  });

  final VideoMaterialRecommendation model;

  @override
  Widget build(BuildContext context) {
    final heartIcon = model.getHeartIcon;
    // height card without custom scale factor  should have 1/2 width
    final height =
        (MediaQuery.sizeOf(context).width / (2 * model.customFlexFactor));
    final imagePath = model.imagePath;
    final isImageExist = imagePath.isNotEmpty;
    return Padding(
      padding: AppPaddings.recommendedActionCard,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: model.backgroundColor,
          borderRadius: AppBorders.recommendedActionCardBorder,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (isImageExist)
              Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: height / 3,
                width: double.infinity,
                color: isImageExist
                    ? AppColors.greenAccent.withOpacity(0.05)
                    : null,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: AppPaddings.cardText,
                    child: Text(
                      toBeginningOfSentenceCase(
                        model.name,
                      ),
                      style: AppTextStyles.titleMedium
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: AppPaddings.recommendedCardIcon,
                child: heartIcon != null
                    ? RoundedBackgroundIcon(
                        icon: heartIcon,
                        showBorder: model.showRoundedBorder,
                      )
                    : const RotatedWidget(
                        angle: -180,
                        rotatedWidget: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
