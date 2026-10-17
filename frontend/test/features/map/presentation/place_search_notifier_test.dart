import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/di/map_di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/pages/place_search/provider/place_search_notifier.dart';

class MockSearchPlacesUsecase extends Mock implements SearchPlacesUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const SearchPlacesParams(query: 'x'));
  });

  const place = Place(
    id: '1',
    name: 'Monas',
    address: '',
    latitude: -6.2,
    longitude: 106.8,
  );

  const viewBox = PlaceViewBox(
    minLatitude: 1,
    minLongitude: 2,
    maxLatitude: 3,
    maxLongitude: 4,
  );

  late MockSearchPlacesUsecase searchUsecase;
  late ProviderContainer container;

  setUp(() {
    searchUsecase = MockSearchPlacesUsecase();
    container = ProviderContainer(
      overrides: [searchPlacesUsecaseProvider.overrideWithValue(searchUsecase)],
    );
    addTearDown(container.dispose);
    // Auto-disposed: the page keeps it alive by watching it, so the test does
    // the same.
    container.listen(placeSearchProvider, (_, _) {});
  });

  PlaceSearchNotifier notifier() =>
      container.read(placeSearchProvider.notifier);

  test('starts idle, before any search', () {
    expect(container.read(placeSearchProvider), isNull);
  });

  group('search', () {
    test(
      'an empty (post-trim) query stays idle instead of calling the usecase',
      () async {
        await notifier().search('   ');

        expect(container.read(placeSearchProvider), isNull);
        verifyNever(() => searchUsecase(any()));
      },
    );

    test('success stores the results', () async {
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Right([place]));

      await notifier().search('Monas');

      expect(container.read(placeSearchProvider)?.value, [place]);
    });

    test('trims the query and forwards the optional viewBox', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));

      await notifier().search('  Monas  ', viewBox: viewBox);

      verify(
        () => searchUsecase(
          const SearchPlacesParams(query: 'Monas', viewBox: viewBox),
        ),
      ).called(1);
    });

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => searchUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().search('Monas');

      final state = container.read(placeSearchProvider);
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

        final firstSearch = notifier().search('first');
        final secondSearch = notifier().search('second');

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

        final state = container.read(placeSearchProvider);
        expect(state?.value!.single.name, 'second');
      },
    );
  });

  group('retry', () {
    test('is a no-op before search() has ever run', () async {
      await notifier().retry();
      verifyNever(() => searchUsecase(any()));
    });

    test('replays the last query and viewBox', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));

      await notifier().search('Monas', viewBox: viewBox);
      await notifier().retry();

      final captured = verify(() => searchUsecase(captureAny())).captured;
      expect(captured, hasLength(2));
      for (final params in captured) {
        final p = params as SearchPlacesParams;
        expect(p.query, 'Monas');
        expect(p.viewBox, viewBox);
      }
    });
  });

  group('clear', () {
    test('goes back to idle and forgets the replayed query', () async {
      when(() => searchUsecase(any())).thenAnswer((_) async => const Right([]));
      await notifier().search('Monas');

      notifier().clear();

      expect(container.read(placeSearchProvider), isNull);
      await notifier().retry();
      // Only the original search() call happened — retry() was a no-op
      // because clear() forgot the replayed query.
      verify(() => searchUsecase(any())).called(1);
    });

    test(
      'orphans an in-flight search so its late response is ignored',
      () async {
        final completer = Completer<Either<Failure, List<Place>>>();
        when(() => searchUsecase(any())).thenAnswer((_) => completer.future);

        final search = notifier().search('Monas');
        notifier().clear();
        completer.complete(const Right([]));
        await search;

        expect(container.read(placeSearchProvider), isNull);
      },
    );
  });
}
