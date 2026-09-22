import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

/// One Nominatim search hit.
///
/// Nominatim answers with a bare JSON array and no `{status, message, data}`
/// envelope, so this models one element, not the response. Coordinates arrive
/// as strings and stay strings here — the mapper parses them.
@freezed
abstract class PlaceModel with _$PlaceModel {
  const factory PlaceModel({
    @JsonKey(name: "place_id") int? placeId,
    @JsonKey(name: "lat") String? lat,
    @JsonKey(name: "lon") String? lon,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "display_name") String? displayName,
  }) = _PlaceModel;

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
}
