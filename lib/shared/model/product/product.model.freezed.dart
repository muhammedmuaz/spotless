// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductServiceModel _$ProductServiceModelFromJson(Map<String, dynamic> json) {
  return _ProductServiceModel.fromJson(json);
}

/// @nodoc
mixin _$ProductServiceModel {
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_id')
  int? get serviceId => throw _privateConstructorUsedError;
  ServiceModel? get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductServiceModelCopyWith<ProductServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductServiceModelCopyWith<$Res> {
  factory $ProductServiceModelCopyWith(
          ProductServiceModel value, $Res Function(ProductServiceModel) then) =
      _$ProductServiceModelCopyWithImpl<$Res>;
  $Res call(
      {int? qty,
      @JsonKey(name: 'service_id') int? serviceId,
      ServiceModel? service});

  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class _$ProductServiceModelCopyWithImpl<$Res>
    implements $ProductServiceModelCopyWith<$Res> {
  _$ProductServiceModelCopyWithImpl(this._value, this._then);

  final ProductServiceModel _value;
  // ignore: unused_field
  final $Res Function(ProductServiceModel) _then;

  @override
  $Res call({
    Object? qty = freezed,
    Object? serviceId = freezed,
    Object? service = freezed,
  }) {
    return _then(_value.copyWith(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ProductServiceModelCopyWith<$Res>
    implements $ProductServiceModelCopyWith<$Res> {
  factory _$$_ProductServiceModelCopyWith(_$_ProductServiceModel value,
          $Res Function(_$_ProductServiceModel) then) =
      __$$_ProductServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? qty,
      @JsonKey(name: 'service_id') int? serviceId,
      ServiceModel? service});

  @override
  $ServiceModelCopyWith<$Res>? get service;
}

/// @nodoc
class __$$_ProductServiceModelCopyWithImpl<$Res>
    extends _$ProductServiceModelCopyWithImpl<$Res>
    implements _$$_ProductServiceModelCopyWith<$Res> {
  __$$_ProductServiceModelCopyWithImpl(_$_ProductServiceModel _value,
      $Res Function(_$_ProductServiceModel) _then)
      : super(_value, (v) => _then(v as _$_ProductServiceModel));

  @override
  _$_ProductServiceModel get _value => super._value as _$_ProductServiceModel;

  @override
  $Res call({
    Object? qty = freezed,
    Object? serviceId = freezed,
    Object? service = freezed,
  }) {
    return _then(_$_ProductServiceModel(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
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
class _$_ProductServiceModel extends _ProductServiceModel {
  const _$_ProductServiceModel(
      {this.qty, @JsonKey(name: 'service_id') this.serviceId, this.service})
      : super._();

  factory _$_ProductServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductServiceModelFromJson(json);

  @override
  final int? qty;
  @override
  @JsonKey(name: 'service_id')
  final int? serviceId;
  @override
  final ServiceModel? service;

  @override
  String toString() {
    return 'ProductServiceModel(qty: $qty, serviceId: $serviceId, service: $service)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductServiceModel &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.serviceId, serviceId) &&
            const DeepCollectionEquality().equals(other.service, service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(serviceId),
      const DeepCollectionEquality().hash(service));

  @JsonKey(ignore: true)
  @override
  _$$_ProductServiceModelCopyWith<_$_ProductServiceModel> get copyWith =>
      __$$_ProductServiceModelCopyWithImpl<_$_ProductServiceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductServiceModelToJson(
      this,
    );
  }
}

abstract class _ProductServiceModel extends ProductServiceModel {
  const factory _ProductServiceModel(
      {final int? qty,
      @JsonKey(name: 'service_id') final int? serviceId,
      final ServiceModel? service}) = _$_ProductServiceModel;
  const _ProductServiceModel._() : super._();

  factory _ProductServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ProductServiceModel.fromJson;

  @override
  int? get qty;
  @override
  @JsonKey(name: 'service_id')
  int? get serviceId;
  @override
  ServiceModel? get service;
  @override
  @JsonKey(ignore: true)
  _$$_ProductServiceModelCopyWith<_$_ProductServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return _ServiceModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_credit')
  int? get itemCredit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  ServiceCategoryModel? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceModelCopyWith<ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceModelCopyWith<$Res> {
  factory $ServiceModelCopyWith(
          ServiceModel value, $Res Function(ServiceModel) then) =
      _$ServiceModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'category_id') int? categoryId,
      String? image,
      double? price,
      @JsonKey(name: 'item_credit') int? itemCredit,
      @JsonKey(name: 'is_active') int? isActive,
      int? quantity,
      ServiceCategoryModel? category});

  $ServiceCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$ServiceModelCopyWithImpl<$Res> implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._value, this._then);

  final ServiceModel _value;
  // ignore: unused_field
  final $Res Function(ServiceModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? itemCredit = freezed,
    Object? isActive = freezed,
    Object? quantity = freezed,
    Object? category = freezed,
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
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      itemCredit: itemCredit == freezed
          ? _value.itemCredit
          : itemCredit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategoryModel?,
    ));
  }

  @override
  $ServiceCategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ServiceCategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_ServiceModelCopyWith<$Res>
    implements $ServiceModelCopyWith<$Res> {
  factory _$$_ServiceModelCopyWith(
          _$_ServiceModel value, $Res Function(_$_ServiceModel) then) =
      __$$_ServiceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'category_id') int? categoryId,
      String? image,
      double? price,
      @JsonKey(name: 'item_credit') int? itemCredit,
      @JsonKey(name: 'is_active') int? isActive,
      int? quantity,
      ServiceCategoryModel? category});

  @override
  $ServiceCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_ServiceModelCopyWithImpl<$Res>
    extends _$ServiceModelCopyWithImpl<$Res>
    implements _$$_ServiceModelCopyWith<$Res> {
  __$$_ServiceModelCopyWithImpl(
      _$_ServiceModel _value, $Res Function(_$_ServiceModel) _then)
      : super(_value, (v) => _then(v as _$_ServiceModel));

  @override
  _$_ServiceModel get _value => super._value as _$_ServiceModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? categoryId = freezed,
    Object? image = freezed,
    Object? price = freezed,
    Object? itemCredit = freezed,
    Object? isActive = freezed,
    Object? quantity = freezed,
    Object? category = freezed,
  }) {
    return _then(_$_ServiceModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      itemCredit: itemCredit == freezed
          ? _value.itemCredit
          : itemCredit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ServiceCategoryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceModel extends _ServiceModel {
  const _$_ServiceModel(
      {this.id,
      this.name,
      @JsonKey(name: 'category_id') this.categoryId,
      this.image,
      this.price,
      @JsonKey(name: 'item_credit') this.itemCredit,
      @JsonKey(name: 'is_active') this.isActive,
      this.quantity,
      this.category})
      : super._();

  factory _$_ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  final String? image;
  @override
  final double? price;
  @override
  @JsonKey(name: 'item_credit')
  final int? itemCredit;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  final int? quantity;
  @override
  final ServiceCategoryModel? category;

  @override
  String toString() {
    return 'ServiceModel(id: $id, name: $name, categoryId: $categoryId, image: $image, price: $price, itemCredit: $itemCredit, isActive: $isActive, quantity: $quantity, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.itemCredit, itemCredit) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(itemCredit),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      __$$_ServiceModelCopyWithImpl<_$_ServiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceModelToJson(
      this,
    );
  }
}

abstract class _ServiceModel extends ServiceModel {
  const factory _ServiceModel(
      {final int? id,
      final String? name,
      @JsonKey(name: 'category_id') final int? categoryId,
      final String? image,
      final double? price,
      @JsonKey(name: 'item_credit') final int? itemCredit,
      @JsonKey(name: 'is_active') final int? isActive,
      final int? quantity,
      final ServiceCategoryModel? category}) = _$_ServiceModel;
  const _ServiceModel._() : super._();

  factory _ServiceModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  String? get image;
  @override
  double? get price;
  @override
  @JsonKey(name: 'item_credit')
  int? get itemCredit;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  int? get quantity;
  @override
  ServiceCategoryModel? get category;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceModelCopyWith<_$_ServiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BannersModel _$BannersModelFromJson(Map<String, dynamic> json) {
  return _BannersModel.fromJson(json);
}

/// @nodoc
mixin _$BannersModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannersModelCopyWith<BannersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersModelCopyWith<$Res> {
  factory $BannersModelCopyWith(
          BannersModel value, $Res Function(BannersModel) then) =
      _$BannersModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'is_active') int? isActive,
      String? image});
}

