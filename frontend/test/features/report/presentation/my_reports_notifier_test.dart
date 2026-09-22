import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/di/di.dart';
import 'package:pantau/features/report/domain/entity/entity.dart';
import 'package:pantau/features/report/domain/usecase/usecase.dart';
import 'package:pantau/features/report/presentation/pages/feed/provider/feed_notifier.dart';
import 'package:pantau/features/report/presentation/pages/feed/provider/my_reports_notifier.dart';

class MockGetMyReportsUsecase extends Mock implements GetMyReportsUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const GetMyReportsParams());
  });

  late MockGetMyReportsUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockGetMyReportsUsecase();
    container = ProviderContainer(
      overrides: [getMyReportsUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  test('build() starts loading and then auto-loads via the usecase', () async {
    const report = FeedReport(id: 'm1');
    when(() => usecase(any())).thenAnswer((_) async => const Right([report]));

    final initial = container.read(myReportsProvider);
    expect(initial, isA<AsyncLoading<List<FeedItem>>>());

    await pumpEventQueue();

    final loaded = container.read(myReportsProvider);
    expect(loaded.value, hasLength(1));
    expect(loaded.value!.first.report.id, 'm1');
    // My reports is not anchored to a position: distance is always null.
    expect(loaded.value!.first.distanceInMeters, isNull);
  });

  test('a failed load surfaces an AsyncError carrying the Failure', () async {
    when(() => usecase(any()))
        .thenAnswer((_) async => const Left(Failure.server(500, 'boom')));

    container.read(myReportsProvider);
    await pumpEventQueue();

    final state = container.read(myReportsProvider);
    expect(state.hasError, isTrue);
    expect(state.error, const Failure.server(500, 'boom'));
  });

  test(
    'refresh() calls the usecase again with the same default params',
    () async {
      when(() => usecase(any())).thenAnswer((_) async => const Right([]));

      container.read(myReportsProvider);
      await pumpEventQueue();

      await container.read(myReportsProvider.notifier).refresh();

      verify(() => usecase(const GetMyReportsParams(limit: kMyReportsLimit)))
          .called(2);
    },
  );
}
