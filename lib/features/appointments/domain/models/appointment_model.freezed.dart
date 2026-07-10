// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return _AppointmentModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentModel {
  String get id => throw _privateConstructorUsedError;
  String get clientId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  bool get cancelled => throw _privateConstructorUsedError;
  bool get noShow => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get productsUsed => throw _privateConstructorUsedError;
  String? get nailShape => throw _privateConstructorUsedError;
  String? get length => throw _privateConstructorUsedError;
  List<String> get colorTags => throw _privateConstructorUsedError;
  List<String> get designTags => throw _privateConstructorUsedError;
  List<String> get photoIds => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AppointmentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentModelCopyWith<AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelCopyWith<$Res> {
  factory $AppointmentModelCopyWith(
          AppointmentModel value, $Res Function(AppointmentModel) then) =
      _$AppointmentModelCopyWithImpl<$Res, AppointmentModel>;
  @useResult
  $Res call(
      {String id,
      String clientId,
      DateTime date,
      int durationMinutes,
      double price,
      String status,
      bool completed,
      bool cancelled,
      bool noShow,
      String? notes,
      List<String> productsUsed,
      String? nailShape,
      String? length,
      List<String> colorTags,
      List<String> designTags,
      List<String> photoIds,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AppointmentModelCopyWithImpl<$Res, $Val extends AppointmentModel>
    implements $AppointmentModelCopyWith<$Res> {
  _$AppointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? date = null,
    Object? durationMinutes = null,
    Object? price = null,
    Object? status = null,
    Object? completed = null,
    Object? cancelled = null,
    Object? noShow = null,
    Object? notes = freezed,
    Object? productsUsed = null,
    Object? nailShape = freezed,
    Object? length = freezed,
    Object? colorTags = null,
    Object? designTags = null,
    Object? photoIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelled: null == cancelled
          ? _value.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      noShow: null == noShow
          ? _value.noShow
          : noShow // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      productsUsed: null == productsUsed
          ? _value.productsUsed
          : productsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nailShape: freezed == nailShape
          ? _value.nailShape
          : nailShape // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      colorTags: null == colorTags
          ? _value.colorTags
          : colorTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      designTags: null == designTags
          ? _value.designTags
          : designTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoIds: null == photoIds
          ? _value.photoIds
          : photoIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppointmentModelImplCopyWith<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  factory _$$AppointmentModelImplCopyWith(_$AppointmentModelImpl value,
          $Res Function(_$AppointmentModelImpl) then) =
      __$$AppointmentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clientId,
      DateTime date,
      int durationMinutes,
      double price,
      String status,
      bool completed,
      bool cancelled,
      bool noShow,
      String? notes,
      List<String> productsUsed,
      String? nailShape,
      String? length,
      List<String> colorTags,
      List<String> designTags,
      List<String> photoIds,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AppointmentModelImplCopyWithImpl<$Res>
    extends _$AppointmentModelCopyWithImpl<$Res, _$AppointmentModelImpl>
    implements _$$AppointmentModelImplCopyWith<$Res> {
  __$$AppointmentModelImplCopyWithImpl(_$AppointmentModelImpl _value,
      $Res Function(_$AppointmentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clientId = null,
    Object? date = null,
    Object? durationMinutes = null,
    Object? price = null,
    Object? status = null,
    Object? completed = null,
    Object? cancelled = null,
    Object? noShow = null,
    Object? notes = freezed,
    Object? productsUsed = null,
    Object? nailShape = freezed,
    Object? length = freezed,
    Object? colorTags = null,
    Object? designTags = null,
    Object? photoIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AppointmentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: null == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      cancelled: null == cancelled
          ? _value.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as bool,
      noShow: null == noShow
          ? _value.noShow
          : noShow // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      productsUsed: null == productsUsed
          ? _value._productsUsed
          : productsUsed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nailShape: freezed == nailShape
          ? _value.nailShape
          : nailShape // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      colorTags: null == colorTags
          ? _value._colorTags
          : colorTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      designTags: null == designTags
          ? _value._designTags
          : designTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoIds: null == photoIds
          ? _value._photoIds
          : photoIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentModelImpl implements _AppointmentModel {
  const _$AppointmentModelImpl(
      {required this.id,
      required this.clientId,
      required this.date,
      required this.durationMinutes,
      required this.price,
      required this.status,
      required this.completed,
      required this.cancelled,
      required this.noShow,
      this.notes,
      final List<String> productsUsed = const <String>[],
      this.nailShape,
      this.length,
      final List<String> colorTags = const <String>[],
      final List<String> designTags = const <String>[],
      final List<String> photoIds = const <String>[],
      required this.createdAt,
      required this.updatedAt})
      : _productsUsed = productsUsed,
        _colorTags = colorTags,
        _designTags = designTags,
        _photoIds = photoIds;

  factory _$AppointmentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String clientId;
  @override
  final DateTime date;
  @override
  final int durationMinutes;
  @override
  final double price;
  @override
  final String status;
  @override
  final bool completed;
  @override
  final bool cancelled;
  @override
  final bool noShow;
  @override
  final String? notes;
  final List<String> _productsUsed;
  @override
  @JsonKey()
  List<String> get productsUsed {
    if (_productsUsed is EqualUnmodifiableListView) return _productsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsUsed);
  }

  @override
  final String? nailShape;
  @override
  final String? length;
  final List<String> _colorTags;
  @override
  @JsonKey()
  List<String> get colorTags {
    if (_colorTags is EqualUnmodifiableListView) return _colorTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorTags);
  }

  final List<String> _designTags;
  @override
  @JsonKey()
  List<String> get designTags {
    if (_designTags is EqualUnmodifiableListView) return _designTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_designTags);
  }

  final List<String> _photoIds;
  @override
  @JsonKey()
  List<String> get photoIds {
    if (_photoIds is EqualUnmodifiableListView) return _photoIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoIds);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AppointmentModel(id: $id, clientId: $clientId, date: $date, durationMinutes: $durationMinutes, price: $price, status: $status, completed: $completed, cancelled: $cancelled, noShow: $noShow, notes: $notes, productsUsed: $productsUsed, nailShape: $nailShape, length: $length, colorTags: $colorTags, designTags: $designTags, photoIds: $photoIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled) &&
            (identical(other.noShow, noShow) || other.noShow == noShow) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._productsUsed, _productsUsed) &&
            (identical(other.nailShape, nailShape) ||
                other.nailShape == nailShape) &&
            (identical(other.length, length) || other.length == length) &&
            const DeepCollectionEquality()
                .equals(other._colorTags, _colorTags) &&
            const DeepCollectionEquality()
                .equals(other._designTags, _designTags) &&
            const DeepCollectionEquality().equals(other._photoIds, _photoIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clientId,
      date,
      durationMinutes,
      price,
      status,
      completed,
      cancelled,
      noShow,
      notes,
      const DeepCollectionEquality().hash(_productsUsed),
      nailShape,
      length,
      const DeepCollectionEquality().hash(_colorTags),
      const DeepCollectionEquality().hash(_designTags),
      const DeepCollectionEquality().hash(_photoIds),
      createdAt,
      updatedAt);

  /// Create a copy of AppointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentModelImplCopyWith<_$AppointmentModelImpl> get copyWith =>
      __$$AppointmentModelImplCopyWithImpl<_$AppointmentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentModelImplToJson(
      this,
    );
  }
}

abstract class _AppointmentModel implements AppointmentModel {
  const factory _AppointmentModel(
      {required final String id,
      required final String clientId,
      required final DateTime date,
      required final int durationMinutes,
      required final double price,
      required final String status,
      required final bool completed,
      required final bool cancelled,
      required final bool noShow,
      final String? notes,
      final List<String> productsUsed,
      final String? nailShape,
      final String? length,
      final List<String> colorTags,
      final List<String> designTags,
      final List<String> photoIds,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AppointmentModelImpl;

  factory _AppointmentModel.fromJson(Map<String, dynamic> json) =
      _$AppointmentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get clientId;
  @override
  DateTime get date;
  @override
  int get durationMinutes;
  @override
  double get price;
  @override
  String get status;
  @override
  bool get completed;
  @override
  bool get cancelled;
  @override
  bool get noShow;
  @override
  String? get notes;
  @override
  List<String> get productsUsed;
  @override
  String? get nailShape;
  @override
  String? get length;
  @override
  List<String> get colorTags;
  @override
  List<String> get designTags;
  @override
  List<String> get photoIds;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AppointmentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentModelImplCopyWith<_$AppointmentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
