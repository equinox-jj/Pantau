import 'package:fpdart/fpdart.dart';

import '../error/error_mapper.dart';

/// Converts thrown exceptions into a domain [Failure]. The single boundary
/// where exceptions stop and `Either` begins.
mixin BaseRepository {
  /// `Right` on success, `Left(Failure)` on any throw.
  Future<Either<Failure, T>> safeCall<T>(Future<T> Function() body) async {
    try {
      final value = await body();
      return Right(value);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
