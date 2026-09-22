import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../entity/resolver_entity.dart';
import '../repository/resolver_repository.dart';

class GetQueueParams extends Equatable {
  const GetQueueParams({
    required this.tab,
    required this.latitude,
    required this.longitude,
    this.radiusMeter = 5000,
    this.limit = 20,
    this.offset = 0,
  });

  final QueueTab tab;
  final double latitude;
  final double longitude;
  final int radiusMeter;
  final int limit;
  final int offset;

  @override
  List<Object?> get props => [
    tab,
    latitude,
    longitude,
    radiusMeter,
    limit,
    offset,
  ];
}

class GetQueueUsecase extends UseCase<QueueResult, GetQueueParams> {
  GetQueueUsecase({required this._resolverRepository});

  final ResolverRepository _resolverRepository;

  @override
  Future<Either<Failure, QueueResult>> call(GetQueueParams params) =>
      _resolverRepository.getQueue(
        tab: params.tab,
        latitude: params.latitude,
        longitude: params.longitude,
        radiusMeter: params.radiusMeter,
        limit: params.limit,
        offset: params.offset,
      );
}
