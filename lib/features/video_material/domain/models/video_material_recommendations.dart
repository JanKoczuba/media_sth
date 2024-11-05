import 'package:flutter/material.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';
import 'package:media_sth/features/video_material/domain/enums/video_like_status_enum.dart';

class VideoMaterialRecommendation {
  VideoMaterialRecommendation({
    required this.name,
    required this.imagePath,
    required this.likeStatusEnum,
    this.customFlexFactor = 1,
    this.backgroundColor,
  }) : assert(
          backgroundColor != null || imagePath.isNotEmpty,
        );

  final String name;
  final String imagePath;
  final VideoLikeStatusEnum likeStatusEnum;
  final int customFlexFactor;
  final Color? backgroundColor;

  bool get showHeart => imagePath.isNotEmpty;

  bool get showRoundedBorder {
    switch (likeStatusEnum) {
      case VideoLikeStatusEnum.white:
      case VideoLikeStatusEnum.green:
        return true;
      case VideoLikeStatusEnum.none:
        return false;
    }
  }

  Icon? get getHeartIcon {
    if (!showHeart) {
      return null;
    }
    switch (likeStatusEnum) {
      case VideoLikeStatusEnum.white:
        return const Icon(
          Icons.favorite,
          color: AppColors.white,
        );
      case VideoLikeStatusEnum.green:
        return const Icon(
          Icons.favorite,
          color: AppColors.greenAccent,
        );
      case VideoLikeStatusEnum.none:
        return Icon(
          Icons.favorite_border,
          color: AppColors.white.withOpacity(0.7),
        );
    }
  }
}
