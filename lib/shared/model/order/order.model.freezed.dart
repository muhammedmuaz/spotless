// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivePlanModel _$ActivePlanModelFromJson(Map<String, dynamic> json) {
  return _ActivePlanModel.fromJson(json);
}

/// @nodoc
mixin _$ActivePlanModel {
  @JsonKey(name: 'active_plan_status')
  int? get planeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_expired')
  bool? get isExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_till')
  String? get validTill => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_name')
  String? get subscriptionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_price')
  int? get subscriptionPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription_duration_type')
  int? get subscriptionDurationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_qty')
  int? get totalQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_qty')
  int? get usedQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_qty')
  int? get balanceQty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivePlanModelCopyWith<ActivePlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivePlanModelCopyWith<$Res> {
  factory $ActivePlanModelCopyWith(
          ActivePlanModel value, $Res Function(ActivePlanModel) then) =
      _$ActivePlanModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'active_plan_status')
          int? planeStatus,
      @JsonKey(name: 'is_expired')
          bool? isExpired,
      @JsonKey(name: 'valid_till')
          String? validTill,
      @JsonKey(name: 'subscription_name')
          String? subscriptionName,
      @JsonKey(name: 'subscription_price')
          int? subscriptionPrice,
      @JsonKey(name: 'subscription_duration_type')
          int? subscriptionDurationType,
      @JsonKey(name: 'total_qty')
          int? totalQty,
      @JsonKey(name: 'used_qty')
          int? usedQty,
      @JsonKey(name: 'balance_qty')
          int? balanceQty});
}

