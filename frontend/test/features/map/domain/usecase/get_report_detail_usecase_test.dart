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
  late GetReportDetailUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = GetReportDetailUsecase(mapRepository: repository);
  });

  test('GetReportDetailParams equatable props include id', () {
    const params = GetReportDetailParams(id: 'r1');
    expect(params.props, ['r1']);
  });

  test('delegates to repository.getReportDetail with the id', () async {
    const detail = ReportDetail(id: 'r1');
    when(() => repository.getReportDetail('r1'))
        .thenAnswer((_) async => const Right(detail));

    final result = await usecase(const GetReportDetailParams(id: 'r1'));

    expect(result, const Right<Failure, ReportDetail>(detail));
    verify(() => repository.getReportDetail('r1')).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.getReportDetail('missing'))
        .thenAnswer((_) async => const Left(Failure.notFound()));

    final result = await usecase(const GetReportDetailParams(id: 'missing'));

    expect(result, const Left<Failure, ReportDetail>(Failure.notFound()));
  });
}
