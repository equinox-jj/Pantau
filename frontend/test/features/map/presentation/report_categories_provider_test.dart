import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/di/di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/provider/report_categories_provider.dart';

class MockGetReportCategoriesUsecase extends Mock
    implements GetReportCategoriesUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const NoParams());
  });

  late MockGetReportCategoriesUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockGetReportCategoriesUsecase();
    container = ProviderContainer(
      overrides: [
        getReportCategoriesUsecaseProvider.overrideWithValue(usecase),
      ],
    );
    addTearDown(container.dispose);
  });

  // reportCategoriesProvider is autoDispose; without a live listener the
  // provider can be torn down mid-flight, so pin it right before triggering
  // the build in every test — see splash_notifier_test.dart for the same
  // pattern.
  Future<void> build() async {
    container.listen(reportCategoriesProvider, (_, _) {});
    container.read(reportCategoriesProvider);
    await pumpEventQueue();
  }

  test('resolves to the categories returned by the usecase', () async {
    const categories = [ReportCategory(id: 1, name: 'Pothole')];
    when(() => usecase(any())).thenAnswer((_) async => const Right(categories));

    await build();

    expect(container.read(reportCategoriesProvider).value, categories);
  });

  test(
    'a Left(Failure) surfaces as an AsyncError carrying the Failure',
    () async {
      when(() => usecase(any()))
          .thenAnswer((_) async => const Left(Failure.server(500, 'boom')));

      await build();

      final state = container.read(reportCategoriesProvider);
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.server(500, 'boom'));
    },
  );
}
