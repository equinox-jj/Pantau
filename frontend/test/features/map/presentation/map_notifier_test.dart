import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:latlong2/latlong.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/service/service.dart';
import 'package:pantau/features/map/di/di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/pages/map/provider/map_notifier.dart';

class MockGetNearbyReportsUsecase extends Mock
    implements GetNearbyReportsUsecase {}

class MockSearchPlacesUsecase extends Mock implements SearchPlacesUsecase {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const GetNearbyReportsParams(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 0,
      ),
    );
    registerFallbackValue(const SearchPlacesParams(query: 'x'));
  });

  late MockGetNearbyReportsUsecase nearbyUsecase;
  late MockSearchPlacesUsecase searchUsecase;
  late MockLocationService locationService;
  late ProviderContainer container;

  setUp(() {
    nearbyUsecase = MockGetNearbyReportsUsecase();
    searchUsecase = MockSearchPlacesUsecase();
    locationService = MockLocationService();
    container = ProviderContainer(
      overrides: [
        getNearbyReportsUsecaseProvider.overrideWithValue(nearbyUsecase),
        searchPlacesUsecaseProvider.overrideWithValue(searchUsecase),
        locationServiceProvider.overrideWithValue(locationService),
      ],
    );
    addTearDown(container.dispose);
  });

  MapNotifier notifier() => container.read(mapProvider.notifier);

  test('initial state has empty defaults', () {
    final state = container.read(mapProvider);
    expect(state.currentLocation, isNull);
    expect(state.loadedArea, isNull);
    expect(state.categoryFilter, isNull);
    expect(state.mapLocation, const AsyncData<LocationResult?>(null));
    expect(state.nearbyReports, const AsyncData<List<NearbyReport>>([]));
    expect(state.visibleReports, isEmpty);
    expect(state.filteredReports, isEmpty);
    expect(state.placeSearch, isNull);
    expect(state.searchedPlace, isNull);
  });

  test('updateCurrentLocation stores the given position', () {
    notifier().updateCurrentLocation(const LatLng(-6.2, 106.8));
    expect(
      container.read(mapProvider).currentLocation,
      const LatLng(-6.2, 106.8),
    );
  });

  test('updateLoadedArea stores the given center', () {
    notifier().updateLoadedArea(const LatLng(1, 2));
    expect(container.read(mapProvider).loadedArea, const LatLng(1, 2));
  });

  group('category filter', () {
    const reportA = NearbyReport(id: 'a', category: ReportCategory(id: 1));
    const reportB = NearbyReport(id: 'b', category: ReportCategory(id: 2));

    Future<void> loadTwoReports() async {
      when(() => nearbyUsecase(any()))
          .thenAnswer((_) async => const Right([reportA, reportB]));
      await notifier().loadNearby(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 1000,
      );
    }

    test('selectCategory narrows filteredReports to that category', () async {
      await loadTwoReports();

      notifier().selectCategory(1);

      final state = container.read(mapProvider);
      expect(state.categoryFilter, 1);
      expect(state.filteredReports, [reportA]);
    });

    test(
      'clearCategory restores filteredReports to every visible report',
      () async {
        await loadTwoReports();
        notifier().selectCategory(1);

        notifier().clearCategory();

        final state = container.read(mapProvider);
        expect(state.categoryFilter, isNull);
        expect(state.filteredReports, [reportA, reportB]);
      },
    );
  });

  group('locate', () {
    test('stores the location result from LocationService', () async {
      const result = LocationSuccess(
        latitude: 1,
        longitude: 2,
        accuracyInMeters: 5,
      );
      when(() => locationService.getCurrentLocation())
          .thenAnswer((_) async => result);

      await notifier().locate();

      expect(
        container.read(mapProvider).mapLocation,
        const AsyncData<LocationResult?>(result),
      );
    });

    test('goes through a loading state before settling', () async {
      const result = LocationSuccess(
        latitude: 1,
        longitude: 2,
        accuracyInMeters: 5,
      );
      when(() => locationService.getCurrentLocation())
          .thenAnswer((_) async => result);

      final future = notifier().locate();

      expect(
        container.read(mapProvider).mapLocation,
        isA<AsyncLoading<LocationResult?>>(),
      );
      await future;
    });
  });

  test('openSettings() delegates to LocationService.openSettings', () async {
    when(() => locationService.openSettings()).thenAnswer((_) async {});

    await notifier().openSettings();

    verify(() => locationService.openSettings()).called(1);
  });

  group('loadNearby', () {
    test(
      'success stores nearbyReports, visibleReports and filteredReports',
      () async {
        const report = NearbyReport(id: 'r1');
        when(() => nearbyUsecase(any()))
            .thenAnswer((_) async => const Right([report]));

        await notifier().loadNearby(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
        );

        final state = container.read(mapProvider);
        expect(state.nearbyReports.value, [report]);
        expect(state.visibleReports, [report]);
        expect(state.filteredReports, [report]);
      },
    );

    test('failure surfaces an AsyncError carrying the Failure and keeps visibleReports', () async {
      when(() => nearbyUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().loadNearby(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 500,
      );

      final state = container.read(mapProvider);
      expect(state.nearbyReports.hasError, isTrue);
      expect(state.nearbyReports.error, const Failure.network());
      expect(state.visibleReports, isEmpty);
    });

    test(
      'a superseded response is dropped in favour of the newer one',
      () async {
        final firstCompleter = Completer<Either<Failure, List<NearbyReport>>>();
        final secondCompleter =
            Completer<Either<Failure, List<NearbyReport>>>();
        var callCount = 0;
        when(() => nearbyUsecase(any())).thenAnswer((_) {
          callCount++;
          return callCount == 1
              ? firstCompleter.future
              : secondCompleter.future;
        });

        final firstLoad = notifier().loadNearby(
          latitude: 1,
          longitude: 1,
          radiusInMeters: 500,
        );
        final secondLoad = notifier().loadNearby(
          latitude: 2,
          longitude: 2,
          radiusInMeters: 500,
        );

        secondCompleter.complete(const Right([NearbyReport(id: 'second')]));
        await secondLoad;
        firstCompleter.complete(const Right([NearbyReport(id: 'first')]));
        await firstLoad;

        final state = container.read(mapProvider).nearbyReports;
        expect(state.value!.single.id, 'second');
      },
    );
  });

  group('refreshNearby', () {
    test('is a no-op before loadNearby() has ever run', () async {
      await notifier().refreshNearby();
      verifyNever(() => nearbyUsecase(any()));
    });

    test('replays the last loadNearby() camera', () async {
      when(() => nearbyUsecase(any())).thenAnswer((_) async => const Right([]));

      await notifier().loadNearby(
        latitude: 10,
        longitude: 20,
        radiusInMeters: 1000,
      );
      await notifier().refreshNearby();

      final captured = verify(() => nearbyUsecase(captureAny())).captured;
      expect(captured, hasLength(2));
      for (final params in captured) {
        final p = params as GetNearbyReportsParams;
        expect(p.latitude, 10);
        expect(p.longitude, 20);
        expect(p.radiusInMeters, 1000);
      }
    });
  });

  group('searchPlaces', () {
    test('an empty (post-trim) query clears the search instead of calling the usecase', () async {
      await notifier().searchPlaces('   ');

      expect(container.read(mapProvider).placeSearch, isNull);
      verifyNever(() => searchUsecase(any()));
    });

    test('success stores the results', () async {
      const place = Place(
        id: '1',
        name: 'Monas',
        address: '',
        latitude: -6.2,
        longitude: 106.8,
      );
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Right([place]));

      await notifier().searchPlaces('Monas');

      final state = container.read(mapProvider).placeSearch;
      expect(state?.value, [place]);
    });

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().searchPlaces('Monas');

      final state = container.read(mapProvider).placeSearch;
      expect(state?.hasError, isTrue);
      expect(state?.error, const Failure.network());
    });

    test(
      'a superseded response is dropped in favour of the newer one',
      () async {
        final firstCompleter = Completer<Either<Failure, List<Place>>>();
        final secondCompleter = Completer<Either<Failure, List<Place>>>();
        var callCount = 0;
        when(() => searchUsecase(any())).thenAnswer((_) {
          callCount++;
          return callCount == 1
              ? firstCompleter.future
              : secondCompleter.future;
        });

        final firstSearch = notifier().searchPlaces('first');
        final secondSearch = notifier().searchPlaces('second');

        secondCompleter.complete(
          const Right([
            Place(
              id: '2',
              name: 'second',
              address: '',
              latitude: 0,
              longitude: 0,
            ),
          ]),
        );
        await secondSearch;
        firstCompleter.complete(
          const Right([
            Place(
              id: '1',
              name: 'first',
              address: '',
              latitude: 0,
              longitude: 0,
            ),
          ]),
        );
        await firstSearch;

        final state = container.read(mapProvider).placeSearch;
        expect(state?.value!.single.name, 'second');
      },
    );
  });

  group('retrySearch', () {
    test('is a no-op before searchPlaces() has ever run', () async {
      await notifier().retrySearch();
      verifyNever(() => searchUsecase(any()));
    });

    test('replays the last query', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));

      await notifier().searchPlaces('Monas');
      await notifier().retrySearch();

      final captured = verify(() => searchUsecase(captureAny())).captured;
      expect(captured, hasLength(2));
      for (final params in captured) {
        expect((params as SearchPlacesParams).query, 'Monas');
      }
    });
  });

  test('clearSearch resets placeSearch to null', () async {
    when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));
    await notifier().searchPlaces('Monas');

    notifier().clearSearch();

    expect(container.read(mapProvider).placeSearch, isNull);
  });

  test(
    'clearSearch orphans an in-flight search so its late response is ignored',
    () async {
      final completer = Completer<Either<Failure, List<Place>>>();
      when(() => searchUsecase(any())).thenAnswer((_) => completer.future);

      final search = notifier().searchPlaces('Monas');
      notifier().clearSearch();
      completer.complete(const Right([]));
      await search;

      expect(container.read(mapProvider).placeSearch, isNull);
    },
  );

  test('selectPlace stores the searched place', () {
    const place = Place(
      id: '1',
      name: 'Monas',
      address: '',
      latitude: -6.2,
      longitude: 106.8,
    );
    notifier().selectPlace(place);
    expect(container.read(mapProvider).searchedPlace, place);
  });

  test('clearSearchedPlace resets searchedPlace to null', () {
    const place = Place(
      id: '1',
      name: 'Monas',
      address: '',
      latitude: -6.2,
      longitude: 106.8,
    );
    notifier().selectPlace(place);

    notifier().clearSearchedPlace();

    expect(container.read(mapProvider).searchedPlace, isNull);
  });
}
