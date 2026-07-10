// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentModelImpl _$$AppointmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppointmentModelImpl(
      id: json['id'] as String,
      clientId: json['clientId'] as String,
      date: DateTime.parse(json['date'] as String),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      completed: json['completed'] as bool,
      cancelled: json['cancelled'] as bool,
      noShow: json['noShow'] as bool,
      notes: json['notes'] as String?,
      productsUsed: (json['productsUsed'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      nailShape: json['nailShape'] as String?,
      length: json['length'] as String?,
      colorTags: (json['colorTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      designTags: (json['designTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      photoIds: (json['photoIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppointmentModelImplToJson(
        _$AppointmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'date': instance.date.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'price': instance.price,
      'status': instance.status,
      'completed': instance.completed,
      'cancelled': instance.cancelled,
      'noShow': instance.noShow,
      'notes': instance.notes,
      'productsUsed': instance.productsUsed,
      'nailShape': instance.nailShape,
      'length': instance.length,
      'colorTags': instance.colorTags,
      'designTags': instance.designTags,
      'photoIds': instance.photoIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