/// @nodoc
class _$ActivePlanModelCopyWithImpl<$Res>
    implements $ActivePlanModelCopyWith<$Res> {
  _$ActivePlanModelCopyWithImpl(this._value, this._then);

  final ActivePlanModel _value;
  // ignore: unused_field
  final $Res Function(ActivePlanModel) _then;

  @override
  $Res call({
    Object? planeStatus = freezed,
    Object? isExpired = freezed,
    Object? validTill = freezed,
    Object? subscriptionName = freezed,
    Object? subscriptionPrice = freezed,
    Object? subscriptionDurationType = freezed,
    Object? totalQty = freezed,
    Object? usedQty = freezed,
    Object? balanceQty = freezed,
  }) {
    return _then(_value.copyWith(
      planeStatus: planeStatus == freezed
          ? _value.planeStatus
          : planeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      validTill: validTill == freezed
          ? _value.validTill
          : validTill // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionName: subscriptionName == freezed
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionPrice: subscriptionPrice == freezed
          ? _value.subscriptionPrice
          : subscriptionPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionDurationType: subscriptionDurationType == freezed
          ? _value.subscriptionDurationType
          : subscriptionDurationType // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: totalQty == freezed
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      usedQty: usedQty == freezed
          ? _value.usedQty
          : usedQty // ignore: cast_nullable_to_non_nullable
              as int?,
      balanceQty: balanceQty == freezed
          ? _value.balanceQty
          : balanceQty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ActivePlanModelCopyWith<$Res>
    implements $ActivePlanModelCopyWith<$Res> {
  factory _$$_ActivePlanModelCopyWith(
          _$_ActivePlanModel value, $Res Function(_$_ActivePlanModel) then) =
      __$$_ActivePlanModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'active_plan_status')
          int? planeStatus,
      @JsonKey(name: 'is_expired')
          bool? isExpired,
      @JsonKey(name: 'valid_till')
          String? validTill,
      @JsonKey(name: 'subscription_name')
          String? subscriptionName,
      @JsonKey(name: 'subscription_price')
          int? subscriptionPrice,
      @JsonKey(name: 'subscription_duration_type')
          int? subscriptionDurationType,
      @JsonKey(name: 'total_qty')
          int? totalQty,
      @JsonKey(name: 'used_qty')
          int? usedQty,
      @JsonKey(name: 'balance_qty')
          int? balanceQty});
}

/// @nodoc
class __$$_ActivePlanModelCopyWithImpl<$Res>
    extends _$ActivePlanModelCopyWithImpl<$Res>
    implements _$$_ActivePlanModelCopyWith<$Res> {
  __$$_ActivePlanModelCopyWithImpl(
      _$_ActivePlanModel _value, $Res Function(_$_ActivePlanModel) _then)
      : super(_value, (v) => _then(v as _$_ActivePlanModel));

  @override
  _$_ActivePlanModel get _value => super._value as _$_ActivePlanModel;

  @override
  $Res call({
    Object? planeStatus = freezed,
    Object? isExpired = freezed,
    Object? validTill = freezed,
    Object? subscriptionName = freezed,
    Object? subscriptionPrice = freezed,
    Object? subscriptionDurationType = freezed,
    Object? totalQty = freezed,
    Object? usedQty = freezed,
    Object? balanceQty = freezed,
  }) {
    return _then(_$_ActivePlanModel(
      planeStatus: planeStatus == freezed
          ? _value.planeStatus
          : planeStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpired: isExpired == freezed
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      validTill: validTill == freezed
          ? _value.validTill
          : validTill // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionName: subscriptionName == freezed
          ? _value.subscriptionName
          : subscriptionName // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriptionPrice: subscriptionPrice == freezed
          ? _value.subscriptionPrice
          : subscriptionPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptionDurationType: subscriptionDurationType == freezed
          ? _value.subscriptionDurationType
          : subscriptionDurationType // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQty: totalQty == freezed
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int?,
      usedQty: usedQty == freezed
          ? _value.usedQty
          : usedQty // ignore: cast_nullable_to_non_nullable
              as int?,
      balanceQty: balanceQty == freezed
          ? _value.balanceQty
          : balanceQty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivePlanModel extends _ActivePlanModel {
  const _$_ActivePlanModel(
      {@JsonKey(name: 'active_plan_status')
          this.planeStatus,
      @JsonKey(name: 'is_expired')
          this.isExpired,
      @JsonKey(name: 'valid_till')
          this.validTill,
      @JsonKey(name: 'subscription_name')
          this.subscriptionName,
      @JsonKey(name: 'subscription_price')
          this.subscriptionPrice,
      @JsonKey(name: 'subscription_duration_type')
          this.subscriptionDurationType,
      @JsonKey(name: 'total_qty')
          this.totalQty,
      @JsonKey(name: 'used_qty')
          this.usedQty,
      @JsonKey(name: 'balance_qty')
          this.balanceQty})
      : super._();

  factory _$_ActivePlanModel.fromJson(Map<String, dynamic> json) =>
      _$$_ActivePlanModelFromJson(json);

  @override
  @JsonKey(name: 'active_plan_status')
  final int? planeStatus;
  @override
  @JsonKey(name: 'is_expired')
  final bool? isExpired;
  @override
  @JsonKey(name: 'valid_till')
  final String? validTill;
  @override
  @JsonKey(name: 'subscription_name')
  final String? subscriptionName;
  @override
  @JsonKey(name: 'subscription_price')
  final int? subscriptionPrice;
  @override
  @JsonKey(name: 'subscription_duration_type')
  final int? subscriptionDurationType;
  @override
  @JsonKey(name: 'total_qty')
  final int? totalQty;
  @override
  @JsonKey(name: 'used_qty')
  final int? usedQty;
  @override
  @JsonKey(name: 'balance_qty')
  final int? balanceQty;

  @override
  String toString() {
    return 'ActivePlanModel(planeStatus: $planeStatus, isExpired: $isExpired, validTill: $validTill, subscriptionName: $subscriptionName, subscriptionPrice: $subscriptionPrice, subscriptionDurationType: $subscriptionDurationType, totalQty: $totalQty, usedQty: $usedQty, balanceQty: $balanceQty)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActivePlanModel &&
            const DeepCollectionEquality()
                .equals(other.planeStatus, planeStatus) &&
            const DeepCollectionEquality().equals(other.isExpired, isExpired) &&
            const DeepCollectionEquality().equals(other.validTill, validTill) &&
            const DeepCollectionEquality()
                .equals(other.subscriptionName, subscriptionName) &&
            const DeepCollectionEquality()
                .equals(other.subscriptionPrice, subscriptionPrice) &&
            const DeepCollectionEquality().equals(
                other.subscriptionDurationType, subscriptionDurationType) &&
            const DeepCollectionEquality().equals(other.totalQty, totalQty) &&
            const DeepCollectionEquality().equals(other.usedQty, usedQty) &&
            const DeepCollectionEquality()
                .equals(other.balanceQty, balanceQty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(planeStatus),
      const DeepCollectionEquality().hash(isExpired),
      const DeepCollectionEquality().hash(validTill),
      const DeepCollectionEquality().hash(subscriptionName),
      const DeepCollectionEquality().hash(subscriptionPrice),
      const DeepCollectionEquality().hash(subscriptionDurationType),
      const DeepCollectionEquality().hash(totalQty),
      const DeepCollectionEquality().hash(usedQty),
      const DeepCollectionEquality().hash(balanceQty));

  @JsonKey(ignore: true)
  @override
  _$$_ActivePlanModelCopyWith<_$_ActivePlanModel> get copyWith =>
      __$$_ActivePlanModelCopyWithImpl<_$_ActivePlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivePlanModelToJson(
      this,
    );
  }
}

abstract class _ActivePlanModel extends ActivePlanModel {
  const factory _ActivePlanModel(
      {@JsonKey(name: 'active_plan_status')
          final int? planeStatus,
      @JsonKey(name: 'is_expired')
          final bool? isExpired,
      @JsonKey(name: 'valid_till')
          final String? validTill,
      @JsonKey(name: 'subscription_name')
          final String? subscriptionName,
      @JsonKey(name: 'subscription_price')
          final int? subscriptionPrice,
      @JsonKey(name: 'subscription_duration_type')
          final int? subscriptionDurationType,
      @JsonKey(name: 'total_qty')
          final int? totalQty,
      @JsonKey(name: 'used_qty')
          final int? usedQty,
      @JsonKey(name: 'balance_qty')
          final int? balanceQty}) = _$_ActivePlanModel;
  const _ActivePlanModel._() : super._();

  factory _ActivePlanModel.fromJson(Map<String, dynamic> json) =
      _$_ActivePlanModel.fromJson;

  @override
  @JsonKey(name: 'active_plan_status')
  int? get planeStatus;
  @override
  @JsonKey(name: 'is_expired')
  bool? get isExpired;
  @override
  @JsonKey(name: 'valid_till')
  String? get validTill;
  @override
  @JsonKey(name: 'subscription_name')
  String? get subscriptionName;
  @override
  @JsonKey(name: 'subscription_price')
  int? get subscriptionPrice;
  @override
  @JsonKey(name: 'subscription_duration_type')
  int? get subscriptionDurationType;
  @override
  @JsonKey(name: 'total_qty')
  int? get totalQty;
  @override
  @JsonKey(name: 'used_qty')
  int? get usedQty;
  @override
  @JsonKey(name: 'balance_qty')
  int? get balanceQty;
  @override
  @JsonKey(ignore: true)
  _$$_ActivePlanModelCopyWith<_$_ActivePlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  int? get totalQuantity => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'total_quantity') int? totalQuantity,
      int? status,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  final OrderModel _value;
  // ignore: unused_field
  final $Res Function(OrderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? totalQuantity = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
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
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'total_quantity') int? totalQuantity,
      int? status,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res> extends _$OrderModelCopyWithImpl<$Res>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, (v) => _then(v as _$_OrderModel));

  @override
  _$_OrderModel get _value => super._value as _$_OrderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? totalQuantity = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_OrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel extends _OrderModel {
  const _$_OrderModel(
      {this.id,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'total_quantity') this.totalQuantity,
      this.status,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final String? orderId;
  @override
  @JsonKey(name: 'total_quantity')
  final int? totalQuantity;
  @override
  final int? status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OrderModel(id: $id, orderId: $orderId, totalQuantity: $totalQuantity, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel extends OrderModel {
  const factory _OrderModel(
      {final int? id,
      @JsonKey(name: 'order_id') final String? orderId,
      @JsonKey(name: 'total_quantity') final int? totalQuantity,
      final int? status,
      @JsonKey(name: 'created_at') final DateTime? createdAt}) = _$_OrderModel;
  const _OrderModel._() : super._();

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_id')
  String? get orderId;
  @override
  @JsonKey(name: 'total_quantity')
  int? get totalQuantity;
  @override
  int? get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleOrderModel _$SingleOrderModelFromJson(Map<String, dynamic> json) {
  return _SingleOrderModel.fromJson(json);
}

/// @nodoc
mixin _$SingleOrderModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  DateTime? get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  int? get totalQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_credits')
  int? get totalCredits => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_address')
  AddressModel? get pickupAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  AddressModel? get deliveryAddress => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_date')
  DateTime? get pickupDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_time')
  String? get pickupTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_details')
  List<OrderDetailsModel>? get orderDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleOrderModelCopyWith<SingleOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleOrderModelCopyWith<$Res> {
  factory $SingleOrderModelCopyWith(
          SingleOrderModel value, $Res Function(SingleOrderModel) then) =
      _$SingleOrderModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'service_id') DateTime? orderDate,
      @JsonKey(name: 'total_quantity') int? totalQuantity,
      @JsonKey(name: 'total_credits') int? totalCredits,
      @JsonKey(name: 'pickup_address') AddressModel? pickupAddress,
      @JsonKey(name: 'delivery_address') AddressModel? deliveryAddress,
      int? status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'pickup_date') DateTime? pickupDate,
      @JsonKey(name: 'pickup_time') String? pickupTime,
      @JsonKey(name: 'order_details') List<OrderDetailsModel>? orderDetails});

  $AddressModelCopyWith<$Res>? get pickupAddress;
  $AddressModelCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class _$SingleOrderModelCopyWithImpl<$Res>
    implements $SingleOrderModelCopyWith<$Res> {
  _$SingleOrderModelCopyWithImpl(this._value, this._then);

  final SingleOrderModel _value;
  // ignore: unused_field
  final $Res Function(SingleOrderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? orderDate = freezed,
    Object? totalQuantity = freezed,
    Object? totalCredits = freezed,
    Object? pickupAddress = freezed,
    Object? deliveryAddress = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? pickupDate = freezed,
    Object? pickupTime = freezed,
    Object? orderDetails = freezed,
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
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCredits: totalCredits == freezed
          ? _value.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int?,
      pickupAddress: pickupAddress == freezed
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      deliveryAddress: deliveryAddress == freezed
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickupDate: pickupDate == freezed
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickupTime: pickupTime == freezed
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderDetails: orderDetails == freezed
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailsModel>?,
    ));
  }

  @override
  $AddressModelCopyWith<$Res>? get pickupAddress {
    if (_value.pickupAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.pickupAddress!, (value) {
      return _then(_value.copyWith(pickupAddress: value));
    });
  }

  @override
  $AddressModelCopyWith<$Res>? get deliveryAddress {
    if (_value.deliveryAddress == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.deliveryAddress!, (value) {
      return _then(_value.copyWith(deliveryAddress: value));
    });
  }
}

/// @nodoc
abstract class _$$_SingleOrderModelCopyWith<$Res>
    implements $SingleOrderModelCopyWith<$Res> {
  factory _$$_SingleOrderModelCopyWith(
          _$_SingleOrderModel value, $Res Function(_$_SingleOrderModel) then) =
      __$$_SingleOrderModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') String? orderId,
      @JsonKey(name: 'service_id') DateTime? orderDate,
      @JsonKey(name: 'total_quantity') int? totalQuantity,
      @JsonKey(name: 'total_credits') int? totalCredits,
      @JsonKey(name: 'pickup_address') AddressModel? pickupAddress,
      @JsonKey(name: 'delivery_address') AddressModel? deliveryAddress,
      int? status,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'pickup_date') DateTime? pickupDate,
      @JsonKey(name: 'pickup_time') String? pickupTime,
      @JsonKey(name: 'order_details') List<OrderDetailsModel>? orderDetails});

  @override
  $AddressModelCopyWith<$Res>? get pickupAddress;
  @override
  $AddressModelCopyWith<$Res>? get deliveryAddress;
}