/// @nodoc
class _$BannersModelCopyWithImpl<$Res> implements $BannersModelCopyWith<$Res> {
  _$BannersModelCopyWithImpl(this._value, this._then);

  final BannersModel _value;
  // ignore: unused_field
  final $Res Function(BannersModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? image = freezed,
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
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BannersModelCopyWith<$Res>
    implements $BannersModelCopyWith<$Res> {
  factory _$$_BannersModelCopyWith(
          _$_BannersModel value, $Res Function(_$_BannersModel) then) =
      __$$_BannersModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'is_active') int? isActive,
      String? image});
}

/// @nodoc
class __$$_BannersModelCopyWithImpl<$Res>
    extends _$BannersModelCopyWithImpl<$Res>
    implements _$$_BannersModelCopyWith<$Res> {
  __$$_BannersModelCopyWithImpl(
      _$_BannersModel _value, $Res Function(_$_BannersModel) _then)
      : super(_value, (v) => _then(v as _$_BannersModel));

  @override
  _$_BannersModel get _value => super._value as _$_BannersModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_BannersModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BannersModel extends _BannersModel {
  const _$_BannersModel(
      {this.id,
      this.name,
      @JsonKey(name: 'is_active') this.isActive,
      this.image})
      : super._();

  factory _$_BannersModel.fromJson(Map<String, dynamic> json) =>
      _$$_BannersModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  final String? image;

  @override
  String toString() {
    return 'BannersModel(id: $id, name: $name, isActive: $isActive, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannersModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_BannersModelCopyWith<_$_BannersModel> get copyWith =>
      __$$_BannersModelCopyWithImpl<_$_BannersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BannersModelToJson(
      this,
    );
  }
}

abstract class _BannersModel extends BannersModel {
  const factory _BannersModel(
      {final int? id,
      final String? name,
      @JsonKey(name: 'is_active') final int? isActive,
      final String? image}) = _$_BannersModel;
  const _BannersModel._() : super._();

  factory _BannersModel.fromJson(Map<String, dynamic> json) =
      _$_BannersModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_BannersModelCopyWith<_$_BannersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceCategoryModel _$ServiceCategoryModelFromJson(Map<String, dynamic> json) {
  return _ServiceCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceCategoryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get isActive => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCategoryModelCopyWith<ServiceCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCategoryModelCopyWith<$Res> {
  factory $ServiceCategoryModelCopyWith(ServiceCategoryModel value,
          $Res Function(ServiceCategoryModel) then) =
      _$ServiceCategoryModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'is_active') int? isActive,
      String? image,
      bool? isSelected});
}

