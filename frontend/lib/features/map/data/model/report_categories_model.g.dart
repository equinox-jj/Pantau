// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportCategoriesDataModel _$ReportCategoriesDataModelFromJson(
  Map<String, dynamic> json,
) => _ReportCategoriesDataModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$ReportCategoriesDataModelToJson(
  _ReportCategoriesDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'is_active': instance.isActive,
};