/// @nodoc
class __$$_SingleOrderModelCopyWithImpl<$Res>
    extends _$SingleOrderModelCopyWithImpl<$Res>
    implements _$$_SingleOrderModelCopyWith<$Res> {
  __$$_SingleOrderModelCopyWithImpl(
      _$_SingleOrderModel _value, $Res Function(_$_SingleOrderModel) _then)
      : super(_value, (v) => _then(v as _$_SingleOrderModel));

  @override
  _$_SingleOrderModel get _value => super._value as _$_SingleOrderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? orderDate = freezed,
    Object? totalQuantity = freezed,
    Object? totalCredits = freezed,
    Object? pickupAddress = freezed,
    Object? deliveryAddress = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? pickupDate = freezed,
    Object? pickupTime = freezed,
    Object? orderDetails = freezed,
  }) {
    return _then(_$_SingleOrderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderDate: orderDate == freezed
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalQuantity: totalQuantity == freezed
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalCredits: totalCredits == freezed
          ? _value.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int?,
      pickupAddress: pickupAddress == freezed
          ? _value.pickupAddress
          : pickupAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      deliveryAddress: deliveryAddress == freezed
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickupDate: pickupDate == freezed
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickupTime: pickupTime == freezed
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      orderDetails: orderDetails == freezed
          ? _value._orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleOrderModel extends _SingleOrderModel {
  const _$_SingleOrderModel(
      {this.id,
      @JsonKey(name: 'order_id')
          this.orderId,
      @JsonKey(name: 'service_id')
          this.orderDate,
      @JsonKey(name: 'total_quantity')
          this.totalQuantity,
      @JsonKey(name: 'total_credits')
          this.totalCredits,
      @JsonKey(name: 'pickup_address')
          this.pickupAddress,
      @JsonKey(name: 'delivery_address')
          this.deliveryAddress,
      this.status,
      @JsonKey(name: 'created_at')
          this.createdAt,
      @JsonKey(name: 'pickup_date')
          this.pickupDate,
      @JsonKey(name: 'pickup_time')
          this.pickupTime,
      @JsonKey(name: 'order_details')
          final List<OrderDetailsModel>? orderDetails})
      : _orderDetails = orderDetails,
        super._();

  factory _$_SingleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_SingleOrderModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final String? orderId;
  @override
  @JsonKey(name: 'service_id')
  final DateTime? orderDate;
  @override
  @JsonKey(name: 'total_quantity')
  final int? totalQuantity;
  @override
  @JsonKey(name: 'total_credits')
  final int? totalCredits;
  @override
  @JsonKey(name: 'pickup_address')
  final AddressModel? pickupAddress;
  @override
  @JsonKey(name: 'delivery_address')
  final AddressModel? deliveryAddress;
  @override
  final int? status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'pickup_date')
  final DateTime? pickupDate;
  @override
  @JsonKey(name: 'pickup_time')
  final String? pickupTime;
  final List<OrderDetailsModel>? _orderDetails;
  @override
  @JsonKey(name: 'order_details')
  List<OrderDetailsModel>? get orderDetails {
    final value = _orderDetails;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SingleOrderModel(id: $id, orderId: $orderId, orderDate: $orderDate, totalQuantity: $totalQuantity, totalCredits: $totalCredits, pickupAddress: $pickupAddress, deliveryAddress: $deliveryAddress, status: $status, createdAt: $createdAt, pickupDate: $pickupDate, pickupTime: $pickupTime, orderDetails: $orderDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleOrderModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.orderDate, orderDate) &&
            const DeepCollectionEquality()
                .equals(other.totalQuantity, totalQuantity) &&
            const DeepCollectionEquality()
                .equals(other.totalCredits, totalCredits) &&
            const DeepCollectionEquality()
                .equals(other.pickupAddress, pickupAddress) &&
            const DeepCollectionEquality()
                .equals(other.deliveryAddress, deliveryAddress) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.pickupDate, pickupDate) &&
            const DeepCollectionEquality()
                .equals(other.pickupTime, pickupTime) &&
            const DeepCollectionEquality()
                .equals(other._orderDetails, _orderDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(orderDate),
      const DeepCollectionEquality().hash(totalQuantity),
      const DeepCollectionEquality().hash(totalCredits),
      const DeepCollectionEquality().hash(pickupAddress),
      const DeepCollectionEquality().hash(deliveryAddress),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(pickupDate),
      const DeepCollectionEquality().hash(pickupTime),
      const DeepCollectionEquality().hash(_orderDetails));

  @JsonKey(ignore: true)
  @override
  _$$_SingleOrderModelCopyWith<_$_SingleOrderModel> get copyWith =>
      __$$_SingleOrderModelCopyWithImpl<_$_SingleOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleOrderModelToJson(
      this,
    );
  }
}

