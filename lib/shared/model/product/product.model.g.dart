// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductServiceModel _$$_ProductServiceModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductServiceModel(
      qty: json['qty'] as int?,
      serviceId: json['service_id'] as int?,
      service: json['service'] == null
          ? null
          : ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductServiceModelToJson(
        _$_ProductServiceModel instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'service_id': instance.serviceId,
      'service': instance.service,
    };

_$_ServiceModel _$$_ServiceModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categoryId: json['category_id'] as int?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      itemCredit: json['item_credit'] as int?,
      isActive: json['is_active'] as int?,
      quantity: json['quantity'] as int?,
      category: json['category'] == null
          ? null
          : ServiceCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ServiceModelToJson(_$_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
      'image': instance.image,
      'price': instance.price,
      'item_credit': instance.itemCredit,
      'is_active': instance.isActive,
      'quantity': instance.quantity,
      'category': instance.category,
    };

_$_BannersModel _$$_BannersModelFromJson(Map<String, dynamic> json) =>
    _$_BannersModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isActive: json['is_active'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_BannersModelToJson(_$_BannersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_active': instance.isActive,
      'image': instance.image,
    };

_$_ServiceCategoryModel _$$_ServiceCategoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_ServiceCategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isActive: json['is_active'] as int?,
      image: json['image'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ServiceCategoryModelToJson(
        _$_ServiceCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_active': instance.isActive,
      'image': instance.image,
      'isSelected': instance.isSelected,
    };

_$_PlanModel _$$_PlanModelFromJson(Map<String, dynamic> json) => _$_PlanModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      credits: (json['credits'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      duration: json['duration'] as int?,
      durationType: json['duration_type'] as int?,
      description: json['description'] as String?,
      addOnCategoryId: json['is_active'] as int?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PlanModelToJson(_$_PlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'credits': instance.credits,
      'price': instance.price,
      'duration': instance.duration,
      'duration_type': instance.durationType,
      'description': instance.description,
      'is_active': instance.addOnCategoryId,
      'isSelected': instance.isSelected,
    };

_$_ServiceDtoModel _$$_ServiceDtoModelFromJson(Map<String, dynamic> json) =>
    _$_ServiceDtoModel(
      id: json['service_id'] as int?,
      name: json['name'] as String?,
      credits: json['credits'] as int?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$$_ServiceDtoModelToJson(_$_ServiceDtoModel instance) =>
    <String, dynamic>{
      'service_id': instance.id,
      'name': instance.name,
      'credits': instance.credits,
      'quantity': instance.quantity,
    };
