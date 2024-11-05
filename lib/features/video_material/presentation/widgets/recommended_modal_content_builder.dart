import 'package:flutter/material.dart';
import 'package:media_sth/core/app/image_assets.dart';
import 'package:media_sth/core/presentation/styles/app_colors.dart';
import 'package:media_sth/core/utils/context_extension.dart';
import 'package:media_sth/features/video_material/domain/enums/video_like_status_enum.dart';
import 'package:media_sth/features/video_material/domain/models/video_material_recommendations.dart';

typedef VideoMaterialRecommendationDataBuilder = Widget Function(
  BuildContext context,
  List<VideoMaterialRecommendation> recommendationsFirstColumn,
  List<VideoMaterialRecommendation> recommendationsSecondColumn,
);

class VideoMaterialRecommendationBuilder extends StatelessWidget {
  const VideoMaterialRecommendationBuilder({
    required this.builder,
    super.key,
  });

  final VideoMaterialRecommendationDataBuilder builder;

  @override
  Widget build(BuildContext context) {
    final recommendationsFirst = [
      VideoMaterialRecommendation(
        name: context.localizations.planTrip,
        imagePath: '',
        likeStatusEnum: VideoLikeStatusEnum.none,
        backgroundColor: AppColors.greenCardColor,
        customFlexFactor: 2,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.trails,
        imagePath: '',
        likeStatusEnum: VideoLikeStatusEnum.none,
        backgroundColor: AppColors.blueCardColor,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.longerMuseumVisitingHours,
        imagePath: PngImages.img1,
        likeStatusEnum: VideoLikeStatusEnum.white,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.carbonerumForSchoolStudents,
        imagePath: PngImages.img2,
        likeStatusEnum: VideoLikeStatusEnum.green,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.carbonerumForSchoolStudents,
        imagePath: PngImages.img3,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
    ];
    final recommendationsSecond = [
      VideoMaterialRecommendation(
        name: context.localizations.longerMuseumVisitingHours,
        imagePath: PngImages.img1,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.carbonerumForSchoolStudents,
        imagePath: PngImages.img2,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.longerMuseumVisitingHours,
        imagePath: PngImages.img1,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.carbonerumForSchoolStudents,
        imagePath: PngImages.img2,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
      VideoMaterialRecommendation(
        name: context.localizations.longerMuseumVisitingHours,
        imagePath: PngImages.img1,
        likeStatusEnum: VideoLikeStatusEnum.none,
      ),
    ];
    return builder(context, recommendationsFirst, recommendationsSecond);
  }
}
