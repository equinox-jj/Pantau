import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/data/datasources/datasources.dart';
import 'package:pantau/features/map/data/model/model.dart';
import 'package:pantau/features/map/data/repository/repository.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';

class MockMapRemoteDataSource extends Mock implements MapRemoteDataSource {}

void main() {
  setUpAll(() {
    registerFallbackValue(ReportStatus.reported);
  });

  late MockMapRemoteDataSource dataSource;
  late MapRepositoryImpl repository;

  setUp(() {
    dataSource = MockMapRemoteDataSource();
    repository = MapRepositoryImpl(mapRemoteDataSource: dataSource);
  });

  group('getNearbyReports', () {
    test('returns Right of mapped entities on success', () async {
      when(
        () => dataSource.getNearbyReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer(
        (_) async => const NearbyReportsModel(
          data: [NearbyReportsDataModel(id: 'r1', status: 'reported')],
        ),
      );

      final result = await repository.getNearbyReports(
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
        () => dataSource.getNearbyReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenThrow(const NetworkException());

      final result = await repository.getNearbyReports(
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

  group('getReportCategories', () {
    test('returns Right of mapped entities on success', () async {
      when(() => dataSource.getReportCategories()).thenAnswer(
        (_) async => const ReportCategoriesModel(
          data: [ReportCategoriesDataModel(id: 1, name: 'Pothole')],
        ),
      );

      final result = await repository.getReportCategories();

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.single.id, 1),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(() => dataSource.getReportCategories())
          .thenThrow(const ServerException(500, 'boom'));

      final result = await repository.getReportCategories();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.server(500, 'boom'))),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('getReportDetail', () {
    test('returns Right of mapped entity on success', () async {
      when(() => dataSource.getReportDetail('r1')).thenAnswer(
        (_) async => const ReportDetailModel(
          data: ReportDetailDataModel(id: 'r1', status: 'resolved'),
        ),
      );

      final result = await repository.getReportDetail('r1');

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.id, 'r1'),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(() => dataSource.getReportDetail('missing'))
          .thenThrow(const NotFoundException());

      final result = await repository.getReportDetail('missing');

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<NotFoundFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('getReportHistory', () {
    test('returns Right of mapped entities on success', () async {
      when(() => dataSource.getReportHistory('r1')).thenAnswer(
        (_) async => const StatusHistoryModel(
          data: [StatusHistoryEntryModel(id: 's1', toStatus: 'reported')],
        ),
      );

      final result = await repository.getReportHistory('r1');

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.single.id, 's1'),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(() => dataSource.getReportHistory('r1'))
          .thenThrow(const UnknownException('boom'));

      final result = await repository.getReportHistory('r1');

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.unknown('boom'))),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('createReport', () {
    test('returns Right of the mapped entity on success', () async {
      when(
        () => dataSource.createReport(
          categoryId: any(named: 'categoryId'),
          description: any(named: 'description'),
          photoPaths: any(named: 'photoPaths'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer(
        (_) async => const CreateReportModel(
          data: CreateReportDataModel(id: 'r1', status: 'reported'),
        ),
      );

      final result = await repository.createReport(
        categoryId: 1,
        description: 'Big hole',
        photoPaths: const ['/tmp/x.jpg'],
        latitude: 0,
        longitude: 0,
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.id, 'r1'),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.createReport(
          categoryId: any(named: 'categoryId'),
          description: any(named: 'description'),
          photoPaths: any(named: 'photoPaths'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenThrow(const BadRequestException('Invalid photo'));

      final result = await repository.createReport(
        categoryId: 1,
        description: 'Big hole',
        photoPaths: const ['/tmp/x.jpg'],
        latitude: 0,
        longitude: 0,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.badRequest('Invalid photo'))),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('updateReportStatus', () {
    test(
      'sends the status wire value and returns Right of the mapped entity',
      () async {
        when(
          () => dataSource.updateReportStatus(
            id: any(named: 'id'),
            toStatus: any(named: 'toStatus'),
            note: any(named: 'note'),
          ),
        ).thenAnswer(
          (_) async => const ReportDetailModel(
            data: ReportDetailDataModel(id: 'r1', status: 'acknowledged'),
          ),
        );

        final result = await repository.updateReportStatus(
          id: 'r1',
          toStatus: ReportStatus.acknowledged,
          note: 'Looking into it',
        );

        expect(result.isRight(), isTrue);
        verify(
          () => dataSource.updateReportStatus(
            id: 'r1',
            toStatus: 'ACKNOWLEDGED',
            note: 'Looking into it',
          ),
        ).called(1);
      },
    );

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.updateReportStatus(
          id: any(named: 'id'),
          toStatus: any(named: 'toStatus'),
          note: any(named: 'note'),
        ),
      ).thenThrow(const ForbiddenException());

      final result = await repository.updateReportStatus(
        id: 'r1',
        toStatus: ReportStatus.acknowledged,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<ForbiddenFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('searchPlaces', () {
    test('returns Right of mapped entities on success', () async {
      when(
        () => dataSource.searchPlaces(
          query: any(named: 'query'),
          viewBox: any(named: 'viewBox'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer(
        (_) async => const [
          PlaceModel(lat: '-6.2', lon: '106.8', name: 'Monas'),
        ],
      );

      final result = await repository.searchPlaces(query: 'Monas');

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.single.name, 'Monas'),
      );
    });

    test(
      'formats the viewBox as minLon,minLat,maxLon,maxLat before delegating',
      () async {
        when(
          () => dataSource.searchPlaces(
            query: any(named: 'query'),
            viewBox: any(named: 'viewBox'),
            limit: any(named: 'limit'),
          ),
        ).thenAnswer((_) async => const []);

        const viewBox = PlaceViewBox(
          minLatitude: 1,
          minLongitude: 2,
          maxLatitude: 3,
          maxLongitude: 4,
        );

        await repository.searchPlaces(query: 'Monas', viewBox: viewBox);

        verify(
          () => dataSource.searchPlaces(
            query: 'Monas',
            viewBox: '2.0,1.0,4.0,3.0',
            limit: 6,
          ),
        ).called(1);
      },
    );

    test('passes a null viewBox through as null', () async {
      when(
        () => dataSource.searchPlaces(
          query: any(named: 'query'),
          viewBox: any(named: 'viewBox'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const []);

      await repository.searchPlaces(query: 'Monas');

      verify(
        () => dataSource.searchPlaces(query: 'Monas', viewBox: null, limit: 6),
      ).called(1);
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.searchPlaces(
          query: any(named: 'query'),
          viewBox: any(named: 'viewBox'),
          limit: any(named: 'limit'),
        ),
      ).thenThrow(const NetworkException());

      final result = await repository.searchPlaces(query: 'Monas');

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<NetworkFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('reverseGeocode', () {
    test('returns Right of the mapped place on success', () async {
      when(
        () => dataSource.reverseGeocode(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer(
        (_) async => const PlaceModel(lat: '-6.2', lon: '106.8', name: 'Monas'),
      );

      final result = await repository.reverseGeocode(
        latitude: -6.2,
        longitude: 106.8,
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r?.name, 'Monas'),
      );
    });

    test('returns Right(null) when the data source finds no address', () async {
      when(
        () => dataSource.reverseGeocode(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async => null);

      final result = await repository.reverseGeocode(latitude: 0, longitude: 0);

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r, isNull),
      );
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.reverseGeocode(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenThrow(const TimeoutException());

      final result = await repository.reverseGeocode(latitude: 0, longitude: 0);

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<TimeoutFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });
}
