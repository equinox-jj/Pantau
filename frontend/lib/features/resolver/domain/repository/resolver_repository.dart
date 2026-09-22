import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../entity/resolver_entity.dart';

abstract class ResolverRepository with BaseRepository {
  Future<Either<Failure, QueueResult>> getQueue({
    required QueueTab tab,
    required double latitude,
    required double longitude,
    int radiusMeter,
    int limit,
    int offset,
  });
}
