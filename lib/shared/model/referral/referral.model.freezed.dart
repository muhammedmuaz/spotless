// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'referral.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  int? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointModelCopyWith<PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointModelCopyWith<$Res> {
  factory $PointModelCopyWith(
          PointModel value, $Res Function(PointModel) then) =
      _$PointModelCopyWithImpl<$Res>;
  $Res call({int? data, String? message});
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res> implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  final PointModel _value;
  // ignore: unused_field
  final $Res Function(PointModel) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PointModelCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$_PointModelCopyWith(
          _$_PointModel value, $Res Function(_$_PointModel) then) =
      __$$_PointModelCopyWithImpl<$Res>;
  @override
  $Res call({int? data, String? message});
}

/// @nodoc
class __$$_PointModelCopyWithImpl<$Res> extends _$PointModelCopyWithImpl<$Res>
    implements _$$_PointModelCopyWith<$Res> {
  __$$_PointModelCopyWithImpl(
      _$_PointModel _value, $Res Function(_$_PointModel) _then)
      : super(_value, (v) => _then(v as _$_PointModel));

  @override
  _$_PointModel get _value => super._value as _$_PointModel;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_PointModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointModel extends _PointModel {
  const _$_PointModel({this.data, this.message}) : super._();

  factory _$_PointModel.fromJson(Map<String, dynamic> json) =>
      _$$_PointModelFromJson(json);

  @override
  final int? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'PointModel(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointModel &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      __$$_PointModelCopyWithImpl<_$_PointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointModelToJson(
      this,
    );
  }
}

abstract class _PointModel extends PointModel {
  const factory _PointModel({final int? data, final String? message}) =
      _$_PointModel;
  const _PointModel._() : super._();

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$_PointModel.fromJson;

  @override
  int? get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MyReferralsModel _$MyReferralsModelFromJson(Map<String, dynamic> json) {
  return _MyReferralsModel.fromJson(json);
}

/// @nodoc
mixin _$MyReferralsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_sum_points')
  int? get pointsSum => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyReferralsModelCopyWith<MyReferralsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReferralsModelCopyWith<$Res> {
  factory $MyReferralsModelCopyWith(
          MyReferralsModel value, $Res Function(MyReferralsModel) then) =
      _$MyReferralsModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? email,
      @JsonKey(name: 'points_sum_points') int? pointsSum,
      String? avatar});
}

/// @nodoc
class _$MyReferralsModelCopyWithImpl<$Res>
    implements $MyReferralsModelCopyWith<$Res> {
  _$MyReferralsModelCopyWithImpl(this._value, this._then);

  final MyReferralsModel _value;
  // ignore: unused_field
  final $Res Function(MyReferralsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? pointsSum = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsSum: pointsSum == freezed
          ? _value.pointsSum
          : pointsSum // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MyReferralsModelCopyWith<$Res>
    implements $MyReferralsModelCopyWith<$Res> {
  factory _$$_MyReferralsModelCopyWith(
          _$_MyReferralsModel value, $Res Function(_$_MyReferralsModel) then) =
      __$$_MyReferralsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? email,
      @JsonKey(name: 'points_sum_points') int? pointsSum,
      String? avatar});
}

/// @nodoc
class __$$_MyReferralsModelCopyWithImpl<$Res>
    extends _$MyReferralsModelCopyWithImpl<$Res>
    implements _$$_MyReferralsModelCopyWith<$Res> {
  __$$_MyReferralsModelCopyWithImpl(
      _$_MyReferralsModel _value, $Res Function(_$_MyReferralsModel) _then)
      : super(_value, (v) => _then(v as _$_MyReferralsModel));

  @override
  _$_MyReferralsModel get _value => super._value as _$_MyReferralsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? pointsSum = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$_MyReferralsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pointsSum: pointsSum == freezed
          ? _value.pointsSum
          : pointsSum // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyReferralsModel extends _MyReferralsModel {
  const _$_MyReferralsModel(
      {this.id,
      this.name,
      this.email,
      @JsonKey(name: 'points_sum_points') this.pointsSum,
      this.avatar})
      : super._();

  factory _$_MyReferralsModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyReferralsModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: 'points_sum_points')
  final int? pointsSum;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'MyReferralsModel(id: $id, name: $name, email: $email, pointsSum: $pointsSum, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyReferralsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.pointsSum, pointsSum) &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(pointsSum),
      const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  _$$_MyReferralsModelCopyWith<_$_MyReferralsModel> get copyWith =>
      __$$_MyReferralsModelCopyWithImpl<_$_MyReferralsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyReferralsModelToJson(
      this,
    );
  }
}

