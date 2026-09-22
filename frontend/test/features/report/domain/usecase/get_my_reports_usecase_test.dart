import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/domain/entity/entity.dart';
import 'package:pantau/features/report/domain/repository/repository.dart';
import 'package:pantau/features/report/domain/usecase/usecase.dart';

class MockReportRepository extends Mock implements ReportRepository {}

void main() {
  late MockReportRepository repository;
  late GetMyReportsUsecase usecase;

  setUp(() {
    repository = MockReportRepository();
    usecase = GetMyReportsUsecase(reportRepository: repository);
  });

  test('GetMyReportsParams defaults limit to 50 and offset to 0', () {
    const params = GetMyReportsParams();
    expect(params.limit, 50);
    expect(params.offset, 0);
    expect(params.props, [50, 0]);
  });

  test('delegates to repository.getMyReports with the params fields', () async {
    const reports = [FeedReport(id: 'm1')];
    when(
      () => repository.getMyReports(
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => const Right(reports));

    final result = await usecase(
      const GetMyReportsParams(limit: 10, offset: 20),
    );

    expect(result, const Right<Failure, List<FeedReport>>(reports));
    verify(() => repository.getMyReports(limit: 10, offset: 20)).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.getMyReports(
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => const Left(Failure.server(500, 'boom')));

    final result = await usecase(const GetMyReportsParams());

    expect(
      result,
      const Left<Failure, List<FeedReport>>(Failure.server(500, 'boom')),
    );
  });
}
