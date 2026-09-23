// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueModel _$QueueModelFromJson(Map<String, dynamic> json) => _QueueModel(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => QueueReportDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  counts: json['counts'] == null
      ? null
      : QueueCountsModel.fromJson(json['counts'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QueueModelToJson(_QueueModel instance) =>
    <String, dynamic>{'items': instance.items, 'counts': instance.counts};

_QueueReportDataModel _$QueueReportDataModelFromJson(
  Map<String, dynamic> json,
) => _QueueReportDataModel(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : QueueCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  description: json['description'] as String?,
  photoUrl: json['photo_url'] as String?,
  status: json['status'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  distanceMeter: (json['distance_meter'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$QueueReportDataModelToJson(
  _QueueReportDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'description': instance.description,
  'photo_url': instance.photoUrl,
  'status': instance.status,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distance_meter': instance.distanceMeter,
  'created_at': instance.createdAt,
};

_QueueCategoryModel _$QueueCategoryModelFromJson(Map<String, dynamic> json) =>
    _QueueCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$QueueCategoryModelToJson(_QueueCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'is_active': instance.isActive,
    };

_QueueCountsModel _$QueueCountsModelFromJson(Map<String, dynamic> json) =>
    _QueueCountsModel(
      open: (json['open'] as num?)?.toInt(),
      inProgress: (json['in_progress'] as num?)?.toInt(),
      resolved: (json['resolved'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QueueCountsModelToJson(_QueueCountsModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'in_progress': instance.inProgress,
      'resolved': instance.resolved,
    };
