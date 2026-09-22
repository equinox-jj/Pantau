import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

/// A geocoded place the user can jump the map to. Every field is non-null: a
/// hit without usable coordinates is dropped during mapping.
@freezed
abstract class Place with _$Place {
  const factory Place({
    required String id,
    required String name,
    required String address,
    required double latitude,
    required double longitude,
  }) = _Place;
}

/// Rectangle biasing search results toward the current camera.
///
/// A plain value object so the domain never depends on `flutter_map`: the
/// notifier builds it from `MapCamera.visibleBounds`, the repository formats
/// it for the geocoder.
@freezed
abstract class PlaceViewBox with _$PlaceViewBox {
  const factory PlaceViewBox({
    required double minLatitude,
    required double minLongitude,
    required double maxLatitude,
    required double maxLongitude,
  }) = _PlaceViewBox;
}
