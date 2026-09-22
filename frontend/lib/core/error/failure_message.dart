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
    ValidationFailure(:final message) => message,
    TooManyRequestsFailure(:final message) => message,
    ServerFailure(:final message) => message,
    CacheFailure(:final message) => message,
    UnknownFailure(:final message) => message,
  };
}
