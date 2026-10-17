import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/resolver/di/resolver_di.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';

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

    /// The place the resolver jumped to from the place search, marked with a
    /// pin on the map until the search bar is cleared.
    Place? searchedPlace,
  }) = _ResolverMapPageState;
}

@riverpod
class ResolverMapNotifier extends _$ResolverMapNotifier {
  /// Guards against out-of-order responses: a superseded request must not
  /// overwrite a newer one's state.
  int _requestId = 0;

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

  void selectPlace(Place place) => state = state.copyWith(searchedPlace: place);

  void clearSearchedPlace() => state = state.copyWith(searchedPlace: null);
}