abstract class _MyReferralsModel extends MyReferralsModel {
  const factory _MyReferralsModel(
      {final int? id,
      final String? name,
      final String? email,
      @JsonKey(name: 'points_sum_points') final int? pointsSum,
      final String? avatar}) = _$_MyReferralsModel;
  const _MyReferralsModel._() : super._();

  factory _MyReferralsModel.fromJson(Map<String, dynamic> json) =
      _$_MyReferralsModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(name: 'points_sum_points')
  int? get pointsSum;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_MyReferralsModelCopyWith<_$_MyReferralsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SlabModel _$SlabModelFromJson(Map<String, dynamic> json) {
  return _SlabModel.fromJson(json);
}

/// @nodoc
mixin _$SlabModel {
  int? get id => throw _privateConstructorUsedError;
  int? get point => throw _privateConstructorUsedError;
  int? get credit => throw _privateConstructorUsedError;
  int? get cash => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlabModelCopyWith<SlabModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlabModelCopyWith<$Res> {
  factory $SlabModelCopyWith(SlabModel value, $Res Function(SlabModel) then) =
      _$SlabModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? point,
      int? credit,
      int? cash,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$SlabModelCopyWithImpl<$Res> implements $SlabModelCopyWith<$Res> {
  _$SlabModelCopyWithImpl(this._value, this._then);

  final SlabModel _value;
  // ignore: unused_field
  final $Res Function(SlabModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? credit = freezed,
    Object? cash = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      credit: credit == freezed
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int?,
      cash: cash == freezed
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_SlabModelCopyWith<$Res> implements $SlabModelCopyWith<$Res> {
  factory _$$_SlabModelCopyWith(
          _$_SlabModel value, $Res Function(_$_SlabModel) then) =
      __$$_SlabModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? point,
      int? credit,
      int? cash,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$_SlabModelCopyWithImpl<$Res> extends _$SlabModelCopyWithImpl<$Res>
    implements _$$_SlabModelCopyWith<$Res> {
  __$$_SlabModelCopyWithImpl(
      _$_SlabModel _value, $Res Function(_$_SlabModel) _then)
      : super(_value, (v) => _then(v as _$_SlabModel));

  @override
  _$_SlabModel get _value => super._value as _$_SlabModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? point = freezed,
    Object? credit = freezed,
    Object? cash = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_SlabModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      credit: credit == freezed
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as int?,
      cash: cash == freezed
          ? _value.cash
          : cash // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlabModel extends _SlabModel {
  const _$_SlabModel(
      {this.id,
      this.point,
      this.credit,
      this.cash,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$_SlabModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlabModelFromJson(json);

  @override
  final int? id;
  @override
  final int? point;
  @override
  final int? credit;
  @override
  final int? cash;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SlabModel(id: $id, point: $point, credit: $credit, cash: $cash, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlabModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.credit, credit) &&
            const DeepCollectionEquality().equals(other.cash, cash) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(credit),
      const DeepCollectionEquality().hash(cash),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_SlabModelCopyWith<_$_SlabModel> get copyWith =>
      __$$_SlabModelCopyWithImpl<_$_SlabModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlabModelToJson(
      this,
    );
  }
}

abstract class _SlabModel extends SlabModel {
  const factory _SlabModel(
      {final int? id,
      final int? point,
      final int? credit,
      final int? cash,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_SlabModel;
  const _SlabModel._() : super._();

  factory _SlabModel.fromJson(Map<String, dynamic> json) =
      _$_SlabModel.fromJson;

  @override
  int? get id;
  @override
  int? get point;
  @override
  int? get credit;
  @override
  int? get cash;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SlabModelCopyWith<_$_SlabModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferralHistoryModel _$ReferralHistoryModelFromJson(Map<String, dynamic> json) {
  return _ReferralHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$ReferralHistoryModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_by')
  String? get referredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'redeem_id')
  String? get redeemId => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  RedeemModel? get redeem => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_credit')
  CreditModel? get orderCredit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferralHistoryModelCopyWith<ReferralHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralHistoryModelCopyWith<$Res> {
  factory $ReferralHistoryModelCopyWith(ReferralHistoryModel value,
          $Res Function(ReferralHistoryModel) then) =
      _$ReferralHistoryModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'redeem_id') String? redeemId,
      int? type,
      int? status,
      String? message,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      RedeemModel? redeem,
      @JsonKey(name: 'order_credit') CreditModel? orderCredit});

  $RedeemModelCopyWith<$Res>? get redeem;
  $CreditModelCopyWith<$Res>? get orderCredit;
}

/// @nodoc
class _$ReferralHistoryModelCopyWithImpl<$Res>
    implements $ReferralHistoryModelCopyWith<$Res> {
  _$ReferralHistoryModelCopyWithImpl(this._value, this._then);

  final ReferralHistoryModel _value;
  // ignore: unused_field
  final $Res Function(ReferralHistoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? customerId = freezed,
    Object? referredBy = freezed,
    Object? redeemId = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? redeem = freezed,
    Object? orderCredit = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: referredBy == freezed
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemId: redeemId == freezed
          ? _value.redeemId
          : redeemId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      redeem: redeem == freezed
          ? _value.redeem
          : redeem // ignore: cast_nullable_to_non_nullable
              as RedeemModel?,
      orderCredit: orderCredit == freezed
          ? _value.orderCredit
          : orderCredit // ignore: cast_nullable_to_non_nullable
              as CreditModel?,
    ));
  }

  @override
  $RedeemModelCopyWith<$Res>? get redeem {
    if (_value.redeem == null) {
      return null;
    }

    return $RedeemModelCopyWith<$Res>(_value.redeem!, (value) {
      return _then(_value.copyWith(redeem: value));
    });
  }

  @override
  $CreditModelCopyWith<$Res>? get orderCredit {
    if (_value.orderCredit == null) {
      return null;
    }

    return $CreditModelCopyWith<$Res>(_value.orderCredit!, (value) {
      return _then(_value.copyWith(orderCredit: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReferralHistoryModelCopyWith<$Res>
    implements $ReferralHistoryModelCopyWith<$Res> {
  factory _$$_ReferralHistoryModelCopyWith(_$_ReferralHistoryModel value,
          $Res Function(_$_ReferralHistoryModel) then) =
      __$$_ReferralHistoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'redeem_id') String? redeemId,
      int? type,
      int? status,
      String? message,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      RedeemModel? redeem,
      @JsonKey(name: 'order_credit') CreditModel? orderCredit});

  @override
  $RedeemModelCopyWith<$Res>? get redeem;
  @override
  $CreditModelCopyWith<$Res>? get orderCredit;
}

/// @nodoc
class __$$_ReferralHistoryModelCopyWithImpl<$Res>
    extends _$ReferralHistoryModelCopyWithImpl<$Res>
    implements _$$_ReferralHistoryModelCopyWith<$Res> {
  __$$_ReferralHistoryModelCopyWithImpl(_$_ReferralHistoryModel _value,
      $Res Function(_$_ReferralHistoryModel) _then)
      : super(_value, (v) => _then(v as _$_ReferralHistoryModel));

  @override
  _$_ReferralHistoryModel get _value => super._value as _$_ReferralHistoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? customerId = freezed,
    Object? referredBy = freezed,
    Object? redeemId = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? redeem = freezed,
    Object? orderCredit = freezed,
  }) {
    return _then(_$_ReferralHistoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: referredBy == freezed
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      redeemId: redeemId == freezed
          ? _value.redeemId
          : redeemId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      redeem: redeem == freezed
          ? _value.redeem
          : redeem // ignore: cast_nullable_to_non_nullable
              as RedeemModel?,
      orderCredit: orderCredit == freezed
          ? _value.orderCredit
          : orderCredit // ignore: cast_nullable_to_non_nullable
              as CreditModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferralHistoryModel extends _ReferralHistoryModel {
  const _$_ReferralHistoryModel(
      {this.id,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'referred_by') this.referredBy,
      @JsonKey(name: 'redeem_id') this.redeemId,
      this.type,
      this.status,
      this.message,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.redeem,
      @JsonKey(name: 'order_credit') this.orderCredit})
      : super._();

  factory _$_ReferralHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReferralHistoryModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final String? orderId;
  @override
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @override
  @JsonKey(name: 'referred_by')
  final String? referredBy;
  @override
  @JsonKey(name: 'redeem_id')
  final String? redeemId;
  @override
  final int? type;
  @override
  final int? status;
  @override
  final String? message;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final RedeemModel? redeem;
  @override
  @JsonKey(name: 'order_credit')
  final CreditModel? orderCredit;

  @override
  String toString() {
    return 'ReferralHistoryModel(id: $id, orderId: $orderId, customerId: $customerId, referredBy: $referredBy, redeemId: $redeemId, type: $type, status: $status, message: $message, createdAt: $createdAt, updatedAt: $updatedAt, redeem: $redeem, orderCredit: $orderCredit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferralHistoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            const DeepCollectionEquality()
                .equals(other.referredBy, referredBy) &&
            const DeepCollectionEquality().equals(other.redeemId, redeemId) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.redeem, redeem) &&
            const DeepCollectionEquality()
                .equals(other.orderCredit, orderCredit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(customerId),
      const DeepCollectionEquality().hash(referredBy),
      const DeepCollectionEquality().hash(redeemId),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(redeem),
      const DeepCollectionEquality().hash(orderCredit));

  @JsonKey(ignore: true)
  @override
  _$$_ReferralHistoryModelCopyWith<_$_ReferralHistoryModel> get copyWith =>
      __$$_ReferralHistoryModelCopyWithImpl<_$_ReferralHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferralHistoryModelToJson(
      this,
    );
  }
}

abstract class _ReferralHistoryModel extends ReferralHistoryModel {
  const factory _ReferralHistoryModel(
          {final int? id,
          @JsonKey(name: 'order_id') final String? orderId,
          @JsonKey(name: 'customer_id') final String? customerId,
          @JsonKey(name: 'referred_by') final String? referredBy,
          @JsonKey(name: 'redeem_id') final String? redeemId,
          final int? type,
          final int? status,
          final String? message,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          final RedeemModel? redeem,
          @JsonKey(name: 'order_credit') final CreditModel? orderCredit}) =
      _$_ReferralHistoryModel;
  const _ReferralHistoryModel._() : super._();

  factory _ReferralHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_ReferralHistoryModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_id')
  String? get orderId;
  @override
  @JsonKey(name: 'customer_id')
  String? get customerId;
  @override
  @JsonKey(name: 'referred_by')
  String? get referredBy;
  @override
  @JsonKey(name: 'redeem_id')
  String? get redeemId;
  @override
  int? get type;
  @override
  int? get status;
  @override
  String? get message;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  RedeemModel? get redeem;
  @override
  @JsonKey(name: 'order_credit')
  CreditModel? get orderCredit;
  @override
  @JsonKey(ignore: true)
  _$$_ReferralHistoryModelCopyWith<_$_ReferralHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RedeemModel _$RedeemModelFromJson(Map<String, dynamic> json) {
  return _RedeemModel.fromJson(json);
}

/// @nodoc
mixin _$RedeemModel {
  int? get id => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  int? get credits => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedeemModelCopyWith<RedeemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemModelCopyWith<$Res> {
  factory $RedeemModelCopyWith(
          RedeemModel value, $Res Function(RedeemModel) then) =
      _$RedeemModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      int? type,
      int? price,
      int? points,
      int? status,
      int? credits,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      bool isSelected});
}

/// @nodoc
class _$RedeemModelCopyWithImpl<$Res> implements $RedeemModelCopyWith<$Res> {
  _$RedeemModelCopyWithImpl(this._value, this._then);

  final RedeemModel _value;
  // ignore: unused_field
  final $Res Function(RedeemModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? points = freezed,
    Object? status = freezed,
    Object? credits = freezed,
    Object? customerId = freezed,
    Object? updatedAt = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RedeemModelCopyWith<$Res>
    implements $RedeemModelCopyWith<$Res> {
  factory _$$_RedeemModelCopyWith(
          _$_RedeemModel value, $Res Function(_$_RedeemModel) then) =
      __$$_RedeemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      int? type,
      int? price,
      int? points,
      int? status,
      int? credits,
      @JsonKey(name: 'customer_id') String? customerId,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      bool isSelected});
}

/// @nodoc
class __$$_RedeemModelCopyWithImpl<$Res> extends _$RedeemModelCopyWithImpl<$Res>
    implements _$$_RedeemModelCopyWith<$Res> {
  __$$_RedeemModelCopyWithImpl(
      _$_RedeemModel _value, $Res Function(_$_RedeemModel) _then)
      : super(_value, (v) => _then(v as _$_RedeemModel));

  @override
  _$_RedeemModel get _value => super._value as _$_RedeemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? points = freezed,
    Object? status = freezed,
    Object? credits = freezed,
    Object? customerId = freezed,
    Object? updatedAt = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_RedeemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RedeemModel extends _RedeemModel {
  const _$_RedeemModel(
      {this.id,
      this.type,
      this.price,
      this.points,
      this.status,
      this.credits,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.isSelected = false})
      : super._();

  factory _$_RedeemModel.fromJson(Map<String, dynamic> json) =>
      _$$_RedeemModelFromJson(json);

  @override
  final int? id;
  @override
  final int? type;
  @override
  final int? price;
  @override
  final int? points;
  @override
  final int? status;
  @override
  final int? credits;
  @override
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'RedeemModel(id: $id, type: $type, price: $price, points: $points, status: $status, credits: $credits, customerId: $customerId, updatedAt: $updatedAt, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedeemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.credits, credits) &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(points),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(credits),
      const DeepCollectionEquality().hash(customerId),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_RedeemModelCopyWith<_$_RedeemModel> get copyWith =>
      __$$_RedeemModelCopyWithImpl<_$_RedeemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RedeemModelToJson(
      this,
    );
  }
}

abstract class _RedeemModel extends RedeemModel {
  const factory _RedeemModel(
      {final int? id,
      final int? type,
      final int? price,
      final int? points,
      final int? status,
      final int? credits,
      @JsonKey(name: 'customer_id') final String? customerId,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final bool isSelected}) = _$_RedeemModel;
  const _RedeemModel._() : super._();

  factory _RedeemModel.fromJson(Map<String, dynamic> json) =
      _$_RedeemModel.fromJson;

  @override
  int? get id;
  @override
  int? get type;
  @override
  int? get price;
  @override
  int? get points;
  @override
  int? get status;
  @override
  int? get credits;
  @override
  @JsonKey(name: 'customer_id')
  String? get customerId;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_RedeemModelCopyWith<_$_RedeemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CreditModel _$CreditModelFromJson(Map<String, dynamic> json) {
  return _CreditModel.fromJson(json);
}

/// @nodoc
mixin _$CreditModel {
  int? get id => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditModelCopyWith<CreditModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditModelCopyWith<$Res> {
  factory $CreditModelCopyWith(
          CreditModel value, $Res Function(CreditModel) then) =
      _$CreditModelCopyWithImpl<$Res>;
  $Res call({int? id, int? points});
}

/// @nodoc
class _$CreditModelCopyWithImpl<$Res> implements $CreditModelCopyWith<$Res> {
  _$CreditModelCopyWithImpl(this._value, this._then);

  final CreditModel _value;
  // ignore: unused_field
  final $Res Function(CreditModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_CreditModelCopyWith<$Res>
    implements $CreditModelCopyWith<$Res> {
  factory _$$_CreditModelCopyWith(
          _$_CreditModel value, $Res Function(_$_CreditModel) then) =
      __$$_CreditModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, int? points});
}

/// @nodoc
class __$$_CreditModelCopyWithImpl<$Res> extends _$CreditModelCopyWithImpl<$Res>
    implements _$$_CreditModelCopyWith<$Res> {
  __$$_CreditModelCopyWithImpl(
      _$_CreditModel _value, $Res Function(_$_CreditModel) _then)
      : super(_value, (v) => _then(v as _$_CreditModel));

  @override
  _$_CreditModel get _value => super._value as _$_CreditModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? points = freezed,
  }) {
    return _then(_$_CreditModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreditModel extends _CreditModel {
  const _$_CreditModel({this.id, this.points}) : super._();

  factory _$_CreditModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreditModelFromJson(json);

  @override
  final int? id;
  @override
  final int? points;

  @override
  String toString() {
    return 'CreditModel(id: $id, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreditModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.points, points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(points));

  @JsonKey(ignore: true)
  @override
  _$$_CreditModelCopyWith<_$_CreditModel> get copyWith =>
      __$$_CreditModelCopyWithImpl<_$_CreditModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreditModelToJson(
      this,
    );
  }
}

abstract class _CreditModel extends CreditModel {
  const factory _CreditModel({final int? id, final int? points}) =
      _$_CreditModel;
  const _CreditModel._() : super._();

  factory _CreditModel.fromJson(Map<String, dynamic> json) =
      _$_CreditModel.fromJson;

  @override
  int? get id;
  @override
  int? get points;
  @override
  @JsonKey(ignore: true)
  _$$_CreditModelCopyWith<_$_CreditModel> get copyWith =>
      throw _privateConstructorUsedError;
}
