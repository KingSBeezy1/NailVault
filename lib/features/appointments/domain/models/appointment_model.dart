import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_model.freezed.dart';
part 'appointment_model.g.dart';

@freezed
class AppointmentModel with _$AppointmentModel {
  const factory AppointmentModel({
    required String id,
    required String clientId,
    required DateTime date,
    required int durationMinutes,
    required double price,
    required String status,
    required bool completed,
    required bool cancelled,
    required bool noShow,
    String? notes,
    @Default(<String>[]) List<String> productsUsed,
    String? nailShape,
    String? length,
    @Default(<String>[]) List<String> colorTags,
    @Default(<String>[]) List<String> designTags,
    @Default(<String>[]) List<String> photoIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AppointmentModel;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);
}
