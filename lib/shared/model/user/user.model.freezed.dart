// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) {
  return _AppUserModel.fromJson(json);
}

/// @nodoc
mixin _$AppUserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get userType => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'referred_by')
  String? get referredBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'referral_code')
  String? get referralCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserModelCopyWith<AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserModelCopyWith<$Res> {
  factory $AppUserModelCopyWith(
          AppUserModel value, $Res Function(AppUserModel) then) =
      _$AppUserModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? email,
      int? userType,
      String? phone,
      String? avatar,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'referral_code') String? referralCode});
}

/// @nodoc
class _$AppUserModelCopyWithImpl<$Res> implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._value, this._then);

  final AppUserModel _value;
  // ignore: unused_field
  final $Res Function(AppUserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? cityId = freezed,
    Object? referredBy = freezed,
    Object? referralCode = freezed,
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
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      referredBy: referredBy == freezed
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: referralCode == freezed
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppUserModelCopyWith<$Res>
    implements $AppUserModelCopyWith<$Res> {
  factory _$$_AppUserModelCopyWith(
          _$_AppUserModel value, $Res Function(_$_AppUserModel) then) =
      __$$_AppUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? email,
      int? userType,
      String? phone,
      String? avatar,
      @JsonKey(name: 'city_id') int? cityId,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'referral_code') String? referralCode});
}

/// @nodoc
class __$$_AppUserModelCopyWithImpl<$Res>
    extends _$AppUserModelCopyWithImpl<$Res>
    implements _$$_AppUserModelCopyWith<$Res> {
  __$$_AppUserModelCopyWithImpl(
      _$_AppUserModel _value, $Res Function(_$_AppUserModel) _then)
      : super(_value, (v) => _then(v as _$_AppUserModel));

  @override
  _$_AppUserModel get _value => super._value as _$_AppUserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? userType = freezed,
    Object? phone = freezed,
    Object? avatar = freezed,
    Object? cityId = freezed,
    Object? referredBy = freezed,
    Object? referralCode = freezed,
  }) {
    return _then(_$_AppUserModel(
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
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      cityId: cityId == freezed
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as int?,
      referredBy: referredBy == freezed
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      referralCode: referralCode == freezed
          ? _value.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUserModel extends _AppUserModel {
  const _$_AppUserModel(
      {this.id,
      this.name,
      this.email,
      this.userType,
      this.phone,
      this.avatar,
      @JsonKey(name: 'city_id') this.cityId,
      @JsonKey(name: 'referred_by') this.referredBy,
      @JsonKey(name: 'referral_code') this.referralCode})
      : super._();

  factory _$_AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final int? userType;
  @override
  final String? phone;
  @override
  final String? avatar;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'referred_by')
  final String? referredBy;
  @override
  @JsonKey(name: 'referral_code')
  final String? referralCode;

  @override
  String toString() {
    return 'AppUserModel(id: $id, name: $name, email: $email, userType: $userType, phone: $phone, avatar: $avatar, cityId: $cityId, referredBy: $referredBy, referralCode: $referralCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.userType, userType) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.cityId, cityId) &&
            const DeepCollectionEquality()
                .equals(other.referredBy, referredBy) &&
            const DeepCollectionEquality()
                .equals(other.referralCode, referralCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(userType),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(cityId),
      const DeepCollectionEquality().hash(referredBy),
      const DeepCollectionEquality().hash(referralCode));

  @JsonKey(ignore: true)
  @override
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      __$$_AppUserModelCopyWithImpl<_$_AppUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserModelToJson(
      this,
    );
  }
}

abstract class _AppUserModel extends AppUserModel {
  const factory _AppUserModel(
          {final int? id,
          final String? name,
          final String? email,
          final int? userType,
          final String? phone,
          final String? avatar,
          @JsonKey(name: 'city_id') final int? cityId,
          @JsonKey(name: 'referred_by') final String? referredBy,
          @JsonKey(name: 'referral_code') final String? referralCode}) =
      _$_AppUserModel;
  const _AppUserModel._() : super._();

  factory _AppUserModel.fromJson(Map<String, dynamic> json) =
      _$_AppUserModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  int? get userType;
  @override
  String? get phone;
  @override
  String? get avatar;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'referred_by')
  String? get referredBy;
  @override
  @JsonKey(name: 'referral_code')
  String? get referralCode;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

/// @nodoc
mixin _$CityModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityModelCopyWith<CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name, bool isSelected});
}

/// @nodoc
class _$CityModelCopyWithImpl<$Res> implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  final CityModel _value;
  // ignore: unused_field
  final $Res Function(CityModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
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
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$$_CityModelCopyWith(
          _$_CityModel value, $Res Function(_$_CityModel) then) =
      __$$_CityModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, bool isSelected});
}

