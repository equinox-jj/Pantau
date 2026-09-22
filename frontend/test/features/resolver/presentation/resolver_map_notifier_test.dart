import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/di/map_di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/search_places_usecase.dart';
import 'package:pantau/features/resolver/di/resolver_di.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';
import 'package:pantau/features/resolver/presentation/pages/map/provider/resolver_map_notifier.dart';

class MockGetQueueUsecase extends Mock implements GetQueueUsecase {}

class MockSearchPlacesUsecase extends Mock implements SearchPlacesUsecase {}

QueueResult _result({
  List<QueueReport> items = const [],
  QueueCounts counts = const QueueCounts(),
  bool hasNext = false,
}) => QueueResult(items: items, counts: counts, hasNext: hasNext);

void main() {
  setUpAll(() {
    registerFallbackValue(
      const GetQueueParams(tab: QueueTab.open, latitude: 0, longitude: 0),
    );
    registerFallbackValue(const SearchPlacesParams(query: 'x'));
  });

  late MockGetQueueUsecase queueUsecase;
  late MockSearchPlacesUsecase searchUsecase;
  late ProviderContainer container;

  setUp(() {
    queueUsecase = MockGetQueueUsecase();
    searchUsecase = MockSearchPlacesUsecase();
    container = ProviderContainer(
      overrides: [
        getQueueUsecaseProvider.overrideWithValue(queueUsecase),
        searchPlacesUsecaseProvider.overrideWithValue(searchUsecase),
      ],
    );
    addTearDown(container.dispose);
  });

  ResolverMapNotifier notifier() =>
      container.read(resolverMapProvider.notifier);

  test(
    'initial state is the open tab, loading reports, no selection or search',
    () {
      final state = container.read(resolverMapProvider);

      expect(state.tab, QueueTab.open);
      expect(state.reports, isA<AsyncLoading<QueueResult>>());
      expect(state.selectedReport, isNull);
      expect(state.placeSearch, isNull);
      expect(state.searchedPlace, isNull);
    },
  );

  test('selectTab switches the active tab', () {
    notifier().selectTab(QueueTab.resolved);
    expect(container.read(resolverMapProvider).tab, QueueTab.resolved);
  });

  group('load', () {
    test('success stores the fetched QueueResult with the map-specific radius and limit', () async {
      when(() => queueUsecase(any())).thenAnswer(
        (_) async => Right(_result(items: const [QueueReport(id: 'q1')])),
      );

      await notifier().load(
        tab: QueueTab.inProgress,
        latitude: -6.2,
        longitude: 106.8,
      );

      final state = container.read(resolverMapProvider);
      expect(state.reports.value?.items.single.id, 'q1');

      verify(
        () => queueUsecase(
          const GetQueueParams(
            tab: QueueTab.inProgress,
            latitude: -6.2,
            longitude: 106.8,
            radiusMeter: kResolverMapRadiusInMeters,
            limit: kResolverMapLimit,
            offset: 0,
          ),
        ),
      ).called(1);
    });

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => queueUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      final state = container.read(resolverMapProvider).reports;
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.network());
    });

    test(
      'a refetch with reports already on screen keeps them while loading',
      () async {
        when(() => queueUsecase(any())).thenAnswer(
          (_) async => Right(_result(items: const [QueueReport(id: 'q1')])),
        );
        await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

        final completer = Completer<Either<Failure, QueueResult>>();
        when(() => queueUsecase(any())).thenAnswer((_) => completer.future);

        final future = notifier().load(
          tab: QueueTab.resolved,
          latitude: 1,
          longitude: 1,
        );
        expect(
          container.read(resolverMapProvider).reports.value?.items.single.id,
          'q1',
        );

        completer.complete(Right(_result()));
        await future;
      },
    );

    test(
      'a superseded load() response is dropped in favour of the newer one',
      () async {
        final firstCompleter = Completer<Either<Failure, QueueResult>>();
        final secondCompleter = Completer<Either<Failure, QueueResult>>();
        var callCount = 0;
        when(() => queueUsecase(any())).thenAnswer((_) {
          callCount++;
          return callCount == 1
              ? firstCompleter.future
              : secondCompleter.future;
        });

        final firstLoad = notifier().load(
          tab: QueueTab.open,
          latitude: 1,
          longitude: 1,
        );
        final secondLoad = notifier().load(
          tab: QueueTab.open,
          latitude: 2,
          longitude: 2,
        );

        secondCompleter.complete(
          Right(_result(items: const [QueueReport(id: 'second')])),
        );
        await secondLoad;
        firstCompleter.complete(
          Right(_result(items: const [QueueReport(id: 'first')])),
        );
        await firstLoad;

        final items = container.read(resolverMapProvider).reports.value!.items;
        expect(items.single.id, 'second');
      },
    );
  });

  group('selectedReport', () {
    test('selectReport sets the selected report', () {
      const report = QueueReport(id: 'q1');
      notifier().selectReport(report);
      expect(container.read(resolverMapProvider).selectedReport, report);
    });

    test('clearSelectedReport clears the selection', () {
      notifier().selectReport(const QueueReport(id: 'q1'));
      notifier().clearSelectedReport();
      expect(container.read(resolverMapProvider).selectedReport, isNull);
    });
  });

  group('searchPlaces', () {
    const place = Place(
      id: 'p1',
      name: 'Place',
      address: 'Addr',
      latitude: 1,
      longitude: 2,
    );

    test('success stores the returned places', () async {
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Right([place]));

      await notifier().searchPlaces('jakarta');

      final state = container.read(resolverMapProvider).placeSearch;
      expect(state?.value, [place]);
    });

    test('trims the query and forwards the optional viewBox', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));
      const viewBox = PlaceViewBox(
        minLatitude: 1,
        minLongitude: 2,
        maxLatitude: 3,
        maxLongitude: 4,
      );

      await notifier().searchPlaces('  jakarta  ', viewBox: viewBox);

      verify(
        () => searchUsecase(
          const SearchPlacesParams(query: 'jakarta', viewBox: viewBox),
        ),
      ).called(1);
    });

    test('an empty (post-trim) query clears the search instead of calling the usecase', () async {
      notifier().selectPlace(place);
      await notifier().searchPlaces('   ');

      expect(container.read(resolverMapProvider).placeSearch, isNull);
      verifyNever(() => searchUsecase(any()));
    });

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().searchPlaces('jakarta');

      final state = container.read(resolverMapProvider).placeSearch;
      expect(state?.hasError, isTrue);
      expect(state?.error, const Failure.network());
    });

    test(
      'a superseded search response is dropped in favour of the newer one',
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
              id: 'second',
              name: 'S',
              address: 'A',
              latitude: 0,
              longitude: 0,
            ),
          ]),
        );
        await secondSearch;
        firstCompleter.complete(
          const Right([
            Place(
              id: 'first',
              name: 'F',
              address: 'A',
              latitude: 0,
              longitude: 0,
            ),
          ]),
        );
        await firstSearch;

        final places = container.read(resolverMapProvider).placeSearch!.value!;
        expect(places.single.id, 'second');
      },
    );
  });

  group('retrySearch', () {
    test('is a no-op when searchPlaces has never run', () async {
      await notifier().retrySearch();
      verifyNever(() => searchUsecase(any()));
    });

    test('replays the last query and viewBox', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));
      const viewBox = PlaceViewBox(
        minLatitude: 1,
        minLongitude: 2,
        maxLatitude: 3,
        maxLongitude: 4,
      );

      await notifier().searchPlaces('jakarta', viewBox: viewBox);
      await notifier().retrySearch();

      final captured = verify(() => searchUsecase(captureAny())).captured;
      expect(captured, hasLength(2));
      for (final params in captured) {
        final p = params as SearchPlacesParams;
        expect(p.query, 'jakarta');
        expect(p.viewBox, viewBox);
      }
    });
  });

  group('clearSearch', () {
    test('closes the results panel and forgets the replayed query', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));
      await notifier().searchPlaces('jakarta');

      notifier().clearSearch();

      expect(container.read(resolverMapProvider).placeSearch, isNull);
      await notifier().retrySearch();
      // Only the original searchPlaces() call happened — retrySearch() was a
      // no-op because clearSearch() forgot the replayed query.
      verify(() => searchUsecase(any())).called(1);
    });

    test('a search response landing after clearSearch is discarded', () async {
      final completer = Completer<Either<Failure, List<Place>>>();
      when(() => searchUsecase(any())).thenAnswer((_) => completer.future);

      final future = notifier().searchPlaces('jakarta');
      notifier().clearSearch();
      completer.complete(const Right([]));
      await future;

      expect(container.read(resolverMapProvider).placeSearch, isNull);
    });
  });

  group('searchedPlace', () {
    test('selectPlace sets the searched place', () {
      const place = Place(
        id: 'p1',
        name: 'Place',
        address: 'Addr',
        latitude: 1,
        longitude: 2,
      );
      notifier().selectPlace(place);
      expect(container.read(resolverMapProvider).searchedPlace, place);
    });

    test('clearSearchedPlace clears the searched place', () {
      const place = Place(
        id: 'p1',
        name: 'Place',
        address: 'Addr',
        latitude: 1,
        longitude: 2,
      );
      notifier().selectPlace(place);
      notifier().clearSearchedPlace();
      expect(container.read(resolverMapProvider).searchedPlace, isNull);
    });
  });
}
