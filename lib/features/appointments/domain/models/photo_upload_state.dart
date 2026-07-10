import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_upload_state.freezed.dart';

enum UploadStatus { queued, uploading, success, failure }

@freezed
class PhotoUploadState with _$PhotoUploadState {
  const factory PhotoUploadState({
    required String localPath,
    required String appointmentId,
    required UploadStatus status,
    @Default(0) double progress,
    String? errorMessage,
  }) = _PhotoUploadState;
}
