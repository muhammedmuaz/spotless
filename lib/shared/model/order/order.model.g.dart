// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivePlanModel _$$_ActivePlanModelFromJson(Map<String, dynamic> json) =>
    _$_ActivePlanModel(
      planeStatus: json['active_plan_status'] as int?,
      isExpired: json['is_expired'] as bool?,
      validTill: json['valid_till'] as String?,
      subscriptionName: json['subscription_name'] as String?,
      subscriptionPrice: json['subscription_price'] as int?,
      subscriptionDurationType: json['subscription_duration_type'] as int?,
      totalQty: json['total_qty'] as int?,
      usedQty: json['used_qty'] as int?,
      balanceQty: json['balance_qty'] as int?,
    );

Map<String, dynamic> _$$_ActivePlanModelToJson(_$_ActivePlanModel instance) =>
    <String, dynamic>{
      'active_plan_status': instance.planeStatus,
      'is_expired': instance.isExpired,
      'valid_till': instance.validTill,
      'subscription_name': instance.subscriptionName,
      'subscription_price': instance.subscriptionPrice,
      'subscription_duration_type': instance.subscriptionDurationType,
      'total_qty': instance.totalQty,
      'used_qty': instance.usedQty,
      'balance_qty': instance.balanceQty,
    };

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      id: json['id'] as int?,
      orderId: json['order_id'] as String?,
      totalQuantity: json['total_quantity'] as int?,
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'total_quantity': instance.totalQuantity,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$_SingleOrderModel _$$_SingleOrderModelFromJson(Map<String, dynamic> json) =>
    _$_SingleOrderModel(
      id: json['id'] as int?,
      orderId: json['order_id'] as String?,
      orderDate: json['service_id'] == null
          ? null
          : DateTime.parse(json['service_id'] as String),
      totalQuantity: json['total_quantity'] as int?,
      totalCredits: json['total_credits'] as int?,
      pickupAddress: json['pickup_address'] == null
          ? null
          : AddressModel.fromJson(
              json['pickup_address'] as Map<String, dynamic>),
      deliveryAddress: json['delivery_address'] == null
          ? null
          : AddressModel.fromJson(
              json['delivery_address'] as Map<String, dynamic>),
      status: json['status'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      pickupDate: json['pickup_date'] == null
          ? null
          : DateTime.parse(json['pickup_date'] as String),
      pickupTime: json['pickup_time'] as String?,
      orderDetails: (json['order_details'] as List<dynamic>?)
          ?.map((e) => OrderDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SingleOrderModelToJson(_$_SingleOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'service_id': instance.orderDate?.toIso8601String(),
      'total_quantity': instance.totalQuantity,
      'total_credits': instance.totalCredits,
      'pickup_address': instance.pickupAddress,
      'delivery_address': instance.deliveryAddress,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'pickup_date': instance.pickupDate?.toIso8601String(),
      'pickup_time': instance.pickupTime,
      'order_details': instance.orderDetails,
    };

_$_OrderDetailsModel _$$_OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    _$_OrderDetailsModel(
      id: json['id'] as int?,
      orderId: json['order_id'] as int?,
      serviceId: json['service_id'] as int?,
      name: json['name'] as String?,
      credits: json['credits'] as int?,
      quantity: json['quantity'] as int?,
      total: json['total'] as int?,
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderDetailsModelToJson(
        _$_OrderDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'service_id': instance.serviceId,
      'name': instance.name,
      'credits': instance.credits,
      'quantity': instance.quantity,
      'total': instance.total,
      'service': instance.service,
    };

_$_orderValueModel _$$_orderValueModelFromJson(Map<String, dynamic> json) =>
    _$_orderValueModel(
      allOrders: json['all_orders'] as int?,
      pendingOrders: json['pending_orders'] as int?,
      acceptedOrders: json['accepted_orders'] as int?,
      outForPickupOrders: json['out_for_pickup_orders'] as int?,
      rejectedOrders: json['rejected_orders'] as int?,
      processingOrders: json['processing_orders'] as int?,
      readyForDeliveryOrders: json['ready_for_delivery_orders'] as int?,
      outForDeliveryOrders: json['out_for_delivery_orders'] as int?,
      deliveredOrders: json['delivered_orders'] as int?,
      receivedOrders: json['received_orders'] as int?,
    );

Map<String, dynamic> _$$_orderValueModelToJson(_$_orderValueModel instance) =>
    <String, dynamic>{
      'all_orders': instance.allOrders,
      'pending_orders': instance.pendingOrders,
      'accepted_orders': instance.acceptedOrders,
      'out_for_pickup_orders': instance.outForPickupOrders,
      'rejected_orders': instance.rejectedOrders,
      'processing_orders': instance.processingOrders,
      'ready_for_delivery_orders': instance.readyForDeliveryOrders,
      'out_for_delivery_orders': instance.outForDeliveryOrders,
      'delivered_orders': instance.deliveredOrders,
      'received_orders': instance.receivedOrders,
    };
