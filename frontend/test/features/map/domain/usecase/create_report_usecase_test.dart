import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  late MockMapRepository repository;
  late CreateReportUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = CreateReportUsecase(mapRepository: repository);
  });

  test('CreateReportParams equatable props include every field', () {
    const params = CreateReportParams(
      categoryId: 1,
      description: 'Big hole',
      photoPaths: ['/tmp/x.jpg'],
      latitude: 2,
      longitude: 3,
    );
    expect(params.props, [
      1,
      'Big hole',
      ['/tmp/x.jpg'],
      2.0,
      3.0,
    ]);
  });

  test('delegates to repository.createReport with the params fields', () async {
    const detail = ReportDetail(id: 'r1');
    when(
      () => repository.createReport(
        categoryId: any(named: 'categoryId'),
        description: any(named: 'description'),
        photoPaths: any(named: 'photoPaths'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => const Right(detail));

    final result = await usecase(
      const CreateReportParams(
        categoryId: 5,
        description: 'Big hole',
        photoPaths: ['/tmp/x.jpg'],
        latitude: -6.2,
        longitude: 106.8,
      ),
    );

    expect(result, const Right<Failure, ReportDetail>(detail));
    verify(
      () => repository.createReport(
        categoryId: 5,
        description: 'Big hole',
        photoPaths: ['/tmp/x.jpg'],
        latitude: -6.2,
        longitude: 106.8,
      ),
    ).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.createReport(
        categoryId: any(named: 'categoryId'),
        description: any(named: 'description'),
        photoPaths: any(named: 'photoPaths'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(
      const CreateReportParams(
        categoryId: 1,
        description: 'x',
        photoPaths: ['/tmp/x.jpg'],
        latitude: 0,
        longitude: 0,
      ),
    );

    expect(result, const Left<Failure, ReportDetail>(Failure.network()));
  });
}
