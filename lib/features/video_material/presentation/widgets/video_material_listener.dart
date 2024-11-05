import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_sth/features/video_material/domain/enums/video_material_screen_enum.dart';
import 'package:media_sth/features/video_material/presentation/bloc/video_material_cubit.dart';
import 'package:video_player/video_player.dart';

class VideoMaterialListener extends StatelessWidget {
  const VideoMaterialListener({
    required this.child,
    required this.videoPlayerController,
    required this.opacityController,
    required this.transitionController,
    super.key,
  });

  final AnimationController opacityController;
  final AnimationController transitionController;
  final VideoPlayerController videoPlayerController;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoMaterialCubit, VideoMaterialState>(
      listenWhen: (p, c) =>
          p.failure != c.failure ||
          p.videoMaterialsScreenEnum != c.videoMaterialsScreenEnum,
      listener: (context, state) {
        if (state.failure.isSome()) {
          return;
        }

        if (state.isLoading) {
          return;
        }
        switch (state.videoMaterialsScreenEnum) {
          case VideoMaterialsScreenEnum.showVideo:
            videoPlayerController.seekTo(Duration.zero);
            videoPlayerController.play();
            transitionController.reverse();
            opacityController.reverse();
            break;
          case VideoMaterialsScreenEnum.showOnlyRecommendation:
            videoPlayerController.pause();
            transitionController.forward();
            opacityController.forward();
            break;
        }
      },
      child: child,
    );
  }
}
