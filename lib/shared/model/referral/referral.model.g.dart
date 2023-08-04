// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointModel _$$_PointModelFromJson(Map<String, dynamic> json) =>
    _$_PointModel(
      data: json['data'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_PointModelToJson(_$_PointModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

_$_MyReferralsModel _$$_MyReferralsModelFromJson(Map<String, dynamic> json) =>
    _$_MyReferralsModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      pointsSum: json['points_sum_points'] as int?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_MyReferralsModelToJson(_$_MyReferralsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'points_sum_points': instance.pointsSum,
      'avatar': instance.avatar,
    };

_$_SlabModel _$$_SlabModelFromJson(Map<String, dynamic> json) => _$_SlabModel(
      id: json['id'] as int?,
      point: json['point'] as int?,
      credit: json['credit'] as int?,
      cash: json['cash'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_SlabModelToJson(_$_SlabModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'credit': instance.credit,
      'cash': instance.cash,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$_ReferralHistoryModel _$$_ReferralHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReferralHistoryModel(
      id: json['id'] as int?,
      orderId: json['order_id'] as String?,
      customerId: json['customer_id'] as String?,
      referredBy: json['referred_by'] as String?,
      redeemId: json['redeem_id'] as String?,
      type: json['type'] as int?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      redeem: json['redeem'] == null
          ? null
          : RedeemModel.fromJson(json['redeem'] as Map<String, dynamic>),
      orderCredit: json['order_credit'] == null
          ? null
          : CreditModel.fromJson(json['order_credit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReferralHistoryModelToJson(
        _$_ReferralHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'customer_id': instance.customerId,
      'referred_by': instance.referredBy,
      'redeem_id': instance.redeemId,
      'type': instance.type,
      'status': instance.status,
      'message': instance.message,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'redeem': instance.redeem,
      'order_credit': instance.orderCredit,
    };

_$_RedeemModel _$$_RedeemModelFromJson(Map<String, dynamic> json) =>
    _$_RedeemModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      price: json['price'] as int?,
      points: json['points'] as int?,
      status: json['status'] as int?,
      credits: json['credits'] as int?,
      customerId: json['customer_id'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RedeemModelToJson(_$_RedeemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'price': instance.price,
      'points': instance.points,
      'status': instance.status,
      'credits': instance.credits,
      'customer_id': instance.customerId,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'isSelected': instance.isSelected,
    };

_$_CreditModel _$$_CreditModelFromJson(Map<String, dynamic> json) =>
    _$_CreditModel(
      id: json['id'] as int?,
      points: json['points'] as int?,
    );

Map<String, dynamic> _$$_CreditModelToJson(_$_CreditModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
    };
