import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/features/resolver/data/datasources/resolver_remote_datasource.dart';
import 'package:pantau/features/resolver/data/repository/resolver_repository_impl.dart';
import 'package:pantau/features/resolver/domain/repository/resolver_repository.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';

part 'resolver_di.g.dart';

@Riverpod(keepAlive: true)
ResolverRemoteDataSource resolverRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);

  return ResolverRemoteDataSourceImpl(dioClient: dioClient);
}

@Riverpod(keepAlive: true)
ResolverRepository resolverRepository(Ref ref) {
  final resolverRemoteDataSource = ref.watch(resolverRemoteDataSourceProvider);

  return ResolverRepositoryImpl(
    resolverRemoteDataSource: resolverRemoteDataSource,
  );
}

@Riverpod(keepAlive: true)
GetQueueUsecase getQueueUsecase(Ref ref) {
  return GetQueueUsecase(
    resolverRepository: ref.watch(resolverRepositoryProvider),
  );
}
