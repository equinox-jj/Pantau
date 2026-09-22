// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueModel _$QueueModelFromJson(Map<String, dynamic> json) => _QueueModel(
  status: json['status'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : QueueDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QueueModelToJson(_QueueModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_QueueDataModel _$QueueDataModelFromJson(Map<String, dynamic> json) =>
    _QueueDataModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => QueueReportDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : QueueMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      counts: json['counts'] == null
          ? null
          : QueueCountsModel.fromJson(json['counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueueDataModelToJson(_QueueDataModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
      'counts': instance.counts,
    };

_QueueReportDataModel _$QueueReportDataModelFromJson(
  Map<String, dynamic> json,
) => _QueueReportDataModel(
  id: json['id'] as String?,
  category: json['category'] == null
      ? null
      : QueueCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  description: json['description'] as String?,
  photoUrls: (json['photo_urls'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
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
  'photo_urls': instance.photoUrls,
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

_QueueMetaModel _$QueueMetaModelFromJson(Map<String, dynamic> json) =>
    _QueueMetaModel(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      hasNext: json['has_next'] as bool?,
    );

Map<String, dynamic> _$QueueMetaModelToJson(_QueueMetaModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
      'has_next': instance.hasNext,
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
