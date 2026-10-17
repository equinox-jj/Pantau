import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/resolver/di/resolver_di.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';
import 'package:pantau/features/resolver/presentation/pages/map/provider/resolver_map_notifier.dart';

class MockGetQueueUsecase extends Mock implements GetQueueUsecase {}

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
  });

  late MockGetQueueUsecase queueUsecase;
  late ProviderContainer container;

  setUp(() {
    queueUsecase = MockGetQueueUsecase();
    container = ProviderContainer(
      overrides: [getQueueUsecaseProvider.overrideWithValue(queueUsecase)],
    );
    addTearDown(container.dispose);
  });

  ResolverMapNotifier notifier() =>
      container.read(resolverMapProvider.notifier);

  test(
    'initial state is the open tab, loading reports, no selection or pin',
    () {
      final state = container.read(resolverMapProvider);

      expect(state.tab, QueueTab.open);
      expect(state.reports, isA<AsyncLoading<QueueResult>>());
      expect(state.selectedReport, isNull);
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
