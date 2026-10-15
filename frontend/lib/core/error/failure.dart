import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Domain-layer error type returned inside `Either<Failure, T>`.
/// Consume with a Dart 3 `switch` expression on the sealed union.
@freezed
sealed class Failure with _$Failure {
  /// No connectivity.
  const factory Failure.network([
    @Default(
      'No internet connection. Please check your connection and try again.',
    )
    String message,
  ]) = NetworkFailure;

  /// Timeout.
  const factory Failure.timeout([
    @Default('This is taking longer than usual. Please try again.')
    String message,
  ]) = TimeoutFailure;

  /// HTTP 400.
  const factory Failure.badRequest([
    @Default(
      "Something about that request wasn't right. Please check and try again.",
    )
    String message,
  ]) = BadRequestFailure;

  /// HTTP 401 (refresh failed / session expired).
  const factory Failure.unauthorized([
    @Default('Your session has expired. Please sign in again.') String message,
  ]) = UnauthorizedFailure;

  /// HTTP 403.
  const factory Failure.forbidden([
    @Default("You don't have permission to do that.") String message,
  ]) = ForbiddenFailure;

  /// HTTP 404.
  const factory Failure.notFound([
    @Default("We couldn't find what you were looking for.") String message,
  ]) = NotFoundFailure;

  /// HTTP 422 — per-field validation errors.
  const factory Failure.validation(
    Map<String, List<String>> fieldErrors, [
    @Default('Some details need fixing. Please check and try again.')
    String message,
  ]) = ValidationFailure;

  /// HTTP 429.
  const factory Failure.tooManyRequests([
    @Default('Too many attempts. Please wait a moment and try again.')
    String message,
  ]) = TooManyRequestsFailure;

  /// HTTP 5xx.
  const factory Failure.server(
    int statusCode, [
    @Default('Something went wrong on our end. Please try again in a moment.')
    String message,
  ]) = ServerFailure;

  /// Local storage / cache error.
  const factory Failure.cache([
    @Default("We couldn't read data saved on this device. Please try again.")
    String message,
  ]) = CacheFailure;

  /// Unclassified error.
  const factory Failure.unknown([
    @Default('Something went wrong. Please try again.') String message,
  ]) = UnknownFailure;
}
