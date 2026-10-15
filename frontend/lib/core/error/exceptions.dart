/// Typed exceptions thrown in the data layer. Mapped from [DioException] by
/// `error_mapper.dart` and converted to `Failure` at the repository boundary.
/// Shown when the server replies with a body we can't parse.
const malformedResponseMessage =
    "We got an unexpected response from the server. Please try again.";

sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// No network connectivity / socket error.
class NetworkException extends AppException {
  const NetworkException([
    super.message =
        'No internet connection. Please check your connection and try again.',
  ]);
}

/// Request exceeded a configured timeout.
class TimeoutException extends AppException {
  const TimeoutException([
    super.message = 'This is taking longer than usual. Please try again.',
  ]);
}

/// HTTP 400.
class BadRequestException extends AppException {
  const BadRequestException([
    super.message = "Something about that request wasn't right. Please check and try again.",
  ]);
}

/// HTTP 401 after refresh already failed.
class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Your session has expired. Please sign in again.',
  ]);
}

/// HTTP 403.
class ForbiddenException extends AppException {
  const ForbiddenException([
    super.message = "You don't have permission to do that.",
  ]);
}

/// HTTP 404.
class NotFoundException extends AppException {
  const NotFoundException([
    super.message = "We couldn't find what you were looking for.",
  ]);
}

/// HTTP 422 — multi-field validation errors keyed by field name.
class ValidationException extends AppException {
  const ValidationException(
    this.fieldErrors, [
    super.message = 'Some details need fixing. Please check and try again.',
  ]);

  /// Field name to that field's error messages.
  final Map<String, List<String>> fieldErrors;
}

/// HTTP 429.
class TooManyRequestsException extends AppException {
  const TooManyRequestsException([
    super.message = 'Too many attempts. Please wait a moment and try again.',
  ]);
}

/// HTTP 5xx.
class ServerException extends AppException {
  const ServerException(
    this.statusCode, [
    super.message =
        'Something went wrong on our end. Please try again in a moment.',
  ]);

  final int statusCode;
}

/// Request was cancelled.
class RequestCancelledException extends AppException {
  const RequestCancelledException([
    super.message = 'The request was cancelled.',
  ]);
}

/// Anything not otherwise classified.
class UnknownException extends AppException {
  const UnknownException([
    super.message = 'Something went wrong. Please try again.',
  ]);
}

/// Local storage / cache read or write failure.
class CacheException extends AppException {
  const CacheException([
    super.message =
        "We couldn't read data saved on this device. Please try again.",
  ]);
}
