// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyReportsModel _$MyReportsModelFromJson(Map<String, dynamic> json) =>
    _MyReportsModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MyReportsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyReportsModelToJson(_MyReportsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_MyReportsDataModel _$MyReportsDataModelFromJson(Map<String, dynamic> json) =>
    _MyReportsDataModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FeedReportsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MyReportsMetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyReportsDataModelToJson(_MyReportsDataModel instance) =>
    <String, dynamic>{'items': instance.items, 'meta': instance.meta};

_MyReportsMetaModel _$MyReportsMetaModelFromJson(Map<String, dynamic> json) =>
    _MyReportsMetaModel(
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      hasNext: json['has_next'] as bool?,
    );

Map<String, dynamic> _$MyReportsMetaModelToJson(_MyReportsMetaModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
      'has_next': instance.hasNext,
    };