/// @nodoc
class _$ServiceCategoryModelCopyWithImpl<$Res>
    implements $ServiceCategoryModelCopyWith<$Res> {
  _$ServiceCategoryModelCopyWithImpl(this._value, this._then);

  final ServiceCategoryModel _value;
  // ignore: unused_field
  final $Res Function(ServiceCategoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? image = freezed,
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
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceCategoryModelCopyWith<$Res>
    implements $ServiceCategoryModelCopyWith<$Res> {
  factory _$$_ServiceCategoryModelCopyWith(_$_ServiceCategoryModel value,
          $Res Function(_$_ServiceCategoryModel) then) =
      __$$_ServiceCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'is_active') int? isActive,
      String? image,
      bool? isSelected});
}

/// @nodoc
class __$$_ServiceCategoryModelCopyWithImpl<$Res>
    extends _$ServiceCategoryModelCopyWithImpl<$Res>
    implements _$$_ServiceCategoryModelCopyWith<$Res> {
  __$$_ServiceCategoryModelCopyWithImpl(_$_ServiceCategoryModel _value,
      $Res Function(_$_ServiceCategoryModel) _then)
      : super(_value, (v) => _then(v as _$_ServiceCategoryModel));

  @override
  _$_ServiceCategoryModel get _value => super._value as _$_ServiceCategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? image = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_ServiceCategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$_ServiceCategoryModel extends _ServiceCategoryModel {
  const _$_ServiceCategoryModel(
      {this.id,
      this.name,
      @JsonKey(name: 'is_active') this.isActive,
      this.image,
      this.isSelected = false})
      : super._();

  factory _$_ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceCategoryModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  final String? image;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'ServiceCategoryModel(id: $id, name: $name, isActive: $isActive, image: $image, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceCategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.isActive, isActive) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(isActive),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceCategoryModelCopyWith<_$_ServiceCategoryModel> get copyWith =>
      __$$_ServiceCategoryModelCopyWithImpl<_$_ServiceCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceCategoryModelToJson(
      this,
    );
  }
}

