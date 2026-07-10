import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_photo_model.freezed.dart';
part 'appointment_photo_model.g.dart';

@freezed
class AppointmentPhotoModel with _$AppointmentPhotoModel {
  const factory AppointmentPhotoModel({
    required String id,
    required String appointmentId,
    required String storageUrl,
    String? thumbnailUrl,
    required String uploadStatus,
    required DateTime takenAt,
    String? notes,
    @Default(false) bool favorite,
    @Default(false) bool instagramPosted,
    @Default(false) bool facebookPosted,
    @Default(false) bool tikTokPosted,
  }) = _AppointmentPhotoModel;

  factory AppointmentPhotoModel.fromJson(Map<String, dynamic> json) => _$AppointmentPhotoModelFromJson(json);
}
