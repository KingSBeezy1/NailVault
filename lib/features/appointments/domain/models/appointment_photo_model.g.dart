// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentPhotoModelImpl _$$AppointmentPhotoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentPhotoModelImpl(
      id: json['id'] as String,
      appointmentId: json['appointmentId'] as String,
      storageUrl: json['storageUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      uploadStatus: json['uploadStatus'] as String,
      takenAt: DateTime.parse(json['takenAt'] as String),
      notes: json['notes'] as String?,
      favorite: json['favorite'] as bool? ?? false,
      instagramPosted: json['instagramPosted'] as bool? ?? false,
      facebookPosted: json['facebookPosted'] as bool? ?? false,
      tikTokPosted: json['tikTokPosted'] as bool? ?? false,
    );

Map<String, dynamic> _$$AppointmentPhotoModelImplToJson(
        _$AppointmentPhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appointmentId': instance.appointmentId,
      'storageUrl': instance.storageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'uploadStatus': instance.uploadStatus,
      'takenAt': instance.takenAt.toIso8601String(),
      'notes': instance.notes,
      'favorite': instance.favorite,
      'instagramPosted': instance.instagramPosted,
      'facebookPosted': instance.facebookPosted,
      'tikTokPosted': instance.tikTokPosted,
    };
