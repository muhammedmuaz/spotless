import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'product.model.freezed.dart';
part 'product.model.g.dart';

@freezed
@immutable
class ProductServiceModel with _$ProductServiceModel {
  const ProductServiceModel._();
  const factory ProductServiceModel(
      {int? qty,
      @JsonKey(name: 'service_id') int? serviceId,
      ServiceModel? service}) = _ProductServiceModel;
  factory ProductServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ProductServiceModelFromJson(json);
}

@freezed
@immutable
class ServiceModel with _$ServiceModel {
  const ServiceModel._();
  const factory ServiceModel(
      {int? id,
      String? name,
      @JsonKey(name: 'category_id') int? categoryId,
      String? image,
      double? price,
      @JsonKey(name: 'item_credit') int? itemCredit,
      @JsonKey(name: 'is_active') int? isActive,
      int? quantity,
      ServiceCategoryModel? category}) = _ServiceModel;
  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  String get imageUrl {
    if (image == null || image == '') {
      return '';
    }
    return 'http://spotless.vooly.in/public$image';
  }
}

@freezed
@immutable
class BannersModel with _$BannersModel {
  const BannersModel._();
  const factory BannersModel({
    int? id,
    String? name,
    @JsonKey(name: 'is_active') int? isActive,
    String? image,
  }) = _BannersModel;
  factory BannersModel.fromJson(Map<String, dynamic> json) =>
      _$BannersModelFromJson(json);
  String get imageUrl {
    if (image == null || image == '') {
      return '';
    }
    return 'http://spotless.vooly.in/public$image';
  }
}

@freezed
@immutable
class ServiceCategoryModel with _$ServiceCategoryModel {
  const ServiceCategoryModel._();
  const factory ServiceCategoryModel({
    int? id,
    String? name,
    @JsonKey(name: 'is_active') int? isActive,
    String? image,
    @Default(false) bool? isSelected,
  }) = _ServiceCategoryModel;

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);

  String get imageUrl {
    if (image == null || image == '') {
      return '';
    }
    return 'http://spotless.vooly.in/public$image';
  }
}

@freezed
@immutable
class PlanModel with _$PlanModel {
  const PlanModel._();
  const factory PlanModel({
    int? id,
    String? name,
    double? credits,
    double? price,
    int? duration,
    @JsonKey(name: 'duration_type') int? durationType,
    String? description,
    @JsonKey(name: 'is_active') int? addOnCategoryId,
    @Default(false) bool? isSelected,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  String? get durationTypeName {
    switch (durationType) {
      case 1:
        return "Day";
      case 2:
        return "Month";
      case 3:
        return "Year";
    }
  }
}

@freezed
@immutable
class ServiceDtoModel with _$ServiceDtoModel {
  const ServiceDtoModel._();
  const factory ServiceDtoModel(
      {@JsonKey(name: 'service_id') int? id,
      String? name,
      int? credits,
      int? quantity}) = _ServiceDtoModel;

  factory ServiceDtoModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceDtoModelFromJson(json);
}
