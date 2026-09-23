// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyReportsDataModel _$NearbyReportsDataModelFromJson(
  Map<String, dynamic> json,
) => _NearbyReportsDataModel(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : NearbyReportsCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  status: json['status'] as String?,
  photoUrls: (json['photo_urls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$NearbyReportsDataModelToJson(
  _NearbyReportsDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'status': instance.status,
  'photo_urls': instance.photoUrls,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'created_at': instance.createdAt,
};

_NearbyReportsCategoryModel _$NearbyReportsCategoryModelFromJson(
  Map<String, dynamic> json,
) => _NearbyReportsCategoryModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$NearbyReportsCategoryModelToJson(
  _NearbyReportsCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'is_active': instance.isActive,
};