/// @nodoc
class __$$_CityModelCopyWithImpl<$Res> extends _$CityModelCopyWithImpl<$Res>
    implements _$$_CityModelCopyWith<$Res> {
  __$$_CityModelCopyWithImpl(
      _$_CityModel _value, $Res Function(_$_CityModel) _then)
      : super(_value, (v) => _then(v as _$_CityModel));

  @override
  _$_CityModel get _value => super._value as _$_CityModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_CityModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CityModel extends _CityModel {
  const _$_CityModel({this.id, this.name, this.isSelected = false}) : super._();

  factory _$_CityModel.fromJson(Map<String, dynamic> json) =>
      _$$_CityModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'CityModel(id: $id, name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_CityModelCopyWith<_$_CityModel> get copyWith =>
      __$$_CityModelCopyWithImpl<_$_CityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityModelToJson(
      this,
    );
  }
}

abstract class _CityModel extends CityModel {
  const factory _CityModel(
      {final int? id,
      final String? name,
      final bool isSelected}) = _$_CityModel;
  const _CityModel._() : super._();

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$_CityModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_CityModelCopyWith<_$_CityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  int? get id => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_name')
  String? get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_number')
  String? get licenseNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? district,
      String? address,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'store_name') String? storeName,
      @JsonKey(name: 'license_number') String? licenseNumber});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  final CustomerModel _value;
  // ignore: unused_field
  final $Res Function(CustomerModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? district = freezed,
    Object? address = freezed,
    Object? userId = freezed,
    Object? storeName = freezed,
    Object? licenseNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$_CustomerModelCopyWith(
          _$_CustomerModel value, $Res Function(_$_CustomerModel) then) =
      __$$_CustomerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? district,
      String? address,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'store_name') String? storeName,
      @JsonKey(name: 'license_number') String? licenseNumber});
}

/// @nodoc
class __$$_CustomerModelCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res>
    implements _$$_CustomerModelCopyWith<$Res> {
  __$$_CustomerModelCopyWithImpl(
      _$_CustomerModel _value, $Res Function(_$_CustomerModel) _then)
      : super(_value, (v) => _then(v as _$_CustomerModel));

  @override
  _$_CustomerModel get _value => super._value as _$_CustomerModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? district = freezed,
    Object? address = freezed,
    Object? userId = freezed,
    Object? storeName = freezed,
    Object? licenseNumber = freezed,
  }) {
    return _then(_$_CustomerModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      district: district == freezed
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerModel extends _CustomerModel {
  const _$_CustomerModel(
      {this.id,
      this.district,
      this.address,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'store_name') this.storeName,
      @JsonKey(name: 'license_number') this.licenseNumber})
      : super._();

  factory _$_CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerModelFromJson(json);

  @override
  final int? id;
  @override
  final String? district;
  @override
  final String? address;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'store_name')
  final String? storeName;
  @override
  @JsonKey(name: 'license_number')
  final String? licenseNumber;

  @override
  String toString() {
    return 'CustomerModel(id: $id, district: $district, address: $address, userId: $userId, storeName: $storeName, licenseNumber: $licenseNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.district, district) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality()
                .equals(other.licenseNumber, licenseNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(district),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(licenseNumber));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      __$$_CustomerModelCopyWithImpl<_$_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerModelToJson(
      this,
    );
  }
}

abstract class _CustomerModel extends CustomerModel {
  const factory _CustomerModel(
          {final int? id,
          final String? district,
          final String? address,
          @JsonKey(name: 'user_id') final int? userId,
          @JsonKey(name: 'store_name') final String? storeName,
          @JsonKey(name: 'license_number') final String? licenseNumber}) =
      _$_CustomerModel;
  const _CustomerModel._() : super._();

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerModel.fromJson;

  @override
  int? get id;
  @override
  String? get district;
  @override
  String? get address;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'store_name')
  String? get storeName;
  @override
  @JsonKey(name: 'license_number')
  String? get licenseNumber;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
mixin _$AddressModel {
  int? get id => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'building_name')
  String? get buildingName => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_name')
  String? get streetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? landmark,
      String? type,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'building_name') String? buildingName,
      @JsonKey(name: 'street_name') String? streetName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      bool? isSelected});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? landmark = freezed,
    Object? type = freezed,
    Object? customerId = freezed,
    Object? buildingName = freezed,
    Object? streetName = freezed,
    Object? phoneNumber = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      landmark: landmark == freezed
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingName: buildingName == freezed
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: streetName == freezed
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$$_AddressModelCopyWith(
          _$_AddressModel value, $Res Function(_$_AddressModel) then) =
      __$$_AddressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? landmark,
      String? type,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'building_name') String? buildingName,
      @JsonKey(name: 'street_name') String? streetName,
      @JsonKey(name: 'phone_number') String? phoneNumber,
      bool? isSelected});
}

