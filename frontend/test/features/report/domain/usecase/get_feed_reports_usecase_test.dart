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
  late GetFeedReportsUsecase usecase;

  setUp(() {
    repository = MockReportRepository();
    usecase = GetFeedReportsUsecase(reportRepository: repository);
  });

  test('GetFeedReportsParams equatable props include every field', () {
    const params = GetFeedReportsParams(
      latitude: 1,
      longitude: 2,
      radiusInMeters: 3,
      limit: 4,
    );
    expect(params.props, [1.0, 2.0, 3, 4]);
  });

  test(
    'delegates to repository.getFeedReports with the params fields',
    () async {
      const reports = [FeedReport(id: 'r1')];
      when(
        () => repository.getFeedReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const Right(reports));

      final result = await usecase(
        const GetFeedReportsParams(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 25,
        ),
      );

      expect(result, const Right<Failure, List<FeedReport>>(reports));
      verify(
        () => repository.getFeedReports(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 25,
        ),
      ).called(1);
    },
  );

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.getFeedReports(
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
        radiusInMeters: any(named: 'radiusInMeters'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(
      const GetFeedReportsParams(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 500,
      ),
    );

    expect(result, const Left<Failure, List<FeedReport>>(Failure.network()));
  });
}
