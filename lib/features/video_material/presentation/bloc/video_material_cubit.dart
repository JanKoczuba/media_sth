import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:media_sth/core/error/failures.dart';
import 'package:media_sth/features/video_material/domain/enums/video_material_screen_enum.dart';
import 'package:video_player/video_player.dart';

part 'video_material_state.dart';

part 'video_material_cubit.freezed.dart';

@Injectable()
class VideoMaterialCubit extends Cubit<VideoMaterialState> {
  VideoMaterialCubit() : super(VideoMaterialState.initial());

  bool _isVideoInitializing = true;
  bool _isAnimationInitializing = true;
  bool _allowChangeScreenType = true;

  void videoInitialized() {
    _isVideoInitializing = false;
    _stopInitialLoading();
  }

  void animationInitialized() {
    _isAnimationInitializing = false;
    _stopInitialLoading();
  }

  void _stopInitialLoading() {
    emit(state.copyWith(
      isLoading: (_isVideoInitializing && _isAnimationInitializing),
    ));
  }

  void changeScreenType() {
    switch (state.videoMaterialsScreenEnum) {
      case VideoMaterialsScreenEnum.showVideo:
        emitScreenType(VideoMaterialsScreenEnum.showOnlyRecommendation);
        break;
      case VideoMaterialsScreenEnum.showOnlyRecommendation:
        emitScreenType(VideoMaterialsScreenEnum.showVideo);
        break;
    }
  }

  void emitScreenType(VideoMaterialsScreenEnum type) {
    emit(state.copyWith(videoMaterialsScreenEnum: type));
  }

  void checkVideo(VideoPlayerValue value) {
    if (value.position == Duration.zero) {
      _allowChangeScreenType = true;
    }
    if ((value.position == value.duration) && _allowChangeScreenType) {
      _allowChangeScreenType = false;
      changeScreenType();
    }
  }
}
