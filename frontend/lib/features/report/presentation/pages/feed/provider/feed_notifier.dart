import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/di/core_di.dart';
import '../../../../../../core/service/service.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'feed_notifier.freezed.dart';
part 'feed_notifier.g.dart';

/// Ground radius of every feed fetch. Matches the map's ring, so both tabs
/// describe the same neighbourhood.
const int kFeedRadiusInMeters = 1000;

/// Page size. The API caps `limit` at 100; the feed asks for less because the
/// list is scrolled, not paged.
const int kFeedReportsLimit = 50;

/// A report plus its distance from the device, precomputed so the card
/// renders without doing geometry in `build`.
typedef FeedItem = ({FeedReport report, double? distanceInMeters});

/// The two lists the feed switches between.
///
/// Both render the same card; they differ in what the query is — a radius
/// around the device versus the caller's own submissions (that list is
/// `myReportsProvider`, shared with the profile tab and kept separate for
/// that reason).
enum FeedTab {
  nearby(label: 'Nearby'),
  mine(label: 'My reports');

  const FeedTab({required this.label});

  final String label;
}

/// Which segment is showing, the device-location request the nearby segment
/// runs on, and the nearby list itself.
@freezed
abstract class FeedPageState with _$FeedPageState {
  const factory FeedPageState({
    @Default(FeedTab.nearby) FeedTab tab,
    @Default(AsyncData(null)) AsyncValue<LocationResult?> location,

    /// Starts loading rather than empty: the page locates on mount, so an
    /// empty list before the first response would render as "nothing
    /// nearby".
    @Default(AsyncLoading()) AsyncValue<List<FeedItem>> nearbyReports,
  }) = _FeedPageState;
}

/// The feed tab: which segment is selected, and the nearby segment's
/// location-driven fetch.
///
/// Distance is resolved here rather than in a derived provider because the
/// origin is the very position this fetch used — pairing them anywhere else
/// risks measuring against a newer fix than the list was loaded for.
@riverpod
class FeedNotifier extends _$FeedNotifier {
  /// Origin of the most recent nearby [load], replayed by [refresh].
  double? _latitude;
  double? _longitude;

  /// Guards against out-of-order nearby-reports responses: a superseded
  /// request must not overwrite a newer one's state.
  int _requestId = 0;

  @override
  FeedPageState build() => const FeedPageState();

  void selectTab(FeedTab tab) {
    if (state.tab == tab) return;

    state = state.copyWith(tab: tab);
  }

  Future<void> locate() async {
    state = state.copyWith(location: const AsyncLoading());

    final locationService = ref.read(locationServiceProvider);
    final result = await locationService.getCurrentLocation();
    if (!ref.mounted) return;

    state = state.copyWith(location: AsyncData(result));
  }

  Future<void> openSettings() =>
      ref.read(locationServiceProvider).openSettings();

  Future<void> load({
    required double latitude,
    required double longitude,
  }) async {
    _latitude = latitude;
    _longitude = longitude;

    final requestId = ++_requestId;
    // Only a load with nothing on screen announces itself. A refetch keeps
    // the previous cards — the pull-to-refresh spinner is the progress
    // signal, and swapping the list for skeletons would throw the scroll
    // position away.
    if (!state.nearbyReports.hasValue) {
      state = state.copyWith(nearbyReports: const AsyncLoading());
    }

    final usecase = ref.read(getFeedReportsUsecaseProvider);
    final params = GetFeedReportsParams(
      latitude: latitude,
      longitude: longitude,
      radiusInMeters: kFeedRadiusInMeters,
      limit: kFeedReportsLimit,
    );
    final result = await usecase(params);
    if (!ref.mounted) return;
    // A newer load() owns the state now — drop this stale result.
    if (requestId != _requestId) return;

    result.fold(
      (l) => state = state.copyWith(
        nearbyReports: AsyncError<List<FeedItem>>(l, StackTrace.current),
      ),
      (r) => state = state.copyWith(
        nearbyReports: AsyncData(
          _toItems(r, latitude: latitude, longitude: longitude),
        ),
      ),
    );
  }

  /// Replays the last origin. No-op if [load] never ran.
  Future<void> refresh() {
    final latitude = _latitude;
    final longitude = _longitude;
    if (latitude == null || longitude == null) return Future<void>.value();

    return load(latitude: latitude, longitude: longitude);
  }

  List<FeedItem> _toItems(
    List<FeedReport> reports, {
    required double latitude,
    required double longitude,
  }) {
    return reports
        .map((report) {
          final reportLatitude = report.latitude;
          final reportLongitude = report.longitude;
          // A report without coordinates still belongs in the feed; only its
          // distance line is dropped.
          final distance = reportLatitude == null || reportLongitude == null
              ? null
              : distanceInMetersBetween(
                  startLatitude: latitude,
                  startLongitude: longitude,
                  endLatitude: reportLatitude,
                  endLongitude: reportLongitude,
                );

          return (report: report, distanceInMeters: distance);
        })
        .toList(growable: false);
  }
}
