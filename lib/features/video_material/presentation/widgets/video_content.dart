import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoContent extends StatelessWidget {
  const VideoContent({
    required this.controller,
    super.key,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller);
  }
}