abstract class _SingleOrderModel extends SingleOrderModel {
  const factory _SingleOrderModel(
      {final int? id,
      @JsonKey(name: 'order_id')
          final String? orderId,
      @JsonKey(name: 'service_id')
          final DateTime? orderDate,
      @JsonKey(name: 'total_quantity')
          final int? totalQuantity,
      @JsonKey(name: 'total_credits')
          final int? totalCredits,
      @JsonKey(name: 'pickup_address')
          final AddressModel? pickupAddress,
      @JsonKey(name: 'delivery_address')
          final AddressModel? deliveryAddress,
      final int? status,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'pickup_date')
          final DateTime? pickupDate,
      @JsonKey(name: 'pickup_time')
          final String? pickupTime,
      @JsonKey(name: 'order_details')
          final List<OrderDetailsModel>? orderDetails}) = _$_SingleOrderModel;
  const _SingleOrderModel._() : super._();

  factory _SingleOrderModel.fromJson(Map<String, dynamic> json) =
      _$_SingleOrderModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_id')
  String? get orderId;
  @override
  @JsonKey(name: 'service_id')
  DateTime? get orderDate;
  @override
  @JsonKey(name: 'total_quantity')
  int? get totalQuantity;
  @override
  @JsonKey(name: 'total_credits')
  int? get totalCredits;
  @override
  @JsonKey(name: 'pickup_address')
  AddressModel? get pickupAddress;
  @override
  @JsonKey(name: 'delivery_address')
  AddressModel? get deliveryAddress;
  @override
  int? get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'pickup_date')
  DateTime? get pickupDate;
  @override
  @JsonKey(name: 'pickup_time')
  String? get pickupTime;
  @override
  @JsonKey(name: 'order_details')
  List<OrderDetailsModel>? get orderDetails;
  @override
  @JsonKey(ignore: true)
  _$$_SingleOrderModelCopyWith<_$_SingleOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) {
  return _OrderDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailsModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  int? get serviceId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get credits => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  ServiceModel? get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsModelCopyWith<OrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsModelCopyWith<$Res> {
  factory $OrderDetailsModelCopyWith(
          OrderDetailsModel value, $Res Function(OrderDetailsModel) then) =
      _$OrderDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'service_id') int? serviceId,
      String? name,
      int? credits,
      int? quantity,
      int? total,
      ServiceModel? service});

  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class _$OrderDetailsModelCopyWithImpl<$Res>
    implements $OrderDetailsModelCopyWith<$Res> {
  _$OrderDetailsModelCopyWithImpl(this._value, this._then);

  final OrderDetailsModel _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? serviceId = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
    ));
  }

  @override
  $ServiceModelCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceModelCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value));
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailsModelCopyWith<$Res>
    implements $OrderDetailsModelCopyWith<$Res> {
  factory _$$_OrderDetailsModelCopyWith(_$_OrderDetailsModel value,
          $Res Function(_$_OrderDetailsModel) then) =
      __$$_OrderDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'service_id') int? serviceId,
      String? name,
      int? credits,
      int? quantity,
      int? total,
      ServiceModel? service});

  @override
  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class __$$_OrderDetailsModelCopyWithImpl<$Res>
    extends _$OrderDetailsModelCopyWithImpl<$Res>
    implements _$$_OrderDetailsModelCopyWith<$Res> {
  __$$_OrderDetailsModelCopyWithImpl(
      _$_OrderDetailsModel _value, $Res Function(_$_OrderDetailsModel) _then)
      : super(_value, (v) => _then(v as _$_OrderDetailsModel));

  @override
  _$_OrderDetailsModel get _value => super._value as _$_OrderDetailsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? serviceId = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
    Object? service = freezed,
  }) {
    return _then(_$_OrderDetailsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as ServiceModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetailsModel extends _OrderDetailsModel {
  const _$_OrderDetailsModel(
      {this.id,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'service_id') this.serviceId,
      this.name,
      this.credits,
      this.quantity,
      this.total,
      this.service})
      : super._();

  factory _$_OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailsModelFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'service_id')
  final int? serviceId;
  @override
  final String? name;
  @override
  final int? credits;
  @override
  final int? quantity;
  @override
  final int? total;
  @override
  final ServiceModel? service;

  @override
  String toString() {
    return 'OrderDetailsModel(id: $id, orderId: $orderId, serviceId: $serviceId, name: $name, credits: $credits, quantity: $quantity, total: $total, service: $service)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.orderId, orderId) &&
            const DeepCollectionEquality().equals(other.serviceId, serviceId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.credits, credits) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.service, service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(orderId),
      const DeepCollectionEquality().hash(serviceId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(credits),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(service));

  @JsonKey(ignore: true)
  @override
  _$$_OrderDetailsModelCopyWith<_$_OrderDetailsModel> get copyWith =>
      __$$_OrderDetailsModelCopyWithImpl<_$_OrderDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailsModelToJson(
      this,
    );
  }
}

