import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/error/error_mapper.dart';
import 'package:pantau/core/error/exceptions.dart';

RequestOptions _options() => RequestOptions(path: '/x');

DioException _dioOf(DioExceptionType type, {Response<dynamic>? response}) =>
    DioException(requestOptions: _options(), type: type, response: response);

Response<dynamic> _response(int statusCode, Object? data) =>
    Response(requestOptions: _options(), statusCode: statusCode, data: data);

void main() {
  group('mapDioException', () {
    test(
      'maps connection/send/receive/transform timeouts to TimeoutException',
      () {
        for (final type in [
          DioExceptionType.connectionTimeout,
          DioExceptionType.sendTimeout,
          DioExceptionType.receiveTimeout,
        ]) {
          expect(mapDioException(_dioOf(type)), isA<TimeoutException>());
        }
      },
    );

    test('maps connectionError to NetworkException', () {
      expect(
        mapDioException(_dioOf(DioExceptionType.connectionError)),
        isA<NetworkException>(),
      );
    });

    test('maps cancel to RequestCancelledException', () {
      expect(
        mapDioException(_dioOf(DioExceptionType.cancel)),
        isA<RequestCancelledException>(),
      );
    });

    test('maps badCertificate to NetworkException with fixed message', () {
      final result = mapDioException(_dioOf(DioExceptionType.badCertificate));
      expect(result, isA<NetworkException>());
      expect(result.message, 'Bad certificate');
    });

    test('maps unknown with FormatException error to malformed-response UnknownException', () {
      final dioException = DioException(
        requestOptions: _options(),
        type: DioExceptionType.unknown,
        error: const FormatException('bad json'),
      );
      final result = mapDioException(dioException);
      expect(result, isA<UnknownException>());
      expect(result.message, 'Malformed response');
    });

    test('maps unknown without FormatException to NetworkException', () {
      final result = mapDioException(_dioOf(DioExceptionType.unknown));
      expect(result, isA<NetworkException>());
    });

    group('badResponse status mapping', () {
      test('400 -> BadRequestException with body message', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(400, {'message': 'Nope'}),
          ),
        );
        expect(result, isA<BadRequestException>());
        expect(result.message, 'Nope');
      });

      test('400 without message falls back to default copy', () {
        final result = mapDioException(
          _dioOf(DioExceptionType.badResponse, response: _response(400, null)),
        );
        expect((result as BadRequestException).message, 'Bad request');
      });

      test('401 -> UnauthorizedException, reads "error" field fallback', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(401, {'error': 'Session expired'}),
          ),
        );
        expect(result, isA<UnauthorizedException>());
        expect(result.message, 'Session expired');
      });

      test('403 -> ForbiddenException', () {
        final result = mapDioException(
          _dioOf(DioExceptionType.badResponse, response: _response(403, null)),
        );
        expect(result, isA<ForbiddenException>());
      });

      test('404 -> NotFoundException', () {
        final result = mapDioException(
          _dioOf(DioExceptionType.badResponse, response: _response(404, null)),
        );
        expect(result, isA<NotFoundException>());
      });

      test('422 with map errors parses field errors', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(422, {
              'errors': {
                'email': ['is required', 'is invalid'],
                'name': 'must not be blank',
              },
            }),
          ),
        );
        expect(result, isA<ValidationException>());
        final validation = result as ValidationException;
        expect(validation.fieldErrors['email'], ['is required', 'is invalid']);
        expect(validation.fieldErrors['name'], ['must not be blank']);
      });

      test('422 with list errors parses field/param/message/msg variants', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(422, {
              'errors': [
                {'field': 'email', 'message': 'is required'},
                {'param': 'name', 'msg': 'too short'},
                {'message': 'no field given'},
              ],
            }),
          ),
        );
        final validation = result as ValidationException;
        expect(validation.fieldErrors['email'], ['is required']);
        expect(validation.fieldErrors['name'], ['too short']);
        expect(validation.fieldErrors['general'], ['no field given']);
      });

      test('422 with unrecognised errors shape yields empty field errors', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(422, {'errors': 'oops'}),
          ),
        );
        expect((result as ValidationException).fieldErrors, isEmpty);
      });

      test('429 -> TooManyRequestsException', () {
        final result = mapDioException(
          _dioOf(DioExceptionType.badResponse, response: _response(429, null)),
        );
        expect(result, isA<TooManyRequestsException>());
      });

      test('5xx -> ServerException carrying status code', () {
        final result = mapDioException(
          _dioOf(
            DioExceptionType.badResponse,
            response: _response(503, {'message': 'down'}),
          ),
        );
        expect(result, isA<ServerException>());
        expect((result as ServerException).statusCode, 503);
        expect(result.message, 'down');
      });

      test(
        'unmapped status -> UnknownException carrying status in message',
        () {
          final result = mapDioException(
            _dioOf(
              DioExceptionType.badResponse,
              response: _response(418, null),
            ),
          );
          expect(result, isA<UnknownException>());
          expect(result.message, contains('418'));
        },
      );

      test('missing response defaults status to 0 -> UnknownException', () {
        final result = mapDioException(_dioOf(DioExceptionType.badResponse));
        expect(result, isA<UnknownException>());
      });
    });
  });

  group('mapExceptionToFailure', () {
    test('maps every AppException subtype to its matching Failure', () {
      expect(
        mapExceptionToFailure(const NetworkException()),
        isA<NetworkFailure>(),
      );
      expect(
        mapExceptionToFailure(const TimeoutException()),
        isA<TimeoutFailure>(),
      );
      expect(
        mapExceptionToFailure(const BadRequestException('bad')),
        equals(const Failure.badRequest('bad')),
      );
      expect(
        mapExceptionToFailure(const UnauthorizedException('nope')),
        equals(const Failure.unauthorized('nope')),
      );
      expect(
        mapExceptionToFailure(const ForbiddenException('no')),
        equals(const Failure.forbidden('no')),
      );
      expect(
        mapExceptionToFailure(const NotFoundException('missing')),
        equals(const Failure.notFound('missing')),
      );
      expect(
        mapExceptionToFailure(
          const ValidationException({
            'a': ['b'],
          }, 'invalid'),
        ),
        equals(
          const Failure.validation({
            'a': ['b'],
          }, 'invalid'),
        ),
      );
      expect(
        mapExceptionToFailure(const TooManyRequestsException()),
        isA<TooManyRequestsFailure>(),
      );
      expect(
        mapExceptionToFailure(const ServerException(500, 'boom')),
        equals(const Failure.server(500, 'boom')),
      );
      expect(
        mapExceptionToFailure(const RequestCancelledException('cancelled')),
        equals(const Failure.unknown('cancelled')),
      );
      expect(
        mapExceptionToFailure(const UnknownException('mystery')),
        equals(const Failure.unknown('mystery')),
      );
      expect(
        mapExceptionToFailure(const CacheException('disk full')),
        equals(const Failure.cache('disk full')),
      );
    });

    test(
      'maps a non-AppException error to Failure.unknown with its toString',
      () {
        final result = mapExceptionToFailure(StateError('bad state'));
        expect(
          result,
          equals(Failure.unknown(StateError('bad state').toString())),
        );
      },
    );
  });
}
