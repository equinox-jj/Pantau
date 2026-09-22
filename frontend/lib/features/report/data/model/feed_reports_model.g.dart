// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedReportsModel _$FeedReportsModelFromJson(Map<String, dynamic> json) =>
    _FeedReportsModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FeedReportsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedReportsModelToJson(_FeedReportsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_FeedReportsDataModel _$FeedReportsDataModelFromJson(
  Map<String, dynamic> json,
) => _FeedReportsDataModel(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : FeedReportsCategoryModel.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  status: json['status'] as String?,
  description: json['description'] as String?,
  photoUrls: (json['photo_urls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$FeedReportsDataModelToJson(
  _FeedReportsDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'status': instance.status,
  'description': instance.description,
  'photo_urls': instance.photoUrls,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'created_at': instance.createdAt,
};

_FeedReportsCategoryModel _$FeedReportsCategoryModelFromJson(
  Map<String, dynamic> json,
) => _FeedReportsCategoryModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  isActive: json['is_active'] as bool?,
);

Map<String, dynamic> _$FeedReportsCategoryModelToJson(
  _FeedReportsCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'is_active': instance.isActive,
};
