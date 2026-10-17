import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class GetReportHistoryParams extends Equatable {
  const GetReportHistoryParams({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}

class GetReportHistoryUsecase
    extends UseCase<List<StatusHistoryEntry>, GetReportHistoryParams> {
  GetReportHistoryUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, List<StatusHistoryEntry>>> call(
    GetReportHistoryParams params,
  ) => _mapRepository.getReportHistory(params.id);
}