abstract class _ServiceCategoryModel extends ServiceCategoryModel {
  const factory _ServiceCategoryModel(
      {final int? id,
      final String? name,
      @JsonKey(name: 'is_active') final int? isActive,
      final String? image,
      final bool? isSelected}) = _$_ServiceCategoryModel;
  const _ServiceCategoryModel._() : super._();

  factory _ServiceCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceCategoryModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'is_active')
  int? get isActive;
  @override
  String? get image;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceCategoryModelCopyWith<_$_ServiceCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get credits => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_type')
  int? get durationType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int? get addOnCategoryId => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      double? credits,
      double? price,
      int? duration,
      @JsonKey(name: 'duration_type') int? durationType,
      String? description,
      @JsonKey(name: 'is_active') int? addOnCategoryId,
      bool? isSelected});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res> implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  final PlanModel _value;
  // ignore: unused_field
  final $Res Function(PlanModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? price = freezed,
    Object? duration = freezed,
    Object? durationType = freezed,
    Object? description = freezed,
    Object? addOnCategoryId = freezed,
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
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationType: durationType == freezed
          ? _value.durationType
          : durationType // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryId: addOnCategoryId == freezed
          ? _value.addOnCategoryId
          : addOnCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_PlanModelCopyWith<$Res> implements $PlanModelCopyWith<$Res> {
  factory _$$_PlanModelCopyWith(
          _$_PlanModel value, $Res Function(_$_PlanModel) then) =
      __$$_PlanModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      double? credits,
      double? price,
      int? duration,
      @JsonKey(name: 'duration_type') int? durationType,
      String? description,
      @JsonKey(name: 'is_active') int? addOnCategoryId,
      bool? isSelected});
}

/// @nodoc
class __$$_PlanModelCopyWithImpl<$Res> extends _$PlanModelCopyWithImpl<$Res>
    implements _$$_PlanModelCopyWith<$Res> {
  __$$_PlanModelCopyWithImpl(
      _$_PlanModel _value, $Res Function(_$_PlanModel) _then)
      : super(_value, (v) => _then(v as _$_PlanModel));

  @override
  _$_PlanModel get _value => super._value as _$_PlanModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? price = freezed,
    Object? duration = freezed,
    Object? durationType = freezed,
    Object? description = freezed,
    Object? addOnCategoryId = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_$_PlanModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as double?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      durationType: durationType == freezed
          ? _value.durationType
          : durationType // ignore: cast_nullable_to_non_nullable
              as int?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      addOnCategoryId: addOnCategoryId == freezed
          ? _value.addOnCategoryId
          : addOnCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanModel extends _PlanModel {
  const _$_PlanModel(
      {this.id,
      this.name,
      this.credits,
      this.price,
      this.duration,
      @JsonKey(name: 'duration_type') this.durationType,
      this.description,
      @JsonKey(name: 'is_active') this.addOnCategoryId,
      this.isSelected = false})
      : super._();

  factory _$_PlanModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlanModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? credits;
  @override
  final double? price;
  @override
  final int? duration;
  @override
  @JsonKey(name: 'duration_type')
  final int? durationType;
  @override
  final String? description;
  @override
  @JsonKey(name: 'is_active')
  final int? addOnCategoryId;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'PlanModel(id: $id, name: $name, credits: $credits, price: $price, duration: $duration, durationType: $durationType, description: $description, addOnCategoryId: $addOnCategoryId, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlanModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.credits, credits) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality()
                .equals(other.durationType, durationType) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.addOnCategoryId, addOnCategoryId) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(credits),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(durationType),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(addOnCategoryId),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      __$$_PlanModelCopyWithImpl<_$_PlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanModelToJson(
      this,
    );
  }
}

