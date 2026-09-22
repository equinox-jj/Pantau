import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/di/core_di.dart';
import '../../../../../../core/service/service.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'map_notifier.freezed.dart';
part 'map_notifier.g.dart';

/// Ground radius of every nearby-reports fetch, and of the ring drawn on the
/// map.
///
/// Fixed rather than derived from the camera: the ring promises which reports
/// are loaded, so the two must be the same number.
const int kNearbyRadiusInMeters = 1000;

/// Everything the map tab shows: device/search pins, the loaded-area ring,
/// the category filter, and the two report lists it drives.
@freezed
abstract class MapPageState with _$MapPageState {
  const factory MapPageState({
    /// The last device position that resolved, for the pin marking it on the
    /// map.
    ///
    /// Separate from [mapLocation], which goes loading on every locate tap
    /// and carries the permission outcome; the pin must stay put across a
    /// re-locate.
    LatLng? currentLocation,

    /// Centre of the last nearby-reports fetch, for the ring drawn around it.
    ///
    /// Not [currentLocation]: the fetch follows whatever the user last asked
    /// to look at, and the ring must mark the ground actually loaded.
    LatLng? loadedArea,

    /// The category the map is filtered to, or `null` for "All" (FR-10).
    ///
    /// Holds an id rather than a `ReportCategory`: the taxonomy can be
    /// refetched, so a selection stored as an entity would go stale.
    int? categoryFilter,

    /// The device-location request for the map tab. Holds the raw
    /// [LocationResult] so the listener can branch on permission outcomes.
    @Default(AsyncData(null)) AsyncValue<LocationResult?> mapLocation,

    /// Nearby reports for the current map camera.
    @Default(AsyncData([])) AsyncValue<List<NearbyReport>> nearbyReports,

    /// The last successfully loaded page of [nearbyReports], held across its
    /// loading and error states.
    ///
    /// Markers would otherwise blink out on every pan refetch.
    @Default([]) List<NearbyReport> visibleReports,

    /// [visibleReports] narrowed by [categoryFilter].
    ///
    /// Filtered client-side rather than through `GET /reports/nearby`, so
    /// chip switching is synchronous and costs no refetch. The trade is that
    /// only the loaded page is filtered; see the design doc's "Known
    /// constraint".
    ///
    /// Stored rather than computed on read: a getter would allocate a new
    /// list identity on every access, which would defeat `select()` and
    /// repaint the marker layer on any unrelated state change (e.g. a
    /// re-locate).
    @Default([]) List<NearbyReport> filteredReports,

    /// Results of the place-search field above the map.
    ///
    /// `null` means the panel is closed — distinct from `AsyncData([])`,
    /// which means "searched, found nothing".
    AsyncValue<List<Place>>? placeSearch,

    /// The place the user jumped to, marked with a pin on the map.
    ///
    /// Separate from [placeSearch] for lifetime: the result list dies with
    /// the panel, the pin stays until the search field is cleared.
    Place? searchedPlace,
  }) = _MapPageState;
}

/// [reports] narrowed by [categoryId], or [reports] itself when there is
/// nothing to filter by — same instance, not a copy, so an unfiltered map
/// allocates nothing.
List<NearbyReport> _filterReports(List<NearbyReport> reports, int? categoryId) {
  if (categoryId == null) return reports;

  return reports
      .where((report) => report.category?.id == categoryId)
      .toList(growable: false);
}

/// Owns every piece of state the map tab shows.
@riverpod
class MapNotifier extends _$MapNotifier {
  /// Camera used by the most recent [loadNearby] call, replayed by
  /// [refreshNearby].
  double? _nearbyLatitude;
  double? _nearbyLongitude;
  int? _nearbyRadiusInMeters;

  /// Guards against out-of-order nearby-reports responses: a superseded
  /// request must not overwrite a newer one's state.
  int _nearbyRequestId = 0;

  /// Query of the most recent [searchPlaces], replayed by [retrySearch].
  String? _searchQuery;
  PlaceViewBox? _searchViewBox;

  /// Guards against out-of-order place-search responses.
  int _searchRequestId = 0;

  @override
  MapPageState build() => const MapPageState();

  void updateCurrentLocation(LatLng position) =>
      state = state.copyWith(currentLocation: position);

  void updateLoadedArea(LatLng center) =>
      state = state.copyWith(loadedArea: center);

