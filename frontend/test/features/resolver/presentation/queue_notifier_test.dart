import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/di/resolver_di.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';
import 'package:pantau/features/resolver/presentation/pages/queue/provider/queue_notifier.dart';

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

  late MockGetQueueUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockGetQueueUsecase();
    container = ProviderContainer(
      overrides: [getQueueUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  QueueNotifier notifier() => container.read(queueProvider.notifier);

  test('initial state is the open tab, loading with no queue value', () {
    final state = container.read(queueProvider);

    expect(state.tab, QueueTab.open);
    expect(state.queue, isA<AsyncLoading<QueueListState>>());
  });

  group('selectTab', () {
    test('switches the active tab', () {
      notifier().selectTab(QueueTab.resolved);
      expect(container.read(queueProvider).tab, QueueTab.resolved);
    });

    test('is a no-op when the tab is already selected', () {
      final before = container.read(queueProvider);
      notifier().selectTab(QueueTab.open);
      expect(identical(container.read(queueProvider), before), isTrue);
    });
  });

  group('load', () {
    test(
      'success stores items, counts and hasNext under the given tab',
      () async {
        when(() => usecase(any())).thenAnswer(
          (_) async => Right(
            _result(
              items: const [QueueReport(id: 'q1')],
              counts: const QueueCounts(open: 1),
              hasNext: true,
            ),
          ),
        );

        await notifier().load(
          tab: QueueTab.inProgress,
          latitude: -6.2,
          longitude: 106.8,
        );

        final state = container.read(queueProvider);
        expect(state.tab, QueueTab.inProgress);
        expect(state.queue.value?.items.single.id, 'q1');
        expect(state.queue.value?.counts.open, 1);
        expect(state.queue.value?.hasNext, isTrue);

        verify(
          () => usecase(
            const GetQueueParams(
              tab: QueueTab.inProgress,
              latitude: -6.2,
              longitude: 106.8,
              radiusMeter: kQueueRadiusInMeters,
              limit: kQueueLimit,
              offset: 0,
            ),
          ),
        ).called(1);
      },
    );

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => usecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      final state = container.read(queueProvider).queue;
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.network());
    });

    test(
      'a refetch with data already on screen keeps it while loading',
      () async {
        when(() => usecase(any())).thenAnswer(
          (_) async => Right(_result(items: const [QueueReport(id: 'q1')])),
        );
        await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

        final completer = Completer<Either<Failure, QueueResult>>();
        when(() => usecase(any())).thenAnswer((_) => completer.future);

        final future = notifier().load(
          tab: QueueTab.resolved,
          latitude: 1,
          longitude: 1,
        );
        expect(
          container.read(queueProvider).queue.value?.items.single.id,
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
        when(() => usecase(any())).thenAnswer((_) {
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

        final items = container.read(queueProvider).queue.value!.items;
        expect(items.single.id, 'second');
      },
    );
  });

  group('loadMore', () {
    test('is a no-op before load() has ever run', () async {
      await notifier().loadMore();
      verifyNever(() => usecase(any()));
    });

    test('is a no-op when the current page has no next page', () async {
      when(() => usecase(any())).thenAnswer(
        (_) async => Right(
          _result(items: const [QueueReport(id: 'q1')], hasNext: false),
        ),
      );
      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      await notifier().loadMore();

      verify(() => usecase(any())).called(1);
    });

    test(
      'appends the next page to the existing items and advances the offset',
      () async {
        when(() => usecase(any())).thenAnswer(
          (_) async => Right(
            _result(
              items: const [QueueReport(id: 'q1')],
              hasNext: true,
              counts: const QueueCounts(open: 1),
            ),
          ),
        );
        await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

        when(() => usecase(any())).thenAnswer(
          (_) async => Right(
            _result(
              items: const [QueueReport(id: 'q2')],
              hasNext: false,
              counts: const QueueCounts(open: 2),
            ),
          ),
        );
        await notifier().loadMore();

        final state = container.read(queueProvider).queue.value!;
        expect(state.items.map((e) => e.id), ['q1', 'q2']);
        expect(state.hasNext, isFalse);
        expect(state.counts.open, 2);
        expect(state.isLoadingMore, isFalse);

        final captured = verify(() => usecase(captureAny())).captured;
        final secondParams = captured.last as GetQueueParams;
        expect(secondParams.offset, kQueueLimit);
      },
    );

    test('is a no-op when a loadMore is already in flight', () async {
      when(() => usecase(any())).thenAnswer(
        (_) async =>
            Right(_result(items: const [QueueReport(id: 'q1')], hasNext: true)),
      );
      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      final completer = Completer<Either<Failure, QueueResult>>();
      when(() => usecase(any())).thenAnswer((_) => completer.future);

      final firstLoadMore = notifier().loadMore();
      await notifier().loadMore();

      verify(() => usecase(any())).called(2);
      completer.complete(Right(_result()));
      await firstLoadMore;
    });

    test('a failed page keeps existing items, clears the spinner and sets loadMoreFailed', () async {
      when(() => usecase(any())).thenAnswer(
        (_) async =>
            Right(_result(items: const [QueueReport(id: 'q1')], hasNext: true)),
      );
      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      when(() => usecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));
      await notifier().loadMore();

      final state = container.read(queueProvider).queue.value!;
      expect(state.items.single.id, 'q1');
      expect(state.isLoadingMore, isFalse);
      expect(state.loadMoreFailed, isTrue);
    });

    test('a retry after a failed page clears loadMoreFailed', () async {
      when(() => usecase(any())).thenAnswer(
        (_) async =>
            Right(_result(items: const [QueueReport(id: 'q1')], hasNext: true)),
      );
      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      when(() => usecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));
      await notifier().loadMore();
      expect(container.read(queueProvider).queue.value!.loadMoreFailed, isTrue);

      when(() => usecase(any())).thenAnswer(
        (_) async => Right(
          _result(items: const [QueueReport(id: 'q2')], hasNext: false),
        ),
      );
      await notifier().loadMore();

      final state = container.read(queueProvider).queue.value!;
      expect(state.loadMoreFailed, isFalse);
      expect(state.items.map((e) => e.id), ['q1', 'q2']);
    });

    test('is a no-op while a concurrent load() is in flight', () async {
      when(() => usecase(any())).thenAnswer(
        (_) async =>
            Right(_result(items: const [QueueReport(id: 'q1')], hasNext: true)),
      );
      await notifier().load(tab: QueueTab.open, latitude: 0, longitude: 0);

      final loadCompleter = Completer<Either<Failure, QueueResult>>();
      when(() => usecase(any())).thenAnswer((_) => loadCompleter.future);

      final loadFuture = notifier().load(
        tab: QueueTab.resolved,
        latitude: 1,
        longitude: 1,
      );
      await notifier().loadMore();

      // Only the in-flight load() call happened; loadMore() bailed out.
      verify(() => usecase(any())).called(2);

      loadCompleter.complete(Right(_result()));
      await loadFuture;
    });
  });

  group('refresh', () {
    test('is a no-op before load() has ever run', () async {
      await notifier().refresh();
      verifyNever(() => usecase(any()));
    });

    test('replays the last (tab, position) from the first page', () async {
      when(() => usecase(any())).thenAnswer((_) async => Right(_result()));

      await notifier().load(
        tab: QueueTab.resolved,
        latitude: 10,
        longitude: 20,
      );
      await notifier().refresh();

      final captured = verify(() => usecase(captureAny())).captured;
      expect(captured, hasLength(2));
      for (final params in captured) {
        final p = params as GetQueueParams;
        expect(p.tab, QueueTab.resolved);
        expect(p.latitude, 10);
        expect(p.longitude, 20);
        expect(p.offset, 0);
      }
    });
  });
}
