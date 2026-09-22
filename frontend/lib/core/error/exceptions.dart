/// Typed exceptions thrown in the data layer. Mapped from [DioException] by
/// `error_mapper.dart` and converted to `Failure` at the repository boundary.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// No network connectivity / socket error.
class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection']);
}

/// Request exceeded a configured timeout.
class TimeoutException extends AppException {
  const TimeoutException([super.message = 'Request timed out']);
}

/// HTTP 400.
class BadRequestException extends AppException {
  const BadRequestException([super.message = 'Bad request']);
}

/// HTTP 401 after refresh already failed.
class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized']);
}

/// HTTP 403.
class ForbiddenException extends AppException {
  const ForbiddenException([super.message = 'Forbidden']);
}

/// HTTP 404.
class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found']);
}

/// HTTP 422 — multi-field validation errors keyed by field name.
class ValidationException extends AppException {
  const ValidationException(
    this.fieldErrors, [
    super.message = 'Validation failed',
  ]);

  /// Field name to that field's error messages.
  final Map<String, List<String>> fieldErrors;
}

/// HTTP 429.
class TooManyRequestsException extends AppException {
  const TooManyRequestsException([super.message = 'Too many requests']);
}

/// HTTP 5xx.
class ServerException extends AppException {
  const ServerException(this.statusCode, [super.message = 'Server error']);

  final int statusCode;
}

/// Request was cancelled.
class RequestCancelledException extends AppException {
  const RequestCancelledException([super.message = 'Request cancelled']);
}

/// Anything not otherwise classified.
class UnknownException extends AppException {
  const UnknownException([super.message = 'Unexpected error']);
}

/// Local storage / cache read or write failure.
class CacheException extends AppException {
  const CacheException([super.message = 'Cache error']);
}
