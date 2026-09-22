import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/di/di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/pages/create_report/provider/create_report_notifier.dart';

class MockCreateReportUsecase extends Mock implements CreateReportUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const CreateReportParams(
        categoryId: 0,
        description: '',
        photoPaths: [],
        latitude: 0,
        longitude: 0,
      ),
    );
  });

  late MockCreateReportUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockCreateReportUsecase();
    container = ProviderContainer(
      overrides: [createReportUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  CreateReport notifier() => container.read(createReportProvider.notifier);

  test('initial state is AsyncData(null)', () {
    final state = container.read(createReportProvider);
    expect(state, const AsyncData<ReportDetail?>(null));
  });

  test('submit() success surfaces AsyncData with the created report', () async {
    const detail = ReportDetail(id: 'r1');
    when(() => usecase(any())).thenAnswer((_) async => const Right(detail));

    await notifier().submit(
      photoPaths: const ['/tmp/x.jpg'],
      categoryId: 1,
      description: 'Big hole',
      latitude: -6.2,
      longitude: 106.8,
    );

    final state = container.read(createReportProvider);
    expect(state, const AsyncData<ReportDetail?>(detail));
  });

  test('submit() passes every field through as CreateReportParams', () async {
    when(() => usecase(any()))
        .thenAnswer((_) async => const Right(ReportDetail(id: 'r1')));

    await notifier().submit(
      photoPaths: const ['/tmp/x.jpg', '/tmp/y.jpg'],
      categoryId: 3,
      description: 'Big hole',
      latitude: -6.2,
      longitude: 106.8,
    );

    final captured =
        verify(() => usecase(captureAny())).captured.single
            as CreateReportParams;
    expect(captured.categoryId, 3);
    expect(captured.description, 'Big hole');
    expect(captured.photoPaths, ['/tmp/x.jpg', '/tmp/y.jpg']);
    expect(captured.latitude, -6.2);
    expect(captured.longitude, 106.8);
  });

  test(
    'submit() failure surfaces an AsyncError carrying the Failure',
    () async {
      when(() => usecase(any())).thenAnswer(
        (_) async => const Left(Failure.badRequest('Invalid photo')),
      );

      await notifier().submit(
        photoPaths: const ['/tmp/x.jpg'],
        categoryId: 1,
        description: 'Big hole',
        latitude: 0,
        longitude: 0,
      );

      final state = container.read(createReportProvider);
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.badRequest('Invalid photo'));
    },
  );

  test('submit() goes through a loading state before settling', () async {
    when(() => usecase(any()))
        .thenAnswer((_) async => const Right(ReportDetail(id: 'r1')));

    final future = notifier().submit(
      photoPaths: const ['/tmp/x.jpg'],
      categoryId: 1,
      description: 'x',
      latitude: 0,
      longitude: 0,
    );

    expect(
      container.read(createReportProvider),
      isA<AsyncLoading<ReportDetail?>>(),
    );
    await future;
  });
}
