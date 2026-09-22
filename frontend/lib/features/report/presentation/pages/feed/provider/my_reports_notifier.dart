import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';
import 'feed_notifier.dart';

part 'my_reports_notifier.g.dart';

/// Page size of the "My reports" tab. The API caps `limit` at 100; like the
/// nearby list this one is scrolled rather than paged.
const int kMyReportsLimit = 50;

/// The caller's own reports, newest first.
///
/// Shares [FeedItem] with the nearby tab so both feed segments render through
/// the same card. Distance is always null here: the list is not anchored to a
/// position, so measuring against the current fix would be meaningless.
@riverpod
class MyReports extends _$MyReports {
  /// Guards against out-of-order responses, same as the nearby tab.
  int _requestId = 0;

  /// The tab is lazy: the first watch is what pays for the fetch.
  ///
  /// Scheduled rather than called inline because a notifier may not touch
  /// `state` while it is building, and kicked off from here rather than from
  /// the page — an unwatched auto-disposed provider is thrown away between the
  /// tap and the rebuild that subscribes to it, taking the in-flight load with
  /// it and leaving the tab on skeletons for good.
  ///
  /// Kept alive for the same reason it is loaded here: switching tabs (or
  /// screens — the profile stats row watches this too) would otherwise
  /// dispose the list and make returning cost a fresh round trip. The nearby
  /// list survives switches already, held by the feed listener.
  @override
  AsyncValue<List<FeedItem>> build() {
    ref.keepAlive();
    Future.microtask(load);

    return const AsyncLoading();
  }

  Future<void> load() async {
    // The provider can be disposed between build() and this microtask.
    if (!ref.mounted) return;

    final requestId = ++_requestId;
    // A refetch keeps the previous cards on screen; only a first load has
    // nothing to show and falls back to skeletons.
    if (!state.hasValue) state = const AsyncLoading<List<FeedItem>>();

    final usecase = ref.read(getMyReportsUsecaseProvider);
    final result = await usecase(
      const GetMyReportsParams(limit: kMyReportsLimit),
    );
    if (!ref.mounted) return;
    // A newer load() owns the state now — drop this stale result.
    if (requestId != _requestId) return;

    result.fold(
      (l) => state = AsyncError<List<FeedItem>>(l, StackTrace.current),
      (r) => state = AsyncData(_toItems(r)),
    );
  }

  Future<void> refresh() => load();

  List<FeedItem> _toItems(List<FeedReport> reports) => reports
      .map<FeedItem>((report) => (report: report, distanceInMeters: null))
      .toList(growable: false);
}
