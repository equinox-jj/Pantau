import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Domain-layer error type returned inside `Either<Failure, T>`.
/// Consume with a Dart 3 `switch` expression on the sealed union.
@freezed
sealed class Failure with _$Failure {
  /// No connectivity.
  const factory Failure.network([
    @Default('No internet connection') String message,
  ]) = NetworkFailure;

  /// Timeout.
  const factory Failure.timeout([
    @Default('Request timed out') String message,
  ]) = TimeoutFailure;

  /// HTTP 400.
  const factory Failure.badRequest([@Default('Bad request') String message]) =
      BadRequestFailure;

  /// HTTP 401 (refresh failed / session expired).
  const factory Failure.unauthorized([
    @Default('Unauthorized') String message,
  ]) = UnauthorizedFailure;

  /// HTTP 403.
  const factory Failure.forbidden([@Default('Forbidden') String message]) =
      ForbiddenFailure;

  /// HTTP 404.
  const factory Failure.notFound([@Default('Not found') String message]) =
      NotFoundFailure;

  /// HTTP 422 — per-field validation errors.
  const factory Failure.validation(
    Map<String, List<String>> fieldErrors, [
    @Default('Validation failed') String message,
  ]) = ValidationFailure;

  /// HTTP 429.
  const factory Failure.tooManyRequests([
    @Default('Too many requests') String message,
  ]) = TooManyRequestsFailure;

  /// HTTP 5xx.
  const factory Failure.server(
    int statusCode, [
    @Default('Server error') String message,
  ]) = ServerFailure;

  /// Local storage / cache error.
  const factory Failure.cache([@Default('Cache error') String message]) =
      CacheFailure;

  /// Unclassified error.
  const factory Failure.unknown([@Default('Unexpected error') String message]) =
      UnknownFailure;
}
