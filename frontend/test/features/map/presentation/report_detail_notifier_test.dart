import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';
import 'package:pantau/features/map/di/di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/pages/report_detail/provider/report_detail_notifier.dart';

class MockGetReportDetailUsecase extends Mock
    implements GetReportDetailUsecase {}

class MockGetReportHistoryUsecase extends Mock
    implements GetReportHistoryUsecase {}

class MockUpdateReportStatusUsecase extends Mock
    implements UpdateReportStatusUsecase {}

class MockGetCachedRoleUsecase extends Mock implements GetCachedRoleUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const GetReportDetailParams(id: 'r1'));
    registerFallbackValue(const GetReportHistoryParams(id: 'r1'));
    registerFallbackValue(const NoParams());
    registerFallbackValue(
      const UpdateReportStatusParams(
        id: 'r1',
        toStatus: ReportStatus.acknowledged,
      ),
    );
  });

  late MockGetReportDetailUsecase detailUsecase;
  late MockGetReportHistoryUsecase historyUsecase;
  late MockUpdateReportStatusUsecase updateStatusUsecase;
  late MockGetCachedRoleUsecase cachedRoleUsecase;
  late ProviderContainer container;

  const detail = ReportDetail(
    id: 'r1',
    status: ReportStatus.reported,
    createdAt: null,
  );

  setUp(() {
    detailUsecase = MockGetReportDetailUsecase();
    historyUsecase = MockGetReportHistoryUsecase();
    updateStatusUsecase = MockUpdateReportStatusUsecase();
    cachedRoleUsecase = MockGetCachedRoleUsecase();
    container = ProviderContainer(
      overrides: [
        getReportDetailUsecaseProvider.overrideWithValue(detailUsecase),
        getReportHistoryUsecaseProvider.overrideWithValue(historyUsecase),
        updateReportStatusUsecaseProvider.overrideWithValue(
          updateStatusUsecase,
        ),
        getCachedRoleUsecaseProvider.overrideWithValue(cachedRoleUsecase),
      ],
    );
    addTearDown(container.dispose);

    when(() => detailUsecase(any()))
        .thenAnswer((_) async => const Right(detail));
    when(() => historyUsecase(any())).thenAnswer((_) async => const Right([]));
    when(() => cachedRoleUsecase(any()))
        .thenAnswer((_) async => const Right(UserRole.user));
  });

  ReportDetailNotifier notifier() =>
      container.read(reportDetailProvider('r1').notifier);

  // reportDetailProvider is autoDispose; without a live listener the
  // notifier can be torn down mid-flight (its build() kicks off async work
  // via Future.microtask), so pin it right before triggering the build in
  // every test — see splash_notifier_test.dart for the same pattern.
  Future<void> build() async {
    container.listen(reportDetailProvider('r1'), (_, _) {});
    await pumpEventQueue();
  }

  test('build() starts every field loading', () {
    container.listen(reportDetailProvider('r1'), (_, _) {});
    final state = container.read(reportDetailProvider('r1'));

    expect(state.detail, isA<AsyncLoading<ReportDetail>>());
    expect(state.history, isA<AsyncLoading<List<StatusHistoryEntry>>>());
    expect(state.timeline, isA<AsyncLoading<List<TimelineStep>>>());
    expect(state.isResolver, isA<AsyncLoading<bool>>());
    expect(state.updateStatus, const AsyncData<ReportDetail?>(null));
  });

  test('a successful load resolves detail, history and isResolver', () async {
    await build();

    final state = container.read(reportDetailProvider('r1'));
    expect(state.detail.value, detail);
    expect(state.history.value, isEmpty);
    expect(state.isResolver.value, isFalse);

    verify(() => detailUsecase(const GetReportDetailParams(id: 'r1')))
        .called(1);
    verify(() => historyUsecase(const GetReportHistoryParams(id: 'r1')))
        .called(1);
  });

  test('isResolver is true when the cached role is resolver', () async {
    when(() => cachedRoleUsecase(any()))
        .thenAnswer((_) async => const Right(UserRole.resolver));

    await build();

    expect(container.read(reportDetailProvider('r1')).isResolver.value, isTrue);
  });

  test('isResolver defaults to false when the role lookup fails', () async {
    when(() => cachedRoleUsecase(any()))
        .thenAnswer((_) async => const Left(Failure.cache('no cached role')));

    await build();

    expect(
      container.read(reportDetailProvider('r1')).isResolver.value,
      isFalse,
    );
  });

  test(
    'a detail failure surfaces an AsyncError carrying the Failure',
    () async {
      when(() => detailUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.notFound()));

      await build();

      final state = container.read(reportDetailProvider('r1'));
      expect(state.detail.hasError, isTrue);
      expect(state.detail.error, const Failure.notFound());
    },
  );

  test(
    'a history failure surfaces an AsyncError on both history and timeline',
    () async {
      when(() => historyUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      await build();

      final state = container.read(reportDetailProvider('r1'));
      expect(state.history.hasError, isTrue);
      expect(state.timeline.hasError, isTrue);
      expect(state.timeline.error, const Failure.network());
    },
  );

  test(
    'an empty history derives a single current step from the detail status',
    () async {
      await build();

      final steps = container.read(reportDetailProvider('r1')).timeline.value!;

      expect(steps, isNotEmpty);
      expect(steps.first.status, ReportStatus.reported);
      expect(steps.first.state, TimelineStepState.current);
      // Ladder continues with the steps not yet reached.
      expect(steps.last.status, ReportStatus.resolved);
      expect(steps.last.state, TimelineStepState.future);
    },
  );

  test('a non-empty history marks its last non-terminal entry current and appends future steps', () async {
    when(() => historyUsecase(any())).thenAnswer(
      (_) async => const Right([
        StatusHistoryEntry(id: 's1', toStatus: ReportStatus.reported),
        StatusHistoryEntry(id: 's2', toStatus: ReportStatus.acknowledged),
      ]),
    );

    await build();

    final steps = container.read(reportDetailProvider('r1')).timeline.value!;

    expect(steps[0].status, ReportStatus.reported);
    expect(steps[0].state, TimelineStepState.done);
    expect(steps[1].status, ReportStatus.acknowledged);
    expect(steps[1].state, TimelineStepState.current);
    expect(steps.last.status, ReportStatus.resolved);
    expect(steps.last.state, TimelineStepState.future);
  });

  test(
    'a terminal status (rejected) leaves no future steps on the ladder',
    () async {
      when(() => historyUsecase(any())).thenAnswer(
        (_) async => const Right([
          StatusHistoryEntry(id: 's1', toStatus: ReportStatus.reported),
          StatusHistoryEntry(id: 's2', toStatus: ReportStatus.rejected),
        ]),
      );

      await build();

      final steps = container.read(reportDetailProvider('r1')).timeline.value!;

      expect(steps.last.status, ReportStatus.rejected);
      expect(steps.last.state, TimelineStepState.done);
      expect(steps.any((s) => s.state == TimelineStepState.future), isFalse);
    },
  );

  test('refresh() replays both the detail and history loads', () async {
    await build();

    await notifier().refresh();

    verify(() => detailUsecase(any())).called(2);
    verify(() => historyUsecase(any())).called(2);
  });

  test('reloadHistory() replays only the history load', () async {
    await build();

    await notifier().reloadHistory();

    verify(() => detailUsecase(any())).called(1);
    verify(() => historyUsecase(any())).called(2);
  });

  group('submitStatus', () {
    test('success stores the updated report in updateStatus', () async {
      const updated = ReportDetail(id: 'r1', status: ReportStatus.acknowledged);
      when(() => updateStatusUsecase(any()))
          .thenAnswer((_) async => const Right(updated));

      await build();

      await notifier().submitStatus(
        toStatus: ReportStatus.acknowledged,
        note: 'note',
      );

      final state = container.read(reportDetailProvider('r1')).updateStatus;
      expect(state, const AsyncData<ReportDetail?>(updated));

      verify(
        () => updateStatusUsecase(
          const UpdateReportStatusParams(
            id: 'r1',
            toStatus: ReportStatus.acknowledged,
            note: 'note',
          ),
        ),
      ).called(1);
    });

    test('failure surfaces an AsyncError carrying the Failure', () async {
      when(() => updateStatusUsecase(any()))
          .thenAnswer((_) async => const Left(Failure.forbidden()));

      await build();

      await notifier().submitStatus(toStatus: ReportStatus.acknowledged);

      final state = container.read(reportDetailProvider('r1')).updateStatus;
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.forbidden());
    });

    test('goes through a loading state before settling', () async {
      const updated = ReportDetail(id: 'r1', status: ReportStatus.acknowledged);
      when(() => updateStatusUsecase(any()))
          .thenAnswer((_) async => const Right(updated));

      await build();

      final future = notifier().submitStatus(
        toStatus: ReportStatus.acknowledged,
      );

      expect(
        container.read(reportDetailProvider('r1')).updateStatus,
        isA<AsyncLoading<ReportDetail?>>(),
      );
      await future;
    });
  });
}
