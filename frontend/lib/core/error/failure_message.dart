import 'failure.dart';

/// Human-readable message for any [Failure] variant.
extension FailureMessage on Failure {
  String get displayMessage => switch (this) {
    NetworkFailure(:final message) => message,
    TimeoutFailure(:final message) => message,
    BadRequestFailure(:final message) => message,
    UnauthorizedFailure(:final message) => message,
    ForbiddenFailure(:final message) => message,
    NotFoundFailure(:final message) => message,
    // The first field error says what to fix; the generic message doesn't.
    ValidationFailure(:final fieldErrors, :final message) =>
      fieldErrors.values
              .expand((messages) => messages)
              .where((m) => m.trim().isNotEmpty)
              .firstOrNull ??
          message,
    TooManyRequestsFailure(:final message) => message,
    ServerFailure(:final message) => message,
    CacheFailure(:final message) => message,
    UnknownFailure(:final message) => message,
  };
}

/// User-facing message for any caught [error]. Non-[Failure] errors get
/// generic copy so raw exception text never reaches the UI.
String displayMessageOf(Object? error) => switch (error) {
  final Failure failure => failure.displayMessage,
  _ => const Failure.unknown().displayMessage,
};
