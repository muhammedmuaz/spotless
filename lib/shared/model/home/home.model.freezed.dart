// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return _HomeModel.fromJson(json);
}

/// @nodoc
mixin _$HomeModel {
  List<BannersModel>? get banners => throw _privateConstructorUsedError;
  @JsonKey(name: 'service_categories')
  List<ServiceCategoryModel>? get serviceCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'popular_services')
  List<ProductServiceModel>? get popularServices =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelCopyWith<HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) then) =
      _$HomeModelCopyWithImpl<$Res>;
  $Res call(
      {List<BannersModel>? banners,
      @JsonKey(name: 'service_categories')
          List<ServiceCategoryModel>? serviceCategories,
      @JsonKey(name: 'popular_services')
          List<ProductServiceModel>? popularServices});
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._value, this._then);

  final HomeModel _value;
  // ignore: unused_field
  final $Res Function(HomeModel) _then;

  @override
  $Res call({
    Object? banners = freezed,
    Object? serviceCategories = freezed,
    Object? popularServices = freezed,
  }) {
    return _then(_value.copyWith(
      banners: banners == freezed
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannersModel>?,
      serviceCategories: serviceCategories == freezed
          ? _value.serviceCategories
          : serviceCategories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategoryModel>?,
      popularServices: popularServices == freezed
          ? _value.popularServices
          : popularServices // ignore: cast_nullable_to_non_nullable
              as List<ProductServiceModel>?,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeModelCopyWith<$Res> implements $HomeModelCopyWith<$Res> {
  factory _$$_HomeModelCopyWith(
          _$_HomeModel value, $Res Function(_$_HomeModel) then) =
      __$$_HomeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<BannersModel>? banners,
      @JsonKey(name: 'service_categories')
          List<ServiceCategoryModel>? serviceCategories,
      @JsonKey(name: 'popular_services')
          List<ProductServiceModel>? popularServices});
}

/// @nodoc
class __$$_HomeModelCopyWithImpl<$Res> extends _$HomeModelCopyWithImpl<$Res>
    implements _$$_HomeModelCopyWith<$Res> {
  __$$_HomeModelCopyWithImpl(
      _$_HomeModel _value, $Res Function(_$_HomeModel) _then)
      : super(_value, (v) => _then(v as _$_HomeModel));

  @override
  _$_HomeModel get _value => super._value as _$_HomeModel;

  @override
  $Res call({
    Object? banners = freezed,
    Object? serviceCategories = freezed,
    Object? popularServices = freezed,
  }) {
    return _then(_$_HomeModel(
      banners: banners == freezed
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannersModel>?,
      serviceCategories: serviceCategories == freezed
          ? _value._serviceCategories
          : serviceCategories // ignore: cast_nullable_to_non_nullable
              as List<ServiceCategoryModel>?,
      popularServices: popularServices == freezed
          ? _value._popularServices
          : popularServices // ignore: cast_nullable_to_non_nullable
              as List<ProductServiceModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeModel extends _HomeModel {
  const _$_HomeModel(
      {final List<BannersModel>? banners,
      @JsonKey(name: 'service_categories')
          final List<ServiceCategoryModel>? serviceCategories,
      @JsonKey(name: 'popular_services')
          final List<ProductServiceModel>? popularServices})
      : _banners = banners,
        _serviceCategories = serviceCategories,
        _popularServices = popularServices,
        super._();

  factory _$_HomeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeModelFromJson(json);

  final List<BannersModel>? _banners;
  @override
  List<BannersModel>? get banners {
    final value = _banners;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ServiceCategoryModel>? _serviceCategories;
  @override
  @JsonKey(name: 'service_categories')
  List<ServiceCategoryModel>? get serviceCategories {
    final value = _serviceCategories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductServiceModel>? _popularServices;
  @override
  @JsonKey(name: 'popular_services')
  List<ProductServiceModel>? get popularServices {
    final value = _popularServices;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeModel(banners: $banners, serviceCategories: $serviceCategories, popularServices: $popularServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModel &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._serviceCategories, _serviceCategories) &&
            const DeepCollectionEquality()
                .equals(other._popularServices, _popularServices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_serviceCategories),
      const DeepCollectionEquality().hash(_popularServices));

  @JsonKey(ignore: true)
  @override
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      __$$_HomeModelCopyWithImpl<_$_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeModelToJson(
      this,
    );
  }
}

abstract class _HomeModel extends HomeModel {
  const factory _HomeModel(
      {final List<BannersModel>? banners,
      @JsonKey(name: 'service_categories')
          final List<ServiceCategoryModel>? serviceCategories,
      @JsonKey(name: 'popular_services')
          final List<ProductServiceModel>? popularServices}) = _$_HomeModel;
  const _HomeModel._() : super._();

  factory _HomeModel.fromJson(Map<String, dynamic> json) =
      _$_HomeModel.fromJson;

  @override
  List<BannersModel>? get banners;
  @override
  @JsonKey(name: 'service_categories')
  List<ServiceCategoryModel>? get serviceCategories;
  @override
  @JsonKey(name: 'popular_services')
  List<ProductServiceModel>? get popularServices;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelCopyWith<_$_HomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
