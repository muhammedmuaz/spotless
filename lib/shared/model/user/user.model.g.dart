// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUserModel _$$_AppUserModelFromJson(Map<String, dynamic> json) =>
    _$_AppUserModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      userType: json['userType'] as int?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      cityId: json['city_id'] as int?,
      referredBy: json['referred_by'] as String?,
      referralCode: json['referral_code'] as String?,
    );

Map<String, dynamic> _$$_AppUserModelToJson(_$_AppUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'userType': instance.userType,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'city_id': instance.cityId,
      'referred_by': instance.referredBy,
      'referral_code': instance.referralCode,
    };

_$_CityModel _$$_CityModelFromJson(Map<String, dynamic> json) => _$_CityModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CityModelToJson(_$_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };

_$_CustomerModel _$$_CustomerModelFromJson(Map<String, dynamic> json) =>
    _$_CustomerModel(
      id: json['id'] as int?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      userId: json['user_id'] as int?,
      storeName: json['store_name'] as String?,
      licenseNumber: json['license_number'] as String?,
    );

Map<String, dynamic> _$$_CustomerModelToJson(_$_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district': instance.district,
      'address': instance.address,
      'user_id': instance.userId,
      'store_name': instance.storeName,
      'license_number': instance.licenseNumber,
    };

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    _$_AddressModel(
      id: json['id'] as int?,
      landmark: json['landmark'] as String?,
      type: json['type'] as String?,
      customerId: json['customer_id'] as int?,
      buildingName: json['building_name'] as String?,
      streetName: json['street_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'landmark': instance.landmark,
      'type': instance.type,
      'customer_id': instance.customerId,
      'building_name': instance.buildingName,
      'street_name': instance.streetName,
      'phone_number': instance.phoneNumber,
      'isSelected': instance.isSelected,
    };

_$_AdminDetailsModel _$$_AdminDetailsModelFromJson(Map<String, dynamic> json) =>
    _$_AdminDetailsModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$_AdminDetailsModelToJson(
        _$_AdminDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
