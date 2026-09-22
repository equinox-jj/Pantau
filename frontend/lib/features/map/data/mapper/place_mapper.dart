import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension PlaceModelListMapper on List<PlaceModel> {
  /// Drops hits without usable coordinates — a row the map cannot move to is
  /// worse than a shorter list.
  List<Place> toEntities() =>
      map((e) => e.toEntity()).whereType<Place>().toList(growable: false);
}

extension PlaceModelMapper on PlaceModel {
  /// Returns `null` when the hit has no parsable latitude/longitude.
  Place? toEntity() {
    final latitude = double.tryParse(lat ?? '');
    final longitude = double.tryParse(lon ?? '');
    if (latitude == null || longitude == null) return null;

    // `display_name` runs most-specific-first ("Monas, Gambir, Jakarta
    // Pusat"). Head is the title when there is no `name`; tail is the
    // subtitle.
    final segments = (displayName ?? '')
        .split(',')
        .map((segment) => segment.trim())
        .where((segment) => segment.isNotEmpty)
        .toList(growable: false);

    final title = switch (name?.trim()) {
      final value? when value.isNotEmpty => value,
      _ => segments.firstOrNull ?? 'Unknown place',
    };

    return Place(
      id: '${placeId ?? '$latitude,$longitude'}',
      name: title,
      address: segments.skip(1).join(', '),
      latitude: latitude,
      longitude: longitude,
    );
  }
}
