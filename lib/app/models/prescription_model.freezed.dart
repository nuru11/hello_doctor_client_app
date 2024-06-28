// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrescriptionModel _$PrescriptionModelFromJson(Map<String, dynamic> json) {
  return _PrescriptionModel.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionModel {
  String? get id => throw _privateConstructorUsedError;
  String? get timeSlotId => throw _privateConstructorUsedError;
  String? get doctorId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get prescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrescriptionModelCopyWith<PrescriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionModelCopyWith<$Res> {
  factory $PrescriptionModelCopyWith(
          PrescriptionModel value, $Res Function(PrescriptionModel) then) =
      _$PrescriptionModelCopyWithImpl<$Res, PrescriptionModel>;
  @useResult
  $Res call(
      {String? id,
      String? timeSlotId,
      String? doctorId,
      String? userId,
      @TimestampConverter() DateTime? createdAt,
      String? prescription});
}

/// @nodoc
class _$PrescriptionModelCopyWithImpl<$Res, $Val extends PrescriptionModel>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeSlotId = freezed,
    Object? doctorId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? prescription = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSlotId: freezed == timeSlotId
          ? _value.timeSlotId
          : timeSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      prescription: freezed == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrescriptionModelImplCopyWith<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  factory _$$PrescriptionModelImplCopyWith(_$PrescriptionModelImpl value,
          $Res Function(_$PrescriptionModelImpl) then) =
      __$$PrescriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? timeSlotId,
      String? doctorId,
      String? userId,
      @TimestampConverter() DateTime? createdAt,
      String? prescription});
}

/// @nodoc
class __$$PrescriptionModelImplCopyWithImpl<$Res>
    extends _$PrescriptionModelCopyWithImpl<$Res, _$PrescriptionModelImpl>
    implements _$$PrescriptionModelImplCopyWith<$Res> {
  __$$PrescriptionModelImplCopyWithImpl(_$PrescriptionModelImpl _value,
      $Res Function(_$PrescriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? timeSlotId = freezed,
    Object? doctorId = freezed,
    Object? userId = freezed,
    Object? createdAt = freezed,
    Object? prescription = freezed,
  }) {
    return _then(_$PrescriptionModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timeSlotId: freezed == timeSlotId
          ? _value.timeSlotId
          : timeSlotId // ignore: cast_nullable_to_non_nullable
              as String?,
      doctorId: freezed == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      prescription: freezed == prescription
          ? _value.prescription
          : prescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionModelImpl implements _PrescriptionModel {
  const _$PrescriptionModelImpl(
      {this.id,
      this.timeSlotId,
      this.doctorId,
      this.userId,
      @TimestampConverter() this.createdAt,
      this.prescription});

  factory _$PrescriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? timeSlotId;
  @override
  final String? doctorId;
  @override
  final String? userId;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final String? prescription;

  @override
  String toString() {
    return 'PrescriptionModel(id: $id, timeSlotId: $timeSlotId, doctorId: $doctorId, userId: $userId, createdAt: $createdAt, prescription: $prescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timeSlotId, timeSlotId) ||
                other.timeSlotId == timeSlotId) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.prescription, prescription) ||
                other.prescription == prescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, timeSlotId, doctorId, userId, createdAt, prescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionModelImplCopyWith<_$PrescriptionModelImpl> get copyWith =>
      __$$PrescriptionModelImplCopyWithImpl<_$PrescriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionModelImplToJson(
      this,
    );
  }
}

abstract class _PrescriptionModel implements PrescriptionModel {
  const factory _PrescriptionModel(
      {final String? id,
      final String? timeSlotId,
      final String? doctorId,
      final String? userId,
      @TimestampConverter() final DateTime? createdAt,
      final String? prescription}) = _$PrescriptionModelImpl;

  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) =
      _$PrescriptionModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get timeSlotId;
  @override
  String? get doctorId;
  @override
  String? get userId;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  String? get prescription;
  @override
  @JsonKey(ignore: true)
  _$$PrescriptionModelImplCopyWith<_$PrescriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
