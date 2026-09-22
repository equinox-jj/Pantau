import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/service/service.dart';
import 'package:pantau/features/report/di/di.dart';
import 'package:pantau/features/report/domain/entity/entity.dart';
import 'package:pantau/features/report/domain/usecase/usecase.dart';
import 'package:pantau/features/report/presentation/pages/feed/provider/feed_notifier.dart';

class MockGetFeedReportsUsecase extends Mock implements GetFeedReportsUsecase {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const GetFeedReportsParams(latitude: 0, longitude: 0, radiusInMeters: 0),
    );
  });

  late MockGetFeedReportsUsecase usecase;
  late MockLocationService locationService;
  late ProviderContainer container;

  setUp(() {
    usecase = MockGetFeedReportsUsecase();
    locationService = MockLocationService();
    container = ProviderContainer(
      overrides: [
        getFeedReportsUsecaseProvider.overrideWithValue(usecase),
        locationServiceProvider.overrideWithValue(locationService),
      ],
    );
    addTearDown(container.dispose);
  });

  FeedNotifier notifier() => container.read(feedProvider.notifier);

  test(
    'initial state is nearby tab, no location, and loading nearby reports',
    () {
      final state = container.read(feedProvider);
      expect(state.tab, FeedTab.nearby);
      expect(state.location, const AsyncData<LocationResult?>(null));
      expect(state.nearbyReports, isA<AsyncLoading<List<FeedItem>>>());
    },
  );

  test('selectTab switches the active tab', () {
    notifier().selectTab(FeedTab.mine);
    expect(container.read(feedProvider).tab, FeedTab.mine);
  });

  test('selectTab is a no-op when the tab is already selected', () {
    final before = container.read(feedProvider);
    notifier().selectTab(FeedTab.nearby);
    expect(identical(container.read(feedProvider), before), isTrue);
  });

  test('locate() stores the location result from LocationService', () async {
    const result = LocationSuccess(
      latitude: 1,
      longitude: 2,
      accuracyInMeters: 5,
    );
    when(() => locationService.getCurrentLocation())
        .thenAnswer((_) async => result);

    await notifier().locate();

    expect(
      container.read(feedProvider).location,
      const AsyncData<LocationResult?>(result),
    );
  });

  test('openSettings() delegates to LocationService.openSettings', () async {
    when(() => locationService.openSettings()).thenAnswer((_) async {});

    await notifier().openSettings();

    verify(() => locationService.openSettings()).called(1);
  });

  test(
    'load() success maps reports into items with computed distance',
    () async {
      const report = FeedReport(id: 'r1', latitude: 0, longitude: 0);
      when(() => usecase(any())).thenAnswer((_) async => const Right([report]));

      await notifier().load(latitude: 0, longitude: 0);

      final state = container.read(feedProvider).nearbyReports;
      expect(state.value, hasLength(1));
      expect(state.value!.first.report.id, 'r1');
      expect(state.value!.first.distanceInMeters, 0);
    },
  );

  test(
    'load() leaves distance null for a report missing coordinates',
    () async {
      const report = FeedReport(id: 'r1');
      when(() => usecase(any())).thenAnswer((_) async => const Right([report]));

      await notifier().load(latitude: 1, longitude: 1);

      final items = container.read(feedProvider).nearbyReports.value!;
      expect(items.single.distanceInMeters, isNull);
    },
  );

  test('load() failure surfaces an AsyncError carrying the Failure', () async {
    when(() => usecase(any()))
        .thenAnswer((_) async => const Left(Failure.network()));

    await notifier().load(latitude: 0, longitude: 0);

    final state = container.read(feedProvider).nearbyReports;
    expect(state.hasError, isTrue);
    expect(state.error, const Failure.network());
  });

  test('refresh() is a no-op before load() has ever run', () async {
    await notifier().refresh();
    verifyNever(() => usecase(any()));
  });

  test('refresh() replays the last load() origin', () async {
    when(() => usecase(any())).thenAnswer((_) async => const Right([]));

    await notifier().load(latitude: 10, longitude: 20);
    await notifier().refresh();

    final captured = verify(() => usecase(captureAny())).captured;
    expect(captured, hasLength(2));
    for (final params in captured) {
      final p = params as GetFeedReportsParams;
      expect(p.latitude, 10);
      expect(p.longitude, 20);
    }
  });

  test(
    'a superseded load() response is dropped in favour of the newer one',
    () async {
      final firstCompleter = Completer<Either<Failure, List<FeedReport>>>();
      final secondCompleter = Completer<Either<Failure, List<FeedReport>>>();
      var callCount = 0;
      when(() => usecase(any())).thenAnswer((_) {
        callCount++;
        return callCount == 1 ? firstCompleter.future : secondCompleter.future;
      });

      final firstLoad = notifier().load(latitude: 1, longitude: 1);
      final secondLoad = notifier().load(latitude: 2, longitude: 2);

      secondCompleter.complete(const Right([FeedReport(id: 'second')]));
      await secondLoad;
      firstCompleter.complete(const Right([FeedReport(id: 'first')]));
      await firstLoad;

      final items = container.read(feedProvider).nearbyReports.value!;
      expect(items.single.report.id, 'second');
    },
  );
}