  void selectCategory(int? categoryId) => state = state.copyWith(
    categoryFilter: categoryId,
    filteredReports: _filterReports(state.visibleReports, categoryId),
  );

  /// Back to "All". Named for the empty state's action, not the value.
  void clearCategory() => state = state.copyWith(
    categoryFilter: null,
    filteredReports: state.visibleReports,
  );

  Future<void> locate() async {
    state = state.copyWith(mapLocation: const AsyncLoading());

    final locationService = ref.read(locationServiceProvider);
    final result = await locationService.getCurrentLocation();
    if (!ref.mounted) return;

    state = state.copyWith(mapLocation: AsyncData(result));
  }

  Future<void> openSettings() =>
      ref.read(locationServiceProvider).openSettings();

  Future<void> loadNearby({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
  }) async {
    _nearbyLatitude = latitude;
    _nearbyLongitude = longitude;
    _nearbyRadiusInMeters = radiusInMeters;

    final requestId = ++_nearbyRequestId;
    state = state.copyWith(nearbyReports: const AsyncLoading());

    final usecase = ref.read(getNearbyReportsUsecaseProvider);
    final params = GetNearbyReportsParams(
      latitude: latitude,
      longitude: longitude,
      radiusInMeters: radiusInMeters,
    );
    final result = await usecase(params);
    if (!ref.mounted) return;
    // A newer loadNearby() owns the state now — drop this stale result.
    if (requestId != _nearbyRequestId) return;

    result.fold(
      (l) => state = state.copyWith(
        nearbyReports: AsyncError<List<NearbyReport>>(l, StackTrace.current),
      ),
      // All three fields update together: visibleReports (and the filter
      // derived from it) only ever advance on a success, so they survive the
      // next loadNearby()'s loading/error states without a separate listener
      // to memoise them.
      (r) => state = state.copyWith(
        nearbyReports: AsyncData(r),
        visibleReports: r,
        filteredReports: _filterReports(r, state.categoryFilter),
      ),
    );
  }

  /// Replays the last camera so a mutation elsewhere can refresh the list
  /// without wiping it via `invalidate`. No-op if [loadNearby] never ran.
  Future<void> refreshNearby() {
    final latitude = _nearbyLatitude;
    final longitude = _nearbyLongitude;
    final radiusInMeters = _nearbyRadiusInMeters;
    if (latitude == null || longitude == null || radiusInMeters == null) {
      return Future<void>.value();
    }

    return loadNearby(
      latitude: latitude,
      longitude: longitude,
      radiusInMeters: radiusInMeters,
    );
  }

  /// Runs on submit only, never per keystroke: public Nominatim asks callers
  /// not to drive autocomplete off `/search`, and one request per submit
  /// stays inside its 1 request/second policy.
  Future<void> searchPlaces(String query, {PlaceViewBox? viewBox}) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      clearSearch();
      return;
    }

    _searchQuery = trimmed;
    _searchViewBox = viewBox;

    final requestId = ++_searchRequestId;
    state = state.copyWith(placeSearch: const AsyncLoading());

    final usecase = ref.read(searchPlacesUsecaseProvider);
    final result = await usecase(
      SearchPlacesParams(query: trimmed, viewBox: viewBox),
    );
    if (!ref.mounted) return;
    // A newer search owns the state now — drop this stale result.
    if (requestId != _searchRequestId) return;

    result.fold(
      (l) => state = state.copyWith(
        placeSearch: AsyncError<List<Place>>(l, StackTrace.current),
      ),
      (r) => state = state.copyWith(placeSearch: AsyncData(r)),
    );
  }

  /// Replays the last query. No-op if [searchPlaces] never ran.
  Future<void> retrySearch() {
    final query = _searchQuery;
    if (query == null) return Future<void>.value();

    return searchPlaces(query, viewBox: _searchViewBox);
  }

  /// Closes the results panel. Any in-flight request is orphaned by the id
  /// bump, so a late response cannot reopen it.
  void clearSearch() {
    _searchRequestId++;
    _searchQuery = null;
    _searchViewBox = null;
    state = state.copyWith(placeSearch: null);
  }

  void selectPlace(Place place) => state = state.copyWith(searchedPlace: place);

  void clearSearchedPlace() => state = state.copyWith(searchedPlace: null);
}
