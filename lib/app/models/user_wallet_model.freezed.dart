// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserWalletModel _$UserWalletModelFromJson(Map<String, dynamic> json) {
  return _UserWalletModel.fromJson(json);
}

/// @nodoc
mixin _$UserWalletModel {
  String? get id => throw _privateConstructorUsedError;
  int? get balance => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserWalletModelCopyWith<UserWalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserWalletModelCopyWith<$Res> {
  factory $UserWalletModelCopyWith(
          UserWalletModel value, $Res Function(UserWalletModel) then) =
      _$UserWalletModelCopyWithImpl<$Res, UserWalletModel>;
  @useResult
  $Res call(
      {String? id,
      int? balance,
      String? userId,
      String? username,
      String? currency,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$UserWalletModelCopyWithImpl<$Res, $Val extends UserWalletModel>
    implements $UserWalletModelCopyWith<$Res> {
  _$UserWalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? balance = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserWalletModelImplCopyWith<$Res>
    implements $UserWalletModelCopyWith<$Res> {
  factory _$$UserWalletModelImplCopyWith(_$UserWalletModelImpl value,
          $Res Function(_$UserWalletModelImpl) then) =
      __$$UserWalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int? balance,
      String? userId,
      String? username,
      String? currency,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$UserWalletModelImplCopyWithImpl<$Res>
    extends _$UserWalletModelCopyWithImpl<$Res, _$UserWalletModelImpl>
    implements _$$UserWalletModelImplCopyWith<$Res> {
  __$$UserWalletModelImplCopyWithImpl(
      _$UserWalletModelImpl _value, $Res Function(_$UserWalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? balance = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$UserWalletModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserWalletModelImpl implements _UserWalletModel {
  const _$UserWalletModelImpl(
      {this.id,
      this.balance,
      this.userId,
      this.username,
      this.currency,
      @TimestampConverter() this.createdAt});

  factory _$UserWalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserWalletModelImplFromJson(json);

  @override
  final String? id;
  @override
  final int? balance;
  @override
  final String? userId;
  @override
  final String? username;
  @override
  final String? currency;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserWalletModel(id: $id, balance: $balance, userId: $userId, username: $username, currency: $currency, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserWalletModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, balance, userId, username, currency, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserWalletModelImplCopyWith<_$UserWalletModelImpl> get copyWith =>
      __$$UserWalletModelImplCopyWithImpl<_$UserWalletModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserWalletModelImplToJson(
      this,
    );
  }
}

abstract class _UserWalletModel implements UserWalletModel {
  const factory _UserWalletModel(
      {final String? id,
      final int? balance,
      final String? userId,
      final String? username,
      final String? currency,
      @TimestampConverter() final DateTime? createdAt}) = _$UserWalletModelImpl;

  factory _UserWalletModel.fromJson(Map<String, dynamic> json) =
      _$UserWalletModelImpl.fromJson;

  @override
  String? get id;
  @override
  int? get balance;
  @override
  String? get userId;
  @override
  String? get username;
  @override
  String? get currency;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$UserWalletModelImplCopyWith<_$UserWalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
