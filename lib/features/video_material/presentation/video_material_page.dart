import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_sth/core/app/video_assets.dart';
import 'package:media_sth/core/presentation/styles/app_durations.dart';
import 'package:media_sth/core/presentation/styles/app_text_styles.dart';
import 'package:media_sth/core/presentation/widgets/app_bars/default_app_bar.dart';
import 'package:media_sth/core/presentation/widgets/processing_container.dart';
import 'package:media_sth/core/utils/context_extension.dart';
import 'package:media_sth/features/video_material/presentation/bloc/video_material_cubit.dart';
import 'package:media_sth/features/video_material/presentation/widgets/recommended_modal.dart';
import 'package:media_sth/features/video_material/presentation/widgets/video_content.dart';
import 'package:media_sth/features/video_material/presentation/widgets/video_material_listener.dart';
import 'package:video_player/video_player.dart';

class VideoMaterialPage extends StatefulWidget {
  const VideoMaterialPage({super.key});

  @override
  State<VideoMaterialPage> createState() => _VideoMaterialPageState();
}

class _VideoMaterialPageState extends State<VideoMaterialPage>
    with TickerProviderStateMixin {
  late final VideoPlayerController videoPlayerController;
  late final AnimationController opacityController;
  late final Animation<double> animatedOpacity;
  late final Animation<double> animatedOpacityReversed;
  late final AnimationController transitionController;
  late final Animation<RelativeRect> animatedTransition;

  late final screenHeight = MediaQuery.sizeOf(context).height;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(VideoAssets.bee);
    _asyncInit();
  }

  void _asyncInit() async {
    await Future.wait([
      _animationInit(),
      _videoInit(),
    ]);
    videoPlayerController.play();
  }

  Future _animationInit() async {
    opacityController = AnimationController(
      vsync: this,
      duration: AppDurations.milliseconds500,
    );

    animatedOpacity = opacityController.drive(
      CurveTween(
        curve: Curves.easeOut,
      ),
    );
    animatedOpacityReversed = ReverseAnimation(opacityController.drive(
      CurveTween(
        curve: Curves.easeOut,
      ),
    ));

    transitionController = AnimationController(
      vsync: this,
      duration: AppDurations.milliseconds500,
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      animatedTransition = RelativeRectTween(
          begin: RelativeRect.fromLTRB(
            4,
            (screenHeight / 3.5),
            4,
            0,
          ),
          end: RelativeRect.fromLTRB(
            4,
            MediaQuery.of(context).padding.top + kToolbarHeight,
            4,
            0,
          )).animate(
        CurvedAnimation(
          parent: transitionController,
          curve: Curves.easeInOut,
        ),
      );
      context.read<VideoMaterialCubit>().animationInitialized();
    });
  }

  Future _videoInit() async {
    try {
      await videoPlayerController.initialize();
      if (mounted) {
        context.read<VideoMaterialCubit>().videoInitialized();
      }
      videoPlayerController.addListener(() {
        context
            .read<VideoMaterialCubit>()
            .checkVideo(videoPlayerController.value);
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.localizations.videoInitFailure),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    opacityController.dispose();
    transitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: FadeTransition(
          opacity: animatedOpacity,
          child: Text(
            context.localizations.logo.toUpperCase(),
            style: AppTextStyles.titleLarge,
          ),
        ),
      ),
      body: VideoMaterialListener(
        videoPlayerController: videoPlayerController,
        opacityController: opacityController,
        transitionController: transitionController,
        child: BlocBuilder<VideoMaterialCubit, VideoMaterialState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return ProcessingContainer(
                isProcessing: state.isLoading,
                child: const SizedBox(),
              );
            }
            return Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  bottom: (screenHeight / 3) * 2,
                  child: FadeTransition(
                    opacity: animatedOpacityReversed,
                    child: VideoContent(
                      controller: videoPlayerController,
                    ),
                  ),
                ),
                PositionedTransition(
                  rect: animatedTransition,
                  child: const RecommendedModal(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