abstract class _OrderDetailsModel extends OrderDetailsModel {
  const factory _OrderDetailsModel(
      {final int? id,
      @JsonKey(name: 'order_id') final int? orderId,
      @JsonKey(name: 'service_id') final int? serviceId,
      final String? name,
      final int? credits,
      final int? quantity,
      final int? total,
      final ServiceModel? service}) = _$_OrderDetailsModel;
  const _OrderDetailsModel._() : super._();

  factory _OrderDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_OrderDetailsModel.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId;
  @override
  @JsonKey(name: 'service_id')
  int? get serviceId;
  @override
  String? get name;
  @override
  int? get credits;
  @override
  int? get quantity;
  @override
  int? get total;
  @override
  ServiceModel? get service;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsModelCopyWith<_$_OrderDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

orderValueModel _$orderValueModelFromJson(Map<String, dynamic> json) {
  return _orderValueModel.fromJson(json);
}

/// @nodoc
mixin _$orderValueModel {
  @JsonKey(name: 'all_orders')
  int? get allOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_orders')
  int? get pendingOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'accepted_orders')
  int? get acceptedOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_for_pickup_orders')
  int? get outForPickupOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejected_orders')
  int? get rejectedOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing_orders')
  int? get processingOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'ready_for_delivery_orders')
  int? get readyForDeliveryOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_for_delivery_orders')
  int? get outForDeliveryOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivered_orders')
  int? get deliveredOrders => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_orders')
  int? get receivedOrders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $orderValueModelCopyWith<orderValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $orderValueModelCopyWith<$Res> {
  factory $orderValueModelCopyWith(
          orderValueModel value, $Res Function(orderValueModel) then) =
      _$orderValueModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'all_orders') int? allOrders,
      @JsonKey(name: 'pending_orders') int? pendingOrders,
      @JsonKey(name: 'accepted_orders') int? acceptedOrders,
      @JsonKey(name: 'out_for_pickup_orders') int? outForPickupOrders,
      @JsonKey(name: 'rejected_orders') int? rejectedOrders,
      @JsonKey(name: 'processing_orders') int? processingOrders,
      @JsonKey(name: 'ready_for_delivery_orders') int? readyForDeliveryOrders,
      @JsonKey(name: 'out_for_delivery_orders') int? outForDeliveryOrders,
      @JsonKey(name: 'delivered_orders') int? deliveredOrders,
      @JsonKey(name: 'received_orders') int? receivedOrders});
}

