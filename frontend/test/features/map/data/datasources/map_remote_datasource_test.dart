import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/features/map/data/datasources/datasources.dart';

class MockDioClient extends Mock implements DioClient {}

RequestOptions _options() => RequestOptions(path: '/x');

Response<T> _response<T>(T? data) =>
    Response<T>(requestOptions: _options(), statusCode: 200, data: data);

void main() {
  late MockDioClient dioClient;
  late MapRemoteDataSourceImpl dataSource;

  setUpAll(() {
    registerFallbackValue(Options());
  });

  setUp(() {
    dioClient = MockDioClient();
    dataSource = MapRemoteDataSourceImpl(dioClient: dioClient);
  });

  group('getNearbyReports', () {
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
            'data': [
              {'id': 'r1', 'status': 'reported'},
            ],
          }),
        );

        final result = await dataSource.getNearbyReports(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 25,
        );

        expect(result.data, hasLength(1));
        expect(result.data!.first.id, 'r1');

        final captured =
            verify(
                  () => dioClient.get<dynamic>(
                    ApiEndpoints.nearbyReports,
                    queryParameters: captureAny(named: 'queryParameters'),
                  ),
                ).captured.single
                as Map<String, dynamic>;
        expect(captured['latitude'], -6.2);
        expect(captured['longitude'], 106.8);
        expect(captured['radius_meter'], 1000);
        expect(captured['limit'], 25);
      },
    );

    test('defaults limit to 10 when not provided', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.nearbyReports,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response({'data': <dynamic>[]}));

      await dataSource.getNearbyReports(
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
      expect(captured['limit'], 10);
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
        dataSource.getNearbyReports(
          latitude: 0,
          longitude: 0,
          radiusInMeters: 500,
        ),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('getReportCategories', () {
    test('hits GET /categories and parses the body', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportCategories))
          .thenAnswer(
            (_) async => _response({
              'data': [
                {'id': 1, 'name': 'Pothole'},
              ],
            }),
          );

      final result = await dataSource.getReportCategories();

      expect(result.data, hasLength(1));
      expect(result.data!.first.name, 'Pothole');
    });

    test('an unexpected thrown error becomes UnknownException', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportCategories))
          .thenThrow(StateError('boom'));

      await expectLater(
        dataSource.getReportCategories(),
        throwsA(isA<UnknownException>()),
      );
    });
  });

  group('getReportDetail', () {
    test('hits GET /reports/{id} and parses the body', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportDetail('r1')))
          .thenAnswer(
            (_) async => _response({
              'data': {'id': 'r1', 'status': 'resolved'},
            }),
          );

      final result = await dataSource.getReportDetail('r1');

      expect(result.data?.id, 'r1');
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportDetail('missing')))
          .thenThrow(
            DioException(
              requestOptions: _options(),
              response: Response(
                requestOptions: _options(),
                statusCode: 404,
                data: {'message': 'Report not found'},
              ),
              type: DioExceptionType.badResponse,
            ),
          );

      await expectLater(
        dataSource.getReportDetail('missing'),
        throwsA(isA<NotFoundException>()),
      );
    });
  });

  group('getReportHistory', () {
    test('parses a bare-array response body', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportHistory('r1')))
          .thenAnswer(
            (_) async => _response([
              {'id': 's1', 'to_status': 'reported'},
            ]),
          );

      final result = await dataSource.getReportHistory('r1');

      expect(result.data, hasLength(1));
      expect(result.data!.first.id, 's1');
    });

    test('parses an enveloped {status,message,data} response body', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportHistory('r1')))
          .thenAnswer(
            (_) async => _response({
              'data': [
                {'id': 's1', 'to_status': 'reported'},
              ],
            }),
          );

      final result = await dataSource.getReportHistory('r1');

      expect(result.data, hasLength(1));
      expect(result.data!.first.id, 's1');
    });

    test('a non-map row in a bare array is dropped', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.reportHistory('r1')))
          .thenAnswer(
            (_) async => _response([
              {'id': 's1', 'to_status': 'reported'},
              'not-a-map',
            ]),
          );

      final result = await dataSource.getReportHistory('r1');

      expect(result.data, hasLength(1));
    });
  });

  group('updateReportStatus', () {
    test('hits PATCH /reports/{id}/status with to_status and note', () async {
      when(
        () => dioClient.patch<dynamic>(
          ApiEndpoints.reportStatus('r1'),
          data: any(named: 'data'),
        ),
      ).thenAnswer(
        (_) async => _response({
          'data': {'id': 'r1', 'status': 'acknowledged'},
        }),
      );

      final result = await dataSource.updateReportStatus(
        id: 'r1',
        toStatus: 'ACKNOWLEDGED',
        note: 'Looking into it',
      );

      expect(result.data?.status, 'acknowledged');

      final captured =
          verify(
                () => dioClient.patch<dynamic>(
                  ApiEndpoints.reportStatus('r1'),
                  data: captureAny(named: 'data'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured['to_status'], 'ACKNOWLEDGED');
      expect(captured['note'], 'Looking into it');
    });

    test('omits the note field when null', () async {
      when(
        () => dioClient.patch<dynamic>(
          ApiEndpoints.reportStatus('r1'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async => _response({'data': null}));

      await dataSource.updateReportStatus(id: 'r1', toStatus: 'CLOSED');

      final captured =
          verify(
                () => dioClient.patch<dynamic>(
                  ApiEndpoints.reportStatus('r1'),
                  data: captureAny(named: 'data'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured.containsKey('note'), isFalse);
    });

    test('omits the note field when empty', () async {
      when(
        () => dioClient.patch<dynamic>(
          ApiEndpoints.reportStatus('r1'),
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async => _response({'data': null}));

      await dataSource.updateReportStatus(
        id: 'r1',
        toStatus: 'CLOSED',
        note: '',
      );

      final captured =
          verify(
                () => dioClient.patch<dynamic>(
                  ApiEndpoints.reportStatus('r1'),
                  data: captureAny(named: 'data'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured.containsKey('note'), isFalse);
    });
  });

  group('createReport', () {
    late File photoFile;
    late File secondPhotoFile;

    setUp(() async {
      final dir = await Directory.systemTemp.createTemp('pantau_test_photo');
      photoFile = File('${dir.path}/photo.jpg');
      await photoFile.writeAsBytes([0, 1, 2, 3]);
      secondPhotoFile = File('${dir.path}/photo2.jpg');
      await secondPhotoFile.writeAsBytes([4, 5, 6, 7]);
    });

    tearDown(() async {
      if (photoFile.existsSync()) {
        await photoFile.parent.delete(recursive: true);
      }
    });

    test(
      'hits POST /reports with a multipart body and parses the result',
      () async {
        when(
          () => dioClient.post<dynamic>(
            ApiEndpoints.reports,
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => _response({
            'data': {'id': 'r1', 'status': 'reported'},
          }),
        );

        final result = await dataSource.createReport(
          categoryId: 3,
          description: 'Big hole',
          photoPaths: [photoFile.path, secondPhotoFile.path],
          latitude: -6.2,
          longitude: 106.8,
        );

        expect(result.data?.id, 'r1');

        final captured =
            verify(
                  () => dioClient.post<dynamic>(
                    ApiEndpoints.reports,
                    data: captureAny(named: 'data'),
                    options: any(named: 'options'),
                  ),
                ).captured.single
                as FormData;
        final fields = {for (final f in captured.fields) f.key: f.value};
        expect(fields['categoryId'], '3');
        expect(fields['description'], 'Big hole');
        expect(fields['latitude'], '-6.2');
        expect(fields['longitude'], '106.8');
        expect(captured.files, hasLength(2));
        expect(captured.files.map((f) => f.key), everyElement('photos'));
      },
    );

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.post<dynamic>(
          ApiEndpoints.reports,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.receiveTimeout,
        ),
      );

      await expectLater(
        dataSource.createReport(
          categoryId: 1,
          description: 'x',
          photoPaths: [photoFile.path],
          latitude: 0,
          longitude: 0,
        ),
        throwsA(isA<TimeoutException>()),
      );
    });
  });

  group('searchPlaces', () {
    test('hits GET on the Nominatim search endpoint with expected params and headers', () async {
      when(
        () => dioClient.get<List<dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => _response<List<dynamic>>([
          {
            'place_id': 1,
            'lat': '-6.2',
            'lon': '106.8',
            'display_name': 'Monas',
          },
        ]),
      );

      final result = await dataSource.searchPlaces(query: 'Monas', limit: 5);

      expect(result, hasLength(1));
      expect(result.first.displayName, 'Monas');

      final captured = verify(
        () => dioClient.get<List<dynamic>>(
          captureAny(),
          options: captureAny(named: 'options'),
          queryParameters: captureAny(named: 'queryParameters'),
        ),
      ).captured;
      final path = captured[0] as String;
      final options = captured[1] as Options;
      final query = captured[2] as Map<String, dynamic>;

      expect(path, contains('nominatim.openstreetmap.org/search'));
      expect(options.headers?['User-Agent'], isNotNull);
      expect(options.extra?[ApiEndpoints.kNoAuth], isTrue);
      expect(query['q'], 'Monas');
      expect(query['limit'], 5);
      expect(query['countrycodes'], 'id');
      expect(query.containsKey('viewbox'), isFalse);
    });

    test('includes a viewbox query param when provided', () async {
      when(
        () => dioClient.get<List<dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response<List<dynamic>>(const []));

      await dataSource.searchPlaces(query: 'Monas', viewBox: '1,2,3,4');

      final query =
          verify(
                () => dioClient.get<List<dynamic>>(
                  any(),
                  options: any(named: 'options'),
                  queryParameters: captureAny(named: 'queryParameters'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(query['viewbox'], '1,2,3,4');
    });

    test('a null response data yields an empty list', () async {
      when(
        () => dioClient.get<List<dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response<List<dynamic>>(null));

      final result = await dataSource.searchPlaces(query: 'x');

      expect(result, isEmpty);
    });

    test('a non-map entry in the response array is dropped', () async {
      when(
        () => dioClient.get<List<dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer(
        (_) async => _response<List<dynamic>>([
          {'lat': '-6.2', 'lon': '106.8'},
          'garbage',
        ]),
      );

      final result = await dataSource.searchPlaces(query: 'x');

      expect(result, hasLength(1));
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.get<List<dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
        ),
      );

      await expectLater(
        dataSource.searchPlaces(query: 'x'),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('reverseGeocode', () {
    test(
      'hits GET on the Nominatim reverse endpoint and parses a hit',
      () async {
        when(
          () => dioClient.get<Map<String, dynamic>>(
            any(),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => _response<Map<String, dynamic>>({
            'lat': '-6.2',
            'lon': '106.8',
            'display_name': 'Monas',
          }),
        );

        final result = await dataSource.reverseGeocode(
          latitude: -6.2,
          longitude: 106.8,
        );

        expect(result, isNotNull);
        expect(result!.displayName, 'Monas');

        final captured = verify(
          () => dioClient.get<Map<String, dynamic>>(
            captureAny(),
            options: any(named: 'options'),
            queryParameters: captureAny(named: 'queryParameters'),
          ),
        ).captured;
        final path = captured[0] as String;
        final query = captured[1] as Map<String, dynamic>;
        expect(path, contains('nominatim.openstreetmap.org/reverse'));
        expect(query['lat'], -6.2);
        expect(query['lon'], 106.8);
      },
    );

    test(
      'returns null when the response has no lat/lon (unaddressable point)',
      () async {
        when(
          () => dioClient.get<Map<String, dynamic>>(
            any(),
            options: any(named: 'options'),
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async =>
              _response<Map<String, dynamic>>({'error': 'Unable to geocode'}),
        );

        final result = await dataSource.reverseGeocode(
          latitude: 0,
          longitude: 0,
        );

        expect(result, isNull);
      },
    );

    test('returns null when the response data itself is null', () async {
      when(
        () => dioClient.get<Map<String, dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response<Map<String, dynamic>>(null));

      final result = await dataSource.reverseGeocode(latitude: 0, longitude: 0);

      expect(result, isNull);
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.get<Map<String, dynamic>>(
          any(),
          options: any(named: 'options'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
        ),
      );

      await expectLater(
        dataSource.reverseGeocode(latitude: 0, longitude: 0),
        throwsA(isA<NetworkException>()),
      );
    });
  });
}
