import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/features/auth/data/datasources/datasources.dart';

class MockDioClient extends Mock implements DioClient {}

RequestOptions _options() => RequestOptions(path: '/x');

Response<dynamic> _response(Object? data) =>
    Response(requestOptions: _options(), statusCode: 200, data: data);

void main() {
  late MockDioClient dioClient;
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = AuthRemoteDataSourceImpl(dioClient: dioClient);
  });

  group('login', () {
    test(
      'hits POST /auth/login with email/password and parses the body',
      () async {
        when(
          () => dioClient.post<dynamic>(
            ApiEndpoints.login,
            data: any(named: 'data'),
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => _response({
            'status': true,
            'message': 'ok',
            'data': {
              'token': 'tok',
              'expires_in': 3600,
              'user_response': {'uuid': 'u1', 'email': 'a@b.com'},
            },
          }),
        );

        final result = await dataSource.login(
          email: 'a@b.com',
          password: 'secret',
        );

        expect(result.status, isTrue);
        expect(result.data?.token, 'tok');
        expect(result.data?.userResponse?.uuid, 'u1');

        final captured = verify(
          () => dioClient.post<dynamic>(
            ApiEndpoints.login,
            data: captureAny(named: 'data'),
            options: captureAny(named: 'options'),
          ),
        ).captured;
        final body = captured.first as Map<String, dynamic>;
        expect(body['email'], 'a@b.com');
        expect(body['password'], 'secret');
        final options = captured.last as Options;
        expect(options.extra?[ApiEndpoints.kNoAuth], isTrue);
      },
    );

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.post<dynamic>(
          ApiEndpoints.login,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      await expectLater(
        dataSource.login(email: 'a@b.com', password: 'secret'),
        throwsA(isA<TimeoutException>()),
      );
    });

    test('an unexpected thrown error becomes UnknownException', () async {
      when(
        () => dioClient.post<dynamic>(
          ApiEndpoints.login,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenThrow(StateError('boom'));

      await expectLater(
        dataSource.login(email: 'a@b.com', password: 'secret'),
        throwsA(isA<UnknownException>()),
      );
    });
  });

  group('register', () {
    test('hits POST /auth/register with email/password/display_name and parses the body', () async {
      when(
        () => dioClient.post<dynamic>(
          ApiEndpoints.register,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenAnswer(
        (_) async => _response({
          'status': true,
          'data': {
            'token': 'tok2',
            'user_response': {'uuid': 'u2', 'username': 'newbie'},
          },
        }),
      );

      final result = await dataSource.register(
        email: 'new@b.com',
        password: 'secret2',
        displayName: 'New User',
      );

      expect(result.data?.token, 'tok2');
      expect(result.data?.userResponse?.username, 'newbie');

      final captured = verify(
        () => dioClient.post<dynamic>(
          ApiEndpoints.register,
          data: captureAny(named: 'data'),
          options: captureAny(named: 'options'),
        ),
      ).captured;
      final body = captured.first as Map<String, dynamic>;
      expect(body['email'], 'new@b.com');
      expect(body['password'], 'secret2');
      expect(body['display_name'], 'New User');
      final options = captured.last as Options;
      expect(options.extra?[ApiEndpoints.kNoAuth], isTrue);
    });

    test('rethrows a DioException as its mapped AppException', () async {
      when(
        () => dioClient.post<dynamic>(
          ApiEndpoints.register,
          data: any(named: 'data'),
          options: any(named: 'options'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.connectionError,
        ),
      );

      await expectLater(
        dataSource.register(
          email: 'new@b.com',
          password: 'secret2',
          displayName: 'New User',
        ),
        throwsA(isA<NetworkException>()),
      );
    });
  });

  group('getMe', () {
    test('hits GET /users/me and parses the body', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.me)).thenAnswer(
        (_) async => _response({
          'status': true,
          'data': {
            'id': 'u1',
            'display_name': 'Jane',
            'reports_count': 3,
            'resolved_count': 1,
          },
        }),
      );

      final result = await dataSource.getMe();

      expect(result.data?.id, 'u1');
      expect(result.data?.displayName, 'Jane');
      expect(result.data?.reportsCount, 3);
      expect(result.data?.resolvedCount, 1);

      verify(() => dioClient.get<dynamic>(ApiEndpoints.me)).called(1);
    });

    test('an HTTP 401 response is mapped to UnauthorizedException', () async {
      when(() => dioClient.get<dynamic>(ApiEndpoints.me)).thenThrow(
        DioException(
          requestOptions: _options(),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: _options(),
            statusCode: 401,
            data: {'message': 'Session expired'},
          ),
        ),
      );

      await expectLater(
        dataSource.getMe(),
        throwsA(
          isA<UnauthorizedException>().having(
            (e) => e.message,
            'message',
            'Session expired',
          ),
        ),
      );
    });
  });
}
