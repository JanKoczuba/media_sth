part of 'video_material_cubit.dart';

@freezed
class VideoMaterialState with _$VideoMaterialState{
  const factory VideoMaterialState({
    required bool isLoading,
    required Option<Failure> failure,
    required VideoMaterialsScreenEnum videoMaterialsScreenEnum,
  }) = _VideoMaterialState;

  factory VideoMaterialState.initial() => VideoMaterialState(
    isLoading: true,
    failure: none(),
    videoMaterialsScreenEnum: VideoMaterialsScreenEnum.showVideo,
  );
}