// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModel _$$_HomeModelFromJson(Map<String, dynamic> json) => _$_HomeModel(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceCategories: (json['service_categories'] as List<dynamic>?)
          ?.map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularServices: (json['popular_services'] as List<dynamic>?)
          ?.map((e) => ProductServiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HomeModelToJson(_$_HomeModel instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'service_categories': instance.serviceCategories,
      'popular_services': instance.popularServices,
    };
