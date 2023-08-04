import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'referral.model.freezed.dart';
part 'referral.model.g.dart';

@freezed
@immutable
class PointModel with _$PointModel {
  const PointModel._();
  const factory PointModel({
    int? data,
    String? message,
  }) = _PointModel;

  factory PointModel.fromJson(Map<String, dynamic> json) =>
      _$PointModelFromJson(json);
}

@freezed
@immutable
class MyReferralsModel with _$MyReferralsModel {
  const MyReferralsModel._();
  const factory MyReferralsModel({
    int? id,
    String? name,
    String? email,
    @JsonKey(name: 'points_sum_points') int? pointsSum,
    String? avatar,
  }) = _MyReferralsModel;

  factory MyReferralsModel.fromJson(Map<String, dynamic> json) =>
      _$MyReferralsModelFromJson(json);

  String get imageUrl {
    if (avatar == null || avatar == '') {
      return '';
    }
    return 'http://spotless.vooly.in/public$avatar';
  }
}

@freezed
@immutable
class SlabModel with _$SlabModel {
  const SlabModel._();
  const factory SlabModel({
    int? id,
    int? point,
    int? credit,
    int? cash,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SlabModel;

  factory SlabModel.fromJson(Map<String, dynamic> json) =>
      _$SlabModelFromJson(json);
}

@freezed
@immutable
class ReferralHistoryModel with _$ReferralHistoryModel {
  const ReferralHistoryModel._();
  const factory ReferralHistoryModel(
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
          @JsonKey(name: 'order_credit') CreditModel? orderCredit}) =
      _ReferralHistoryModel;

  factory ReferralHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralHistoryModelFromJson(json);

  String? get typeName {
    switch (type) {
      case 1:
        return "Order credit";
      case 2:
        return "Redeem with credit";
      case 3:
        return "Redeem with cash";
    }
  }
}

@freezed
@immutable
class RedeemModel with _$RedeemModel {
  const RedeemModel._();
  const factory RedeemModel({
    int? id,
    int? type,
    int? price,
    int? points,
    int? status,
    int? credits,
    @JsonKey(name: 'customer_id') String? customerId,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(false) bool isSelected,
  }) = _RedeemModel;

  factory RedeemModel.fromJson(Map<String, dynamic> json) =>
      _$RedeemModelFromJson(json);
}

@freezed
@immutable
class CreditModel with _$CreditModel {
  const CreditModel._();
  const factory CreditModel({
    int? id,
    int? points,
  }) = _CreditModel;

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);
}
