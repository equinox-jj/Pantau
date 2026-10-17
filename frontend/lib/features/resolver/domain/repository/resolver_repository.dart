import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';

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
