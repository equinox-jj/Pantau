import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/data/datasources/resolver_remote_datasource.dart';

class MockDioClient extends Mock implements DioClient {}

RequestOptions _options() => RequestOptions(path: '/x');

Response<dynamic> _response(Object? data) =>
    Response(requestOptions: _options(), statusCode: 200, data: data);

void main() {
  late MockDioClient dioClient;
  late ResolverRemoteDataSourceImpl dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = ResolverRemoteDataSourceImpl(dioClient: dioClient);
  });

  group('getQueue', () {
    test(
      'hits GET /reports/queue with the given params and parses the body',
      () async {
        when(
          () => dioClient.get<dynamic>(
            ApiEndpoints.queue,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => _response({
            'status': true,
            'data': {
              'items': [
                {'id': 'q1', 'status': 'reported'},
              ],
              'counts': {'open': 1, 'in_progress': 0, 'resolved': 0},
              'meta': {'has_next': false},
            },
          }),
        );

        final result = await dataSource.getQueue(
          tab: QueueTab.open,
          latitude: -6.2,
          longitude: 106.8,
          radiusMeter: 2000,
          limit: 15,
          offset: 5,
        );

        expect(result.data?.items, hasLength(1));
        expect(result.data?.items?.first.id, 'q1');
        expect(result.data?.counts?.open, 1);

        final captured =
            verify(
                  () => dioClient.get<dynamic>(
                    ApiEndpoints.queue,
                    queryParameters: captureAny(named: 'queryParameters'),
                  ),
                ).captured.single
                as Map<String, dynamic>;
        expect(captured['tab'], 'OPEN');
        expect(captured['latitude'], -6.2);
        expect(captured['longitude'], 106.8);
        expect(captured['radius_meter'], 2000);
        expect(captured['limit'], 15);
        expect(captured['offset'], 5);
      },
    );

    test('sends the tab slug for each QueueTab value', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.queue,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response({'data': <String, dynamic>{}}));

      await dataSource.getQueue(
        tab: QueueTab.inProgress,
        latitude: 0,
        longitude: 0,
      );

      final captured =
          verify(
                () => dioClient.get<dynamic>(
                  ApiEndpoints.queue,
                  queryParameters: captureAny(named: 'queryParameters'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured['tab'], 'IN_PROGRESS');
    });

    test('defaults radiusMeter to 5000, limit to 20 and offset to 0 when not provided', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.queue,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => _response({'data': <String, dynamic>{}}));

      await dataSource.getQueue(
        tab: QueueTab.resolved,
        latitude: 1,
        longitude: 2,
      );

      final captured =
          verify(
                () => dioClient.get<dynamic>(
                  ApiEndpoints.queue,
                  queryParameters: captureAny(named: 'queryParameters'),
                ),
              ).captured.single
              as Map<String, dynamic>;
      expect(captured['radius_meter'], 5000);
      expect(captured['limit'], 20);
      expect(captured['offset'], 0);
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.queue,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
        ),
      );

      await expectLater(
        dataSource.getQueue(tab: QueueTab.open, latitude: 0, longitude: 0),
        throwsA(isA<NetworkException>()),
      );
    });

    test('an unexpected thrown error becomes UnknownException', () async {
      when(
        () => dioClient.get<dynamic>(
          ApiEndpoints.queue,
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(StateError('boom'));

      await expectLater(
        dataSource.getQueue(tab: QueueTab.open, latitude: 0, longitude: 0),
        throwsA(isA<UnknownException>()),
      );
    });
  });
}
