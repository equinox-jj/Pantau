import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/features/report/data/datasources/datasources.dart';

class MockDioClient extends Mock implements DioClient {}

RequestOptions _options() => RequestOptions(path: '/x');

Response<dynamic> _response(Object? data) =>
    Response(requestOptions: _options(), statusCode: 200, data: data);

void main() {
  late MockDioClient dioClient;
  late ReportRemoteDataSourceImpl dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = ReportRemoteDataSourceImpl(dioClient: dioClient);
  });

  group('getFeedReports', () {
    test(
      'hits GET /reports/nearby with the given params and parses the body',
      () async {
        when(
          () => dioClient.get<dynamic>(
            ApiEndpoints.nearbyReports,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => _response({
            'status': true,
            'data': [
              {'id': 'r1', 'status': 'reported'},
            ],
          }),
        );

        final result = await dataSource.getFeedReports(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 10,
        );

        expect(result.data, hasLength(1));
        expect(result.data!.first.id, 'r1');

        final captured = verify(
          () => dioClient.get<dynamic>(
            ApiEndpoints.nearbyReports,
            queryParameters: captureAny(named: 'queryParameters'),
          ),
        ).captured;
        final query = captured.single as Map<String, dynamic>;
        expect(query['latitude'], -6.2);
        expect(query['longitude'], 106.8);
        expect(query['radius_meter'], 1000);
        expect(query['limit'], 10);
      },
    );

    test('defaults limit to 50 when not provided', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.nearbyReports,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response({'data': <dynamic>[]}));

      await dataSource.getFeedReports(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 500,
      );

      final captured =
          verify(
                () => dioClient.get<dynamic>(
                  ApiEndpoints.nearbyReports,
                  queryParameters: captureAny(named: 'queryParameters'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured['limit'], 50);
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.nearbyReports,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
        ),
      );

      await expectLater(
        dataSource.getFeedReports(
          latitude: 0,
          longitude: 0,
          radiusInMeters: 500,
        ),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('getMyReports', () {
    test(
      'hits GET /reports/mine with limit/offset and parses the paged body',
      () async {
        when(
          () => dioClient.get<dynamic>(
            ApiEndpoints.myReports,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => _response({
            'data': {
              'items': [
                {'id': 'm1', 'status': 'closed'},
              ],
              'meta': {'limit': 50, 'offset': 0, 'total': 1, 'has_next': false},
            },
          }),
        );

        final result = await dataSource.getMyReports(limit: 20, offset: 5);

        expect(result.data?.items, hasLength(1));
        expect(result.data?.meta?.total, 1);

        final captured =
            verify(
                  () => dioClient.get<dynamic>(
                    ApiEndpoints.myReports,
                    queryParameters: captureAny(named: 'queryParameters'),
                  ),
                ).captured.single
                as Map<String, dynamic>;
        expect(captured['limit'], 20);
        expect(captured['offset'], 5);
      },
    );

    test('an unexpected thrown error becomes UnknownException', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.myReports,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(StateError('boom'));

      await expectLater(
        dataSource.getMyReports(),
        throwsA(isA<UnknownException>()),
      );
    });
  });
}