/// @nodoc
class __$$_AddressModelCopyWithImpl<$Res>
    extends _$AddressModelCopyWithImpl<$Res>
    implements _$$_AddressModelCopyWith<$Res> {
  __$$_AddressModelCopyWithImpl(
      _$_AddressModel _value, $Res Function(_$_AddressModel) _then)
      : super(_value, (v) => _then(v as _$_AddressModel));

  @override
  _$_AddressModel get _value => super._value as _$_AddressModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? landmark = freezed,
    Object? type = freezed,
    Object? customerId = freezed,
    Object? buildingName = freezed,
    Object? streetName = freezed,
    Object? phoneNumber = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_AddressModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      landmark: landmark == freezed
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      buildingName: buildingName == freezed
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      streetName: streetName == freezed
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressModel extends _AddressModel {
  const _$_AddressModel(
      {this.id,
      this.landmark,
      this.type,
      @JsonKey(name: 'customer_id') this.customerId,
      @JsonKey(name: 'building_name') this.buildingName,
      @JsonKey(name: 'street_name') this.streetName,
      @JsonKey(name: 'phone_number') this.phoneNumber,
      this.isSelected = false})
      : super._();

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  final int? id;
  @override
  final String? landmark;
  @override
  final String? type;
  @override
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @override
  @JsonKey(name: 'building_name')
  final String? buildingName;
  @override
  @JsonKey(name: 'street_name')
  final String? streetName;
  @override
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'AddressModel(id: $id, landmark: $landmark, type: $type, customerId: $customerId, buildingName: $buildingName, streetName: $streetName, phoneNumber: $phoneNumber, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.landmark, landmark) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            const DeepCollectionEquality()
                .equals(other.buildingName, buildingName) &&
            const DeepCollectionEquality()
                .equals(other.streetName, streetName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(landmark),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(customerId),
      const DeepCollectionEquality().hash(buildingName),
      const DeepCollectionEquality().hash(streetName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      __$$_AddressModelCopyWithImpl<_$_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(
      this,
    );
  }
}

abstract class _AddressModel extends AddressModel {
  const factory _AddressModel(
      {final int? id,
      final String? landmark,
      final String? type,
      @JsonKey(name: 'customer_id') final int? customerId,
      @JsonKey(name: 'building_name') final String? buildingName,
      @JsonKey(name: 'street_name') final String? streetName,
      @JsonKey(name: 'phone_number') final String? phoneNumber,
      final bool? isSelected}) = _$_AddressModel;
  const _AddressModel._() : super._();

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  int? get id;
  @override
  String? get landmark;
  @override
  String? get type;
  @override
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @override
  @JsonKey(name: 'building_name')
  String? get buildingName;
  @override
  @JsonKey(name: 'street_name')
  String? get streetName;
  @override
  @JsonKey(name: 'phone_number')
  String? get phoneNumber;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_AddressModelCopyWith<_$_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AdminDetailsModel _$AdminDetailsModelFromJson(Map<String, dynamic> json) {
  return _AdminDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$AdminDetailsModel {
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminDetailsModelCopyWith<AdminDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminDetailsModelCopyWith<$Res> {
  factory $AdminDetailsModelCopyWith(
          AdminDetailsModel value, $Res Function(AdminDetailsModel) then) =
      _$AdminDetailsModelCopyWithImpl<$Res>;
  $Res call({String? name, String? phone});
}

/// @nodoc
class _$AdminDetailsModelCopyWithImpl<$Res>
    implements $AdminDetailsModelCopyWith<$Res> {
  _$AdminDetailsModelCopyWithImpl(this._value, this._then);

  final AdminDetailsModel _value;
  // ignore: unused_field
  final $Res Function(AdminDetailsModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AdminDetailsModelCopyWith<$Res>
    implements $AdminDetailsModelCopyWith<$Res> {
  factory _$$_AdminDetailsModelCopyWith(_$_AdminDetailsModel value,
          $Res Function(_$_AdminDetailsModel) then) =
      __$$_AdminDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? phone});
}

/// @nodoc
class __$$_AdminDetailsModelCopyWithImpl<$Res>
    extends _$AdminDetailsModelCopyWithImpl<$Res>
    implements _$$_AdminDetailsModelCopyWith<$Res> {
  __$$_AdminDetailsModelCopyWithImpl(
      _$_AdminDetailsModel _value, $Res Function(_$_AdminDetailsModel) _then)
      : super(_value, (v) => _then(v as _$_AdminDetailsModel));

  @override
  _$_AdminDetailsModel get _value => super._value as _$_AdminDetailsModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
  }) {
    return _then(_$_AdminDetailsModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdminDetailsModel extends _AdminDetailsModel {
  const _$_AdminDetailsModel({this.name, this.phone}) : super._();

  factory _$_AdminDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdminDetailsModelFromJson(json);

  @override
  final String? name;
  @override
  final String? phone;

  @override
  String toString() {
    return 'AdminDetailsModel(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdminDetailsModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  _$$_AdminDetailsModelCopyWith<_$_AdminDetailsModel> get copyWith =>
      __$$_AdminDetailsModelCopyWithImpl<_$_AdminDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminDetailsModelToJson(
      this,
    );
  }
}

abstract class _AdminDetailsModel extends AdminDetailsModel {
  const factory _AdminDetailsModel({final String? name, final String? phone}) =
      _$_AdminDetailsModel;
  const _AdminDetailsModel._() : super._();

  factory _AdminDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_AdminDetailsModel.fromJson;

  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_AdminDetailsModelCopyWith<_$_AdminDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
