import 'package:flutter/material.dart';
import 'package:media_sth/features/video_material/presentation/widgets/recommended_modal_content_builder.dart';
import 'package:media_sth/features/video_material/presentation/widgets/recommended_modal_content_card.dart';

class RecommendedModalContent extends StatelessWidget {
  const RecommendedModalContent({super.key});

  @override
  Widget build(BuildContext context) {
    return VideoMaterialRecommendationBuilder(builder: (
      context,
      recommendationFirst,
      recommendationSecond,
    ) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recommendationFirst.length,
              itemBuilder: (BuildContext context, int index) {
                return RecommendedModalContentCard(
                  model: recommendationFirst[index],
                );
              },
            ),
          ),

          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recommendationSecond.length,
              itemBuilder: (BuildContext context, int index) {
                return RecommendedModalContentCard(
                  model: recommendationSecond[index],
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
