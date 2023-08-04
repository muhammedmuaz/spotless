import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../product/product.model.dart';
part 'home.model.freezed.dart';
part 'home.model.g.dart';

@freezed
@immutable
class HomeModel with _$HomeModel {
  const HomeModel._();
  const factory HomeModel({
    List<BannersModel>? banners,
    @JsonKey(name: 'service_categories') List<ServiceCategoryModel>? serviceCategories,
    @JsonKey(name: 'popular_services') List<ProductServiceModel>? popularServices,
  }) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
