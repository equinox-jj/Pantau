// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReportModel _$CreateReportModelFromJson(Map<String, dynamic> json) =>
    _CreateReportModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CreateReportDataModel.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CreateReportModelToJson(_CreateReportModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_CreateReportDataModel _$CreateReportDataModelFromJson(
  Map<String, dynamic> json,
) => _CreateReportDataModel(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : CreateReportCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  description: json['description'] as String?,
  photoUrls: (json['photo_urls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$CreateReportDataModelToJson(
  _CreateReportDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'description': instance.description,
  'photo_urls': instance.photoUrls,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_CreateReportCategoryModel _$CreateReportCategoryModelFromJson(
  Map<String, dynamic> json,
) => _CreateReportCategoryModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$CreateReportCategoryModelToJson(
  _CreateReportCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'is_active': instance.isActive,
};
