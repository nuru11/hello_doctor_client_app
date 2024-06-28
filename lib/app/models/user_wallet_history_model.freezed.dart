// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_wallet_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWalletHistoryModel _$UserWalletHistoryModelFromJson(
    Map<String, dynamic> json) {
  return _UserwallethistoryModel.fromJson(json);
}

/// @nodoc
mixin _$UserWalletHistoryModel {
  String? get id => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get initialAmount => throw _privateConstructorUsedError;
  int? get finalAmount => throw _privateConstructorUsedError;
  int? get transactionAmount => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWalletHistoryModelCopyWith<UserWalletHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletHistoryModelCopyWith<$Res> {
  factory $UserWalletHistoryModelCopyWith(UserWalletHistoryModel value,
          $Res Function(UserWalletHistoryModel) then) =
      _$UserWalletHistoryModelCopyWithImpl<$Res, UserWalletHistoryModel>;
  @useResult
  $Res call(
      {String? id,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      int? initialAmount,
      int? finalAmount,
      int? transactionAmount,
      String? userId,
      String? status,
      String? description,
      String? type});
}

/// @nodoc
class _$UserWalletHistoryModelCopyWithImpl<$Res,
        $Val extends UserWalletHistoryModel>
    implements $UserWalletHistoryModelCopyWith<$Res> {
  _$UserWalletHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? initialAmount = freezed,
    Object? finalAmount = freezed,
    Object? transactionAmount = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      initialAmount: freezed == initialAmount
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionAmount: freezed == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserwallethistoryModelImplCopyWith<$Res>
    implements $UserWalletHistoryModelCopyWith<$Res> {
  factory _$$UserwallethistoryModelImplCopyWith(
          _$UserwallethistoryModelImpl value,
          $Res Function(_$UserwallethistoryModelImpl) then) =
      __$$UserwallethistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      int? initialAmount,
      int? finalAmount,
      int? transactionAmount,
      String? userId,
      String? status,
      String? description,
      String? type});
}

/// @nodoc
class __$$UserwallethistoryModelImplCopyWithImpl<$Res>
    extends _$UserWalletHistoryModelCopyWithImpl<$Res,
        _$UserwallethistoryModelImpl>
    implements _$$UserwallethistoryModelImplCopyWith<$Res> {
  __$$UserwallethistoryModelImplCopyWithImpl(
      _$UserwallethistoryModelImpl _value,
      $Res Function(_$UserwallethistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? initialAmount = freezed,
    Object? finalAmount = freezed,
    Object? transactionAmount = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? type = freezed,
  }) {
    return _then(_$UserwallethistoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      initialAmount: freezed == initialAmount
          ? _value.initialAmount
          : initialAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionAmount: freezed == transactionAmount
          ? _value.transactionAmount
          : transactionAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserwallethistoryModelImpl implements _UserwallethistoryModel {
  const _$UserwallethistoryModelImpl(
      {this.id,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.initialAmount,
      this.finalAmount,
      this.transactionAmount,
      this.userId,
      this.status,
      this.description,
      this.type});

  factory _$UserwallethistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserwallethistoryModelImplFromJson(json);

  @override
  final String? id;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  final int? initialAmount;
  @override
  final int? finalAmount;
  @override
  final int? transactionAmount;
  @override
  final String? userId;
  @override
  final String? status;
  @override
  final String? description;
  @override
  final String? type;

  @override
  String toString() {
    return 'UserWalletHistoryModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, initialAmount: $initialAmount, finalAmount: $finalAmount, transactionAmount: $transactionAmount, userId: $userId, status: $status, description: $description, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserwallethistoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.initialAmount, initialAmount) ||
                other.initialAmount == initialAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.transactionAmount, transactionAmount) ||
                other.transactionAmount == transactionAmount) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      initialAmount,
      finalAmount,
      transactionAmount,
      userId,
      status,
      description,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserwallethistoryModelImplCopyWith<_$UserwallethistoryModelImpl>
      get copyWith => __$$UserwallethistoryModelImplCopyWithImpl<
          _$UserwallethistoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserwallethistoryModelImplToJson(
      this,
    );
  }
}

abstract class _UserwallethistoryModel implements UserWalletHistoryModel {
  const factory _UserwallethistoryModel(
      {final String? id,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      final int? initialAmount,
      final int? finalAmount,
      final int? transactionAmount,
      final String? userId,
      final String? status,
      final String? description,
      final String? type}) = _$UserwallethistoryModelImpl;

  factory _UserwallethistoryModel.fromJson(Map<String, dynamic> json) =
      _$UserwallethistoryModelImpl.fromJson;

  @override
  String? get id;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  int? get initialAmount;
  @override
  int? get finalAmount;
  @override
  int? get transactionAmount;
  @override
  String? get userId;
  @override
  String? get status;
  @override
  String? get description;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$UserwallethistoryModelImplCopyWith<_$UserwallethistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