/// @nodoc
class _$orderValueModelCopyWithImpl<$Res>
    implements $orderValueModelCopyWith<$Res> {
  _$orderValueModelCopyWithImpl(this._value, this._then);

  final orderValueModel _value;
  // ignore: unused_field
  final $Res Function(orderValueModel) _then;

  @override
  $Res call({
    Object? allOrders = freezed,
    Object? pendingOrders = freezed,
    Object? acceptedOrders = freezed,
    Object? outForPickupOrders = freezed,
    Object? rejectedOrders = freezed,
    Object? processingOrders = freezed,
    Object? readyForDeliveryOrders = freezed,
    Object? outForDeliveryOrders = freezed,
    Object? deliveredOrders = freezed,
    Object? receivedOrders = freezed,
  }) {
    return _then(_value.copyWith(
      allOrders: allOrders == freezed
          ? _value.allOrders
          : allOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptedOrders: acceptedOrders == freezed
          ? _value.acceptedOrders
          : acceptedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      outForPickupOrders: outForPickupOrders == freezed
          ? _value.outForPickupOrders
          : outForPickupOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectedOrders: rejectedOrders == freezed
          ? _value.rejectedOrders
          : rejectedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      processingOrders: processingOrders == freezed
          ? _value.processingOrders
          : processingOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      readyForDeliveryOrders: readyForDeliveryOrders == freezed
          ? _value.readyForDeliveryOrders
          : readyForDeliveryOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      outForDeliveryOrders: outForDeliveryOrders == freezed
          ? _value.outForDeliveryOrders
          : outForDeliveryOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveredOrders: deliveredOrders == freezed
          ? _value.deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedOrders: receivedOrders == freezed
          ? _value.receivedOrders
          : receivedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_orderValueModelCopyWith<$Res>
    implements $orderValueModelCopyWith<$Res> {
  factory _$$_orderValueModelCopyWith(
          _$_orderValueModel value, $Res Function(_$_orderValueModel) then) =
      __$$_orderValueModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'all_orders') int? allOrders,
      @JsonKey(name: 'pending_orders') int? pendingOrders,
      @JsonKey(name: 'accepted_orders') int? acceptedOrders,
      @JsonKey(name: 'out_for_pickup_orders') int? outForPickupOrders,
      @JsonKey(name: 'rejected_orders') int? rejectedOrders,
      @JsonKey(name: 'processing_orders') int? processingOrders,
      @JsonKey(name: 'ready_for_delivery_orders') int? readyForDeliveryOrders,
      @JsonKey(name: 'out_for_delivery_orders') int? outForDeliveryOrders,
      @JsonKey(name: 'delivered_orders') int? deliveredOrders,
      @JsonKey(name: 'received_orders') int? receivedOrders});
}

/// @nodoc
class __$$_orderValueModelCopyWithImpl<$Res>
    extends _$orderValueModelCopyWithImpl<$Res>
    implements _$$_orderValueModelCopyWith<$Res> {
  __$$_orderValueModelCopyWithImpl(
      _$_orderValueModel _value, $Res Function(_$_orderValueModel) _then)
      : super(_value, (v) => _then(v as _$_orderValueModel));

  @override
  _$_orderValueModel get _value => super._value as _$_orderValueModel;

  @override
  $Res call({
    Object? allOrders = freezed,
    Object? pendingOrders = freezed,
    Object? acceptedOrders = freezed,
    Object? outForPickupOrders = freezed,
    Object? rejectedOrders = freezed,
    Object? processingOrders = freezed,
    Object? readyForDeliveryOrders = freezed,
    Object? outForDeliveryOrders = freezed,
    Object? deliveredOrders = freezed,
    Object? receivedOrders = freezed,
  }) {
    return _then(_$_orderValueModel(
      allOrders: allOrders == freezed
          ? _value.allOrders
          : allOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingOrders: pendingOrders == freezed
          ? _value.pendingOrders
          : pendingOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptedOrders: acceptedOrders == freezed
          ? _value.acceptedOrders
          : acceptedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      outForPickupOrders: outForPickupOrders == freezed
          ? _value.outForPickupOrders
          : outForPickupOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      rejectedOrders: rejectedOrders == freezed
          ? _value.rejectedOrders
          : rejectedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      processingOrders: processingOrders == freezed
          ? _value.processingOrders
          : processingOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      readyForDeliveryOrders: readyForDeliveryOrders == freezed
          ? _value.readyForDeliveryOrders
          : readyForDeliveryOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      outForDeliveryOrders: outForDeliveryOrders == freezed
          ? _value.outForDeliveryOrders
          : outForDeliveryOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveredOrders: deliveredOrders == freezed
          ? _value.deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedOrders: receivedOrders == freezed
          ? _value.receivedOrders
          : receivedOrders // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_orderValueModel extends _orderValueModel {
  const _$_orderValueModel(
      {@JsonKey(name: 'all_orders') this.allOrders,
      @JsonKey(name: 'pending_orders') this.pendingOrders,
      @JsonKey(name: 'accepted_orders') this.acceptedOrders,
      @JsonKey(name: 'out_for_pickup_orders') this.outForPickupOrders,
      @JsonKey(name: 'rejected_orders') this.rejectedOrders,
      @JsonKey(name: 'processing_orders') this.processingOrders,
      @JsonKey(name: 'ready_for_delivery_orders') this.readyForDeliveryOrders,
      @JsonKey(name: 'out_for_delivery_orders') this.outForDeliveryOrders,
      @JsonKey(name: 'delivered_orders') this.deliveredOrders,
      @JsonKey(name: 'received_orders') this.receivedOrders})
      : super._();

  factory _$_orderValueModel.fromJson(Map<String, dynamic> json) =>
      _$$_orderValueModelFromJson(json);

  @override
  @JsonKey(name: 'all_orders')
  final int? allOrders;
  @override
  @JsonKey(name: 'pending_orders')
  final int? pendingOrders;
  @override
  @JsonKey(name: 'accepted_orders')
  final int? acceptedOrders;
  @override
  @JsonKey(name: 'out_for_pickup_orders')
  final int? outForPickupOrders;
  @override
  @JsonKey(name: 'rejected_orders')
  final int? rejectedOrders;
  @override
  @JsonKey(name: 'processing_orders')
  final int? processingOrders;
  @override
  @JsonKey(name: 'ready_for_delivery_orders')
  final int? readyForDeliveryOrders;
  @override
  @JsonKey(name: 'out_for_delivery_orders')
  final int? outForDeliveryOrders;
  @override
  @JsonKey(name: 'delivered_orders')
  final int? deliveredOrders;
  @override
  @JsonKey(name: 'received_orders')
  final int? receivedOrders;

  @override
  String toString() {
    return 'orderValueModel(allOrders: $allOrders, pendingOrders: $pendingOrders, acceptedOrders: $acceptedOrders, outForPickupOrders: $outForPickupOrders, rejectedOrders: $rejectedOrders, processingOrders: $processingOrders, readyForDeliveryOrders: $readyForDeliveryOrders, outForDeliveryOrders: $outForDeliveryOrders, deliveredOrders: $deliveredOrders, receivedOrders: $receivedOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_orderValueModel &&
            const DeepCollectionEquality().equals(other.allOrders, allOrders) &&
            const DeepCollectionEquality()
                .equals(other.pendingOrders, pendingOrders) &&
            const DeepCollectionEquality()
                .equals(other.acceptedOrders, acceptedOrders) &&
            const DeepCollectionEquality()
                .equals(other.outForPickupOrders, outForPickupOrders) &&
            const DeepCollectionEquality()
                .equals(other.rejectedOrders, rejectedOrders) &&
            const DeepCollectionEquality()
                .equals(other.processingOrders, processingOrders) &&
            const DeepCollectionEquality()
                .equals(other.readyForDeliveryOrders, readyForDeliveryOrders) &&
            const DeepCollectionEquality()
                .equals(other.outForDeliveryOrders, outForDeliveryOrders) &&
            const DeepCollectionEquality()
                .equals(other.deliveredOrders, deliveredOrders) &&
            const DeepCollectionEquality()
                .equals(other.receivedOrders, receivedOrders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allOrders),
      const DeepCollectionEquality().hash(pendingOrders),
      const DeepCollectionEquality().hash(acceptedOrders),
      const DeepCollectionEquality().hash(outForPickupOrders),
      const DeepCollectionEquality().hash(rejectedOrders),
      const DeepCollectionEquality().hash(processingOrders),
      const DeepCollectionEquality().hash(readyForDeliveryOrders),
      const DeepCollectionEquality().hash(outForDeliveryOrders),
      const DeepCollectionEquality().hash(deliveredOrders),
      const DeepCollectionEquality().hash(receivedOrders));

  @JsonKey(ignore: true)
  @override
  _$$_orderValueModelCopyWith<_$_orderValueModel> get copyWith =>
      __$$_orderValueModelCopyWithImpl<_$_orderValueModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_orderValueModelToJson(
      this,
    );
  }
}

abstract class _orderValueModel extends orderValueModel {
  const factory _orderValueModel(
      {@JsonKey(name: 'all_orders')
          final int? allOrders,
      @JsonKey(name: 'pending_orders')
          final int? pendingOrders,
      @JsonKey(name: 'accepted_orders')
          final int? acceptedOrders,
      @JsonKey(name: 'out_for_pickup_orders')
          final int? outForPickupOrders,
      @JsonKey(name: 'rejected_orders')
          final int? rejectedOrders,
      @JsonKey(name: 'processing_orders')
          final int? processingOrders,
      @JsonKey(name: 'ready_for_delivery_orders')
          final int? readyForDeliveryOrders,
      @JsonKey(name: 'out_for_delivery_orders')
          final int? outForDeliveryOrders,
      @JsonKey(name: 'delivered_orders')
          final int? deliveredOrders,
      @JsonKey(name: 'received_orders')
          final int? receivedOrders}) = _$_orderValueModel;
  const _orderValueModel._() : super._();

  factory _orderValueModel.fromJson(Map<String, dynamic> json) =
      _$_orderValueModel.fromJson;

  @override
  @JsonKey(name: 'all_orders')
  int? get allOrders;
  @override
  @JsonKey(name: 'pending_orders')
  int? get pendingOrders;
  @override
  @JsonKey(name: 'accepted_orders')
  int? get acceptedOrders;
  @override
  @JsonKey(name: 'out_for_pickup_orders')
  int? get outForPickupOrders;
  @override
  @JsonKey(name: 'rejected_orders')
  int? get rejectedOrders;
  @override
  @JsonKey(name: 'processing_orders')
  int? get processingOrders;
  @override
  @JsonKey(name: 'ready_for_delivery_orders')
  int? get readyForDeliveryOrders;
  @override
  @JsonKey(name: 'out_for_delivery_orders')
  int? get outForDeliveryOrders;
  @override
  @JsonKey(name: 'delivered_orders')
  int? get deliveredOrders;
  @override
  @JsonKey(name: 'received_orders')
  int? get receivedOrders;
  @override
  @JsonKey(ignore: true)
  _$$_orderValueModelCopyWith<_$_orderValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}
