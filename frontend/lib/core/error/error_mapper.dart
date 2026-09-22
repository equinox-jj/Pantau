import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'failure.dart';

// So callers importing only error_mapper.dart also get the Failure subtypes.
export 'failure.dart';

/// Converts a [DioException] into a typed [AppException].
AppException mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const TimeoutException();
    case DioExceptionType.connectionError:
      return const NetworkException();
    case DioExceptionType.cancel:
      return const RequestCancelledException();
    case DioExceptionType.badCertificate:
      return const NetworkException('Bad certificate');
    case DioExceptionType.badResponse:
      return _mapResponse(e.response);
    case DioExceptionType.unknown:
      if (e.error is FormatException) {
        return const UnknownException('Malformed response');
      }
      return const NetworkException();
  }
}

/// Converts any thrown error (typically [AppException]) into a domain [Failure].
Failure mapExceptionToFailure(Object error) {
  if (error is AppException) {
    return switch (error) {
      NetworkException() => const Failure.network(),
      TimeoutException() => const Failure.timeout(),
      BadRequestException() => Failure.badRequest(error.message),
      UnauthorizedException() => Failure.unauthorized(error.message),
      ForbiddenException() => Failure.forbidden(error.message),
      NotFoundException() => Failure.notFound(error.message),
      ValidationException() => Failure.validation(
        error.fieldErrors,
        error.message,
      ),
      TooManyRequestsException() => const Failure.tooManyRequests(),
      ServerException() => Failure.server(error.statusCode, error.message),
      RequestCancelledException() => Failure.unknown(error.message),
      UnknownException() => Failure.unknown(error.message),
      CacheException() => Failure.cache(error.message),
    };
  }
  return Failure.unknown(error.toString());
}

AppException _mapResponse(Response<dynamic>? response) {
  final status = response?.statusCode ?? 0;
  final data = response?.data;
  final message = _extractMessage(data);
  switch (status) {
    case 400:
      return BadRequestException(message ?? 'Bad request');
    case 401:
      return UnauthorizedException(message ?? 'Unauthorized');
    case 403:
      return ForbiddenException(message ?? 'Forbidden');
    case 404:
      return NotFoundException(message ?? 'Not found');
    case 422:
      return ValidationException(
        _parseFieldErrors(data),
        message ?? 'Validation failed',
      );
    case 429:
      return const TooManyRequestsException();
    default:
      if (status >= 500) {
        return ServerException(status, message ?? 'Server error');
      }
      return UnknownException(message ?? 'Unexpected error ($status)');
  }
}

String? _extractMessage(Object? data) {
  if (data is Map && data['message'] is String) {
    return data['message'] as String;
  }
  if (data is Map && data['error'] is String) {
    return data['error'] as String;
  }
  return null;
}

/// Tolerant parser for HTTP 422 bodies. Normalizes both
/// `{"errors": {"email": ["msg"]}}` and
/// `{"errors": [{"field": "email", "message": "msg"}]}` to `field: [messages]`.
Map<String, List<String>> _parseFieldErrors(Object? data) {
  final result = <String, List<String>>{};
  if (data is! Map) return result;

  final errors = data['errors'];
  if (errors is Map) {
    errors.forEach((key, value) {
      final field = key.toString();
      if (value is List) {
        result[field] = value.map((e) => e.toString()).toList();
      } else if (value is String) {
        result[field] = [value];
      }
    });
  } else if (errors is List) {
    for (final item in errors) {
      if (item is Map) {
        final field = (item['field'] ?? item['param'] ?? 'general').toString();
        final msg = (item['message'] ?? item['msg'] ?? '').toString();
        result.putIfAbsent(field, () => <String>[]).add(msg);
      }
    }
  }
  return result;
}