abstract class _PlanModel extends PlanModel {
  const factory _PlanModel(
      {final int? id,
      final String? name,
      final double? credits,
      final double? price,
      final int? duration,
      @JsonKey(name: 'duration_type') final int? durationType,
      final String? description,
      @JsonKey(name: 'is_active') final int? addOnCategoryId,
      final bool? isSelected}) = _$_PlanModel;
  const _PlanModel._() : super._();

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$_PlanModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get credits;
  @override
  double? get price;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'duration_type')
  int? get durationType;
  @override
  String? get description;
  @override
  @JsonKey(name: 'is_active')
  int? get addOnCategoryId;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceDtoModel _$ServiceDtoModelFromJson(Map<String, dynamic> json) {
  return _ServiceDtoModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceDtoModel {
  @JsonKey(name: 'service_id')
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get credits => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceDtoModelCopyWith<ServiceDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDtoModelCopyWith<$Res> {
  factory $ServiceDtoModelCopyWith(
          ServiceDtoModel value, $Res Function(ServiceDtoModel) then) =
      _$ServiceDtoModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'service_id') int? id,
      String? name,
      int? credits,
      int? quantity});
}

/// @nodoc
class _$ServiceDtoModelCopyWithImpl<$Res>
    implements $ServiceDtoModelCopyWith<$Res> {
  _$ServiceDtoModelCopyWithImpl(this._value, this._then);

  final ServiceDtoModel _value;
  // ignore: unused_field
  final $Res Function(ServiceDtoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? quantity = freezed,
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
      credits: credits == freezed
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceDtoModelCopyWith<$Res>
    implements $ServiceDtoModelCopyWith<$Res> {
  factory _$$_ServiceDtoModelCopyWith(
          _$_ServiceDtoModel value, $Res Function(_$_ServiceDtoModel) then) =
      __$$_ServiceDtoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'service_id') int? id,
      String? name,
      int? credits,
      int? quantity});
}

/// @nodoc
class __$$_ServiceDtoModelCopyWithImpl<$Res>
    extends _$ServiceDtoModelCopyWithImpl<$Res>
    implements _$$_ServiceDtoModelCopyWith<$Res> {
  __$$_ServiceDtoModelCopyWithImpl(
      _$_ServiceDtoModel _value, $Res Function(_$_ServiceDtoModel) _then)
      : super(_value, (v) => _then(v as _$_ServiceDtoModel));

  @override
  _$_ServiceDtoModel get _value => super._value as _$_ServiceDtoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? credits = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_ServiceDtoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceDtoModel extends _ServiceDtoModel {
  const _$_ServiceDtoModel(
      {@JsonKey(name: 'service_id') this.id,
      this.name,
      this.credits,
      this.quantity})
      : super._();

  factory _$_ServiceDtoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceDtoModelFromJson(json);

  @override
  @JsonKey(name: 'service_id')
  final int? id;
  @override
  final String? name;
  @override
  final int? credits;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'ServiceDtoModel(id: $id, name: $name, credits: $credits, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceDtoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.credits, credits) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(credits),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceDtoModelCopyWith<_$_ServiceDtoModel> get copyWith =>
      __$$_ServiceDtoModelCopyWithImpl<_$_ServiceDtoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceDtoModelToJson(
      this,
    );
  }
}

abstract class _ServiceDtoModel extends ServiceDtoModel {
  const factory _ServiceDtoModel(
      {@JsonKey(name: 'service_id') final int? id,
      final String? name,
      final int? credits,
      final int? quantity}) = _$_ServiceDtoModel;
  const _ServiceDtoModel._() : super._();

  factory _ServiceDtoModel.fromJson(Map<String, dynamic> json) =
      _$_ServiceDtoModel.fromJson;

  @override
  @JsonKey(name: 'service_id')
  int? get id;
  @override
  String? get name;
  @override
  int? get credits;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceDtoModelCopyWith<_$_ServiceDtoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
