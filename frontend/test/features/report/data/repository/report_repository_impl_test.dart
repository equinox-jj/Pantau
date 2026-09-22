import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/data/datasources/datasources.dart';
import 'package:pantau/features/report/data/model/model.dart';
import 'package:pantau/features/report/data/repository/repository.dart';

class MockReportRemoteDataSource extends Mock
    implements ReportRemoteDataSource {}

void main() {
  late MockReportRemoteDataSource dataSource;
  late ReportRepositoryImpl repository;

  setUp(() {
    dataSource = MockReportRemoteDataSource();
    repository = ReportRepositoryImpl(reportRemoteDataSource: dataSource);
  });

  group('getFeedReports', () {
    test('returns Right of mapped entities on success', () async {
      when(
        () => dataSource.getFeedReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer(
        (_) async => const FeedReportsModel(
          data: [FeedReportsDataModel(id: 'r1', status: 'reported')],
        ),
      );

      final result = await repository.getFeedReports(
        latitude: -6.2,
        longitude: 106.8,
        radiusInMeters: 1000,
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.single.id, 'r1'),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.getFeedReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenThrow(const NetworkException());

      final result = await repository.getFeedReports(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 500,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<NetworkFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('getMyReports', () {
    test('returns Right of mapped entities on success', () async {
      when(
        () => dataSource.getMyReports(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer(
        (_) async => const MyReportsModel(
          data: MyReportsDataModel(
            items: [FeedReportsDataModel(id: 'm1', status: 'closed')],
          ),
        ),
      );

      final result = await repository.getMyReports();

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.single.id, 'm1'),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.getMyReports(
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(const ServerException(500, 'boom'));

      final result = await repository.getMyReports();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.server(500, 'boom'))),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });
}
