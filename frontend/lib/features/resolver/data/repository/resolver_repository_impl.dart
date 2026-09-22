import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entity/resolver_entity.dart';
import '../../domain/repository/resolver_repository.dart';
import '../datasources/resolver_remote_datasource.dart';
import '../mapper/resolver_mapper.dart';

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

    return result.toEntity();
  });
}
