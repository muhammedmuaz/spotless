import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
@immutable
class AppUserModel with _$AppUserModel {
  const AppUserModel._();
  const factory AppUserModel({
    int? id,
    String? name,
    String? email,
    int? userType,
    String? phone,
    String? avatar,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'referred_by') String? referredBy,
    @JsonKey(name: 'referral_code') String? referralCode,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);

  String get imageUrl {
    if (avatar == null || avatar == '') {
      return '';
    }
    return 'http://spotless.vooly.in/public$avatar';
  }
}

@freezed
@immutable
class CityModel with _$CityModel {
  const CityModel._();
  const factory CityModel({
    int? id,
    String? name,
    @Default(false) bool isSelected,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}

@freezed
@immutable
class CustomerModel with _$CustomerModel {
  const CustomerModel._();
  const factory CustomerModel({
    int? id,
    String? district,
    String? address,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'store_name') String? storeName,
    @JsonKey(name: 'license_number') String? licenseNumber,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

// @freezed
// @immutable
// class ProfileModel with _$ProfileModel {
//   const ProfileModel._();
//   const factory ProfileModel({
//     AppUserModel? user,
//     @JsonKey(name: 'total_sale_amount') double? payment,
//     double? balance,
//   }) = _ProfileModel;

//   factory ProfileModel.fromJson(Map<String, dynamic> json) =>
//       _$ProfileModelFromJson(json);
// }

@freezed
@immutable
class AddressModel with _$AddressModel {
  const AddressModel._();
  const factory AddressModel({
    int? id,
    String? landmark,
    String? type,
    @JsonKey(name: 'customer_id') int? customerId,
    @JsonKey(name: 'building_name') String? buildingName,
    @JsonKey(name: 'street_name') String? streetName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @Default(false) bool? isSelected,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  String? get typeName {
    switch (type) {
      case "1":
        return "Home";
      case "2":
        return "Work";
      case "3":
        return "Other";
    }
  }
}

@freezed
@immutable
class AdminDetailsModel with _$AdminDetailsModel {
  const AdminDetailsModel._();
  const factory AdminDetailsModel({
    String? name,
    String? phone,
  }) = _AdminDetailsModel;

  factory AdminDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDetailsModelFromJson(json);
}
