import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import '../product/product.model.dart';
part 'order.model.freezed.dart';
part 'order.model.g.dart';

@freezed
@immutable
class ActivePlanModel with _$ActivePlanModel {
  const ActivePlanModel._();
  const factory ActivePlanModel({
    @JsonKey(name: 'active_plan_status') int? planeStatus,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'valid_till') String? validTill,
    @JsonKey(name: 'subscription_name') String? subscriptionName,
    @JsonKey(name: 'subscription_price') int? subscriptionPrice,
    @JsonKey(name: 'subscription_duration_type') int? subscriptionDurationType,
    @JsonKey(name: 'total_qty') int? totalQty,
    @JsonKey(name: 'used_qty') int? usedQty,
    @JsonKey(name: 'balance_qty') int? balanceQty,
  }) = _ActivePlanModel;

  factory ActivePlanModel.fromJson(Map<String, dynamic> json) =>
      _$ActivePlanModelFromJson(json);

  String? get durationTypeName {
    switch (subscriptionDurationType) {
      case 0:
        return "";
      case 1:
        return "D";
      case 2:
        return "M";
      case 3:
        return "Y";
    }
  }
}

@freezed
@immutable
class OrderModel with _$OrderModel {
  const OrderModel._();
  const factory OrderModel({
    int? id,
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'total_quantity') int? totalQuantity,
    int? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  String? get statusName {
    switch (status) {
      case 0:
        return 'Pending';
      case 1:
        return 'Accepted';
      case 2:
        return 'Out for pick up';
      case 3:
        return 'Rejected';
      case 4:
        return 'Processing';
      case 5:
        return 'Ready for delivery';
      case 6:
        return 'Out for Delivery';
      case 7:
        return 'Deliverd';
      case 8:
        return "Received";
    }
  }

  Color? get statusNameColors {
    switch (status) {
      case 0:
        return MainTheme.greyTypeColor;
      case 1:
        return MainTheme.blueTypeOneColor;
      case 2:
        return MainTheme.maroonTypeColor;
      case 3:
        return MainTheme.redTypeColor;
      case 4:
        return MainTheme.maroonTypeOneColor;
      case 5:
        return MainTheme.greenTypeColor;
      case 6:
        return MainTheme.greenTypeColor;
      case 7:
        return MainTheme.blueTypeOneColor;
      case 8:
        return MainTheme.maroonTypeOneColor;
    }
  }
}

@freezed
@immutable
class SingleOrderModel with _$SingleOrderModel {
  const SingleOrderModel._();
  const factory SingleOrderModel({
    int? id,
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
    @JsonKey(name: 'order_details') List<OrderDetailsModel>? orderDetails,
  }) = _SingleOrderModel;
  factory SingleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderModelFromJson(json);
}

@freezed
@immutable
class OrderDetailsModel with _$OrderDetailsModel {
  const OrderDetailsModel._();
  const factory OrderDetailsModel(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'service_id') int? serviceId,
      String? name,
      int? credits,
      int? quantity,
      int? total,
      ServiceModel? service}) = _OrderDetailsModel;
  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsModelFromJson(json);
}

@freezed
@immutable
class orderValueModel with _$orderValueModel {
  const orderValueModel._();
  const factory orderValueModel({
    @JsonKey(name: 'all_orders') int? allOrders,
    @JsonKey(name: 'pending_orders') int? pendingOrders,
    @JsonKey(name: 'accepted_orders') int? acceptedOrders,
    @JsonKey(name: 'out_for_pickup_orders') int? outForPickupOrders,
    @JsonKey(name: 'rejected_orders') int? rejectedOrders,
    @JsonKey(name: 'processing_orders') int? processingOrders,
    @JsonKey(name: 'ready_for_delivery_orders') int? readyForDeliveryOrders,
    @JsonKey(name: 'out_for_delivery_orders') int? outForDeliveryOrders,
    @JsonKey(name: 'delivered_orders') int? deliveredOrders,
    @JsonKey(name: 'received_orders') int? receivedOrders,
  }) = _orderValueModel;

  factory orderValueModel.fromJson(Map<String, dynamic> json) =>
      _$orderValueModelFromJson(json);
}
