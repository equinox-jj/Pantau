import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../map/di/map_di.dart';
import '../../../../../map/domain/entity/entity.dart';
import '../../../../../map/domain/usecase/search_places_usecase.dart';
import '../../../../di/resolver_di.dart';
import '../../../../domain/entity/resolver_entity.dart';
import '../../../../domain/usecase/resolver_usecase.dart';

part 'resolver_map_notifier.freezed.dart';
part 'resolver_map_notifier.g.dart';

/// Single-page cap for the map. There is no scroll position to page
/// against and no "load more" affordance a marker layer could show, so it
/// fetches one larger page instead of paginating the way the Queue does.
/// Radius matches `kNearbyRadiusInMeters` (citizen map) rather than
/// `kQueueRadiusInMeters` (`queue_notifier.dart`) — the map's ring
/// is meant to mirror the citizen map, not the Queue tab's wider search.
const int kResolverMapLimit = 50;
const int kResolverMapRadiusInMeters = 1000;

/// The map's own tab selection, the reports plotted for it, and whichever
/// marker's preview card is showing.
@freezed
abstract class ResolverMapPageState with _$ResolverMapPageState {
  const factory ResolverMapPageState({
    /// Independent of `QueueNotifier`'s tab — switching tabs on the map never
    /// changes what the Queue page shows next, and vice versa. Defaults to
    /// the actionable "open" bucket.
    @Default(QueueTab.open) QueueTab tab,

    /// One-shot fetch, no pagination — re-locating or switching tabs is the
    /// only refresh trigger.
    @Default(AsyncLoading()) AsyncValue<QueueResult> reports,

    /// The report whose preview card is showing, or null when none is
    /// selected. Set by a marker tap, replaced by the next marker tap,
    /// cleared when the active tab changes (the previous selection may not
    /// even be in the new tab's result set).
    QueueReport? selectedReport,

    /// Results of the place-search field above the map.
    ///
    /// `null` means the panel is closed — distinct from `AsyncData([])`,
    /// which means "searched, found nothing".
    AsyncValue<List<Place>>? placeSearch,

    /// The place the resolver jumped to, marked with a pin on the map.
    ///
    /// Separate from [placeSearch] for lifetime: the result list dies with
    /// the panel, the pin stays until the search field is cleared.
    Place? searchedPlace,
  }) = _ResolverMapPageState;
}

@riverpod
class ResolverMapNotifier extends _$ResolverMapNotifier {
  /// Guards against out-of-order responses: a superseded request must not
  /// overwrite a newer one's state.
  int _requestId = 0;

  /// Query of the most recent [searchPlaces], replayed by [retrySearch].
  String? _searchQuery;
  PlaceViewBox? _searchViewBox;

  /// Guards against out-of-order place-search responses.
  int _searchRequestId = 0;

  @override
  ResolverMapPageState build() => const ResolverMapPageState();

  void selectTab(QueueTab tab) => state = state.copyWith(tab: tab);

  Future<void> load({
    required QueueTab tab,
    required double latitude,
    required double longitude,
  }) async {
    final requestId = ++_requestId;
    if (!state.reports.hasValue) {
      state = state.copyWith(reports: const AsyncLoading());
    }

    final usecase = ref.read(getQueueUsecaseProvider);
    final result = await usecase(
      GetQueueParams(
        tab: tab,
        latitude: latitude,
        longitude: longitude,
        radiusMeter: kResolverMapRadiusInMeters,
        limit: kResolverMapLimit,
        offset: 0,
      ),
    );
    if (!ref.mounted) return;
    if (requestId != _requestId) return;

    result.fold(
      (l) => state = state.copyWith(
        reports: AsyncError<QueueResult>(l, StackTrace.current),
      ),
      (r) => state = state.copyWith(reports: AsyncData(r)),
    );
  }

  void selectReport(QueueReport report) =>
      state = state.copyWith(selectedReport: report);

  void clearSelectedReport() => state = state.copyWith(selectedReport: null);

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
