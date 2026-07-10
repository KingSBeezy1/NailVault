import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel({
    required String id,
    required String firstName,
    required String lastName,
    String? phoneNumber,
    String? email,
    String? instagramUsername,
    DateTime? birthday,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) => _$ClientModelFromJson(json);
}
