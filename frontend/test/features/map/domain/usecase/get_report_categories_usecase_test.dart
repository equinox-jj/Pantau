import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  late MockMapRepository repository;
  late GetReportCategoriesUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = GetReportCategoriesUsecase(mapRepository: repository);
  });

  test('delegates to repository.getReportCategories', () async {
    const categories = [ReportCategory(id: 1, name: 'Pothole')];
    when(() => repository.getReportCategories())
        .thenAnswer((_) async => const Right(categories));

    final result = await usecase(const NoParams());

    expect(result, const Right<Failure, List<ReportCategory>>(categories));
    verify(() => repository.getReportCategories()).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.getReportCategories())
        .thenAnswer((_) async => const Left(Failure.server(500, 'boom')));

    final result = await usecase(const NoParams());

    expect(
      result,
      const Left<Failure, List<ReportCategory>>(Failure.server(500, 'boom')),
    );
  });
}
