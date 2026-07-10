// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoUploadState {
  String get localPath => throw _privateConstructorUsedError;
  String get appointmentId => throw _privateConstructorUsedError;
  UploadStatus get status => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoUploadStateCopyWith<PhotoUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoUploadStateCopyWith<$Res> {
  factory $PhotoUploadStateCopyWith(
          PhotoUploadState value, $Res Function(PhotoUploadState) then) =
      _$PhotoUploadStateCopyWithImpl<$Res, PhotoUploadState>;
  @useResult
  $Res call(
      {String localPath,
      String appointmentId,
      UploadStatus status,
      double progress,
      String? errorMessage});
}

/// @nodoc
class _$PhotoUploadStateCopyWithImpl<$Res, $Val extends PhotoUploadState>
    implements $PhotoUploadStateCopyWith<$Res> {
  _$PhotoUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPath = null,
    Object? appointmentId = null,
    Object? status = null,
    Object? progress = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoUploadStateImplCopyWith<$Res>
    implements $PhotoUploadStateCopyWith<$Res> {
  factory _$$PhotoUploadStateImplCopyWith(_$PhotoUploadStateImpl value,
          $Res Function(_$PhotoUploadStateImpl) then) =
      __$$PhotoUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String localPath,
      String appointmentId,
      UploadStatus status,
      double progress,
      String? errorMessage});
}

/// @nodoc
class __$$PhotoUploadStateImplCopyWithImpl<$Res>
    extends _$PhotoUploadStateCopyWithImpl<$Res, _$PhotoUploadStateImpl>
    implements _$$PhotoUploadStateImplCopyWith<$Res> {
  __$$PhotoUploadStateImplCopyWithImpl(_$PhotoUploadStateImpl _value,
      $Res Function(_$PhotoUploadStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localPath = null,
    Object? appointmentId = null,
    Object? status = null,
    Object? progress = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$PhotoUploadStateImpl(
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UploadStatus,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PhotoUploadStateImpl implements _PhotoUploadState {
  const _$PhotoUploadStateImpl(
      {required this.localPath,
      required this.appointmentId,
      required this.status,
      this.progress = 0,
      this.errorMessage});

  @override
  final String localPath;
  @override
  final String appointmentId;
  @override
  final UploadStatus status;
  @override
  @JsonKey()
  final double progress;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PhotoUploadState(localPath: $localPath, appointmentId: $appointmentId, status: $status, progress: $progress, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoUploadStateImpl &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, localPath, appointmentId, status, progress, errorMessage);

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoUploadStateImplCopyWith<_$PhotoUploadStateImpl> get copyWith =>
      __$$PhotoUploadStateImplCopyWithImpl<_$PhotoUploadStateImpl>(
          this, _$identity);
}

abstract class _PhotoUploadState implements PhotoUploadState {
  const factory _PhotoUploadState(
      {required final String localPath,
      required final String appointmentId,
      required final UploadStatus status,
      final double progress,
      final String? errorMessage}) = _$PhotoUploadStateImpl;

  @override
  String get localPath;
  @override
  String get appointmentId;
  @override
  UploadStatus get status;
  @override
  double get progress;
  @override
  String? get errorMessage;

  /// Create a copy of PhotoUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoUploadStateImplCopyWith<_$PhotoUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
