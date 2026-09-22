import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/utils/enums/enums.dart';
import '../../../../di/resolver_di.dart';
import '../../../../domain/entity/resolver_entity.dart';
import '../../../../domain/usecase/resolver_usecase.dart';

part 'queue_notifier.freezed.dart';
part 'queue_notifier.g.dart';

/// Ground radius of every queue fetch. Matches the API's own default.
const int kQueueRadiusInMeters = 5000;

/// Page size — the queue pages through `offset` rather than fetching
/// everything at once, unlike the citizen feed.
const int kQueueLimit = 20;

/// One page (or accumulated pages) of the queue: the rows shown so far, the
/// tab counts from the most recent response, whether another page follows,
/// and whether a [QueueNotifier.loadMore] call is currently in flight.
@freezed
abstract class QueueListState with _$QueueListState {
  const factory QueueListState({
    required List<QueueReport> items,
    required QueueCounts counts,
    required bool hasNext,
    @Default(false) bool isLoadingMore,

    /// Set when the most recent [QueueNotifier.loadMore] page failed. Cleared
    /// as soon as another [QueueNotifier.loadMore] attempt starts.
    @Default(false) bool loadMoreFailed,
  }) = _QueueListState;
}

/// Which segment of the queue is showing, and the fetch that segment drove.
@freezed
abstract class QueuePageState with _$QueuePageState {
  const factory QueuePageState({
    @Default(QueueTab.open) QueueTab tab,

    /// Starts loading rather than empty: the page locates on mount, so an
    /// empty list before the first response would render as "nothing here".
    @Default(AsyncLoading()) AsyncValue<QueueListState> queue,
  }) = _QueuePageState;
}

/// The active tab's queue, newest fetch wins.
///
/// Switching tabs calls [load] again rather than keeping three lists cached
/// — every response already carries fresh counts for all three tabs, so the
/// tab counts stay in sync across switches even though the list itself
/// refetches. Three parallel cached lists would be unnecessary complexity for
/// a first version.
@riverpod
class QueueNotifier extends _$QueueNotifier {
  double? _latitude;
  double? _longitude;
  int _offset = 0;

  /// Guards against out-of-order responses: a superseded request must not
  /// overwrite a newer one's state.
  int _requestId = 0;

  /// True while a [load] is in flight. Lets [loadMore] no-op instead of
  /// racing a concurrent [load] (e.g. a tab switch) — see [loadMore].
  bool _isLoading = false;

  @override
  QueuePageState build() => const QueuePageState();

  void selectTab(QueueTab tab) {
    if (state.tab == tab) return;

    state = state.copyWith(tab: tab);
  }

  Future<void> load({
    required QueueTab tab,
    required double latitude,
    required double longitude,
  }) async {
    state = state.copyWith(tab: tab);
    _latitude = latitude;
    _longitude = longitude;
    _offset = 0;
    _isLoading = true;

    final requestId = ++_requestId;
    // Only a load with nothing on screen announces itself. A refetch (or a
    // tab switch) keeps the previous cards until the new page lands.
    if (!state.queue.hasValue) {
      state = state.copyWith(queue: const AsyncLoading());
    }

    final usecase = ref.read(getQueueUsecaseProvider);
    final result = await usecase(
      GetQueueParams(
        tab: tab,
        latitude: latitude,
        longitude: longitude,
        radiusMeter: kQueueRadiusInMeters,
        limit: kQueueLimit,
        offset: 0,
      ),
    );
    if (!ref.mounted) return;
    // A newer load() owns the state now — drop this stale result. Leave
    // _isLoading alone: the newer load() already set it true again.
    if (requestId != _requestId) return;
    _isLoading = false;

    result.fold(
      (l) => state = state.copyWith(
        queue: AsyncError<QueueListState>(l, StackTrace.current),
      ),
      (r) => state = state.copyWith(
        queue: AsyncData(
          QueueListState(items: r.items, counts: r.counts, hasNext: r.hasNext),
        ),
      ),
    );
  }

  /// Fetches the next page and appends it. No-op if there is nothing more, a
  /// page is already in flight, or [load] has not run yet.
  Future<void> loadMore() async {
    final tab = state.tab;
    final latitude = _latitude;
    final longitude = _longitude;
    final current = state.queue.value;
    if (latitude == null || longitude == null) return;
    if (current == null || !current.hasNext || current.isLoadingMore) return;
    // A load() (e.g. a tab switch) is in flight: current still holds the
    // previous tab's items, so paginating now would splice the two tabs'
    // pages together. Bail and let the in-flight load() land instead.
    if (_isLoading) return;

    state = state.copyWith(
      queue: AsyncData(
        current.copyWith(isLoadingMore: true, loadMoreFailed: false),
      ),
    );

    final requestId = ++_requestId;
    final nextOffset = _offset + kQueueLimit;
    final usecase = ref.read(getQueueUsecaseProvider);
    final result = await usecase(
      GetQueueParams(
        tab: tab,
        latitude: latitude,
        longitude: longitude,
        radiusMeter: kQueueRadiusInMeters,
        limit: kQueueLimit,
        offset: nextOffset,
      ),
    );
    if (!ref.mounted) return;
    if (requestId != _requestId) return;

    result.fold(
      // A failed page keeps the rows already shown; only the spinner clears,
      // replaced by a retry affordance.
      (l) => state = state.copyWith(
        queue: AsyncData(
          current.copyWith(isLoadingMore: false, loadMoreFailed: true),
        ),
      ),
      (r) {
        _offset = nextOffset;
        state = state.copyWith(
          queue: AsyncData(
            QueueListState(
              items: [...current.items, ...r.items],
              counts: r.counts,
              hasNext: r.hasNext,
            ),
          ),
        );
      },
    );
  }

  /// Replays the last (tab, position) from the first page. No-op if [load]
  /// never ran.
  Future<void> refresh() {
    final tab = state.tab;
    final latitude = _latitude;
    final longitude = _longitude;
    if (latitude == null || longitude == null) {
      return Future<void>.value();
    }

    return load(tab: tab, latitude: latitude, longitude: longitude);
  }
}
