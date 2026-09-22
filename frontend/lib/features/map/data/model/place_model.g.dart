// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => _PlaceModel(
  placeId: (json['place_id'] as num?)?.toInt(),
  lat: json['lat'] as String?,
  lon: json['lon'] as String?,
  name: json['name'] as String?,
  displayName: json['display_name'] as String?,
);

Map<String, dynamic> _$PlaceModelToJson(_PlaceModel instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'lat': instance.lat,
      'lon': instance.lon,
      'name': instance.name,
      'display_name': instance.displayName,
    };
