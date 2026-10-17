import 'package:equatable/equatable.dart';

import 'package:pantau/features/map/domain/entity/entity.dart';

/// What a map hands the place-search screen when it opens it.
class PlaceSearchArgs extends Equatable {
  const PlaceSearchArgs({this.viewBox, this.initialQuery});

  /// The map's visible bounds, so "Gambir" resolves to the one on screen
  /// first. Null searches unbiased.
  final PlaceViewBox? viewBox;

  /// Prefills the field — the place the map already shows, so reopening the
  /// search resumes from it.
  final String? initialQuery;

  @override
  List<Object?> get props => [viewBox, initialQuery];
}
