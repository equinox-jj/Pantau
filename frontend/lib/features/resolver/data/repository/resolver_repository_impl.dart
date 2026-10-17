import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/repository/resolver_repository.dart';
import 'package:pantau/features/resolver/data/datasources/resolver_remote_datasource.dart';
import 'package:pantau/features/resolver/data/mapper/resolver_mapper.dart';

class ResolverRepositoryImpl extends ResolverRepository {
  ResolverRepositoryImpl({required this._resolverRemoteDataSource});

  final ResolverRemoteDataSource _resolverRemoteDataSource;

  @override
  Future<Either<Failure, QueueResult>> getQueue({
    required QueueTab tab,
    required double latitude,
    required double longitude,
    int radiusMeter = 5000,
    int limit = 20,
    int offset = 0,
  }) => safeCall(() async {
    final result = await _resolverRemoteDataSource.getQueue(
      tab: tab,
      latitude: latitude,
      longitude: longitude,
      radiusMeter: radiusMeter,
      limit: limit,
      offset: offset,
    );

    return result.requireData().toEntity(
      hasNext: result.pagination?.hasNext ?? false,
    );
  });
}
