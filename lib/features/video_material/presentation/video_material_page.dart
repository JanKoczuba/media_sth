import 'package:flutter/material.dart';
import 'package:media_sth/core/app/video_assets.dart';
import 'package:media_sth/features/video_material/presentation/widgets/video_content.dart';
import 'package:video_player/video_player.dart';

class VideoMaterialPage extends StatefulWidget {
  const VideoMaterialPage({super.key});

  @override
  State<VideoMaterialPage> createState() => _VideoMaterialPageState();
}

class _VideoMaterialPageState extends State<VideoMaterialPage> {
  late final VideoPlayerController videoPlayerController;
  late final screenHeight = MediaQuery.sizeOf(context).height;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(VideoAssets.bee);
    _videoInit();
  }

  Future _videoInit() async {
    try {
      await videoPlayerController.initialize();
      videoPlayerController.play();
    } catch (e) {
      //TODO
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: (screenHeight / 3) * 2,
            child: VideoContent(
              controller: videoPlayerController,
            ),
          ),
        ],
      ),
    );
  }
}
