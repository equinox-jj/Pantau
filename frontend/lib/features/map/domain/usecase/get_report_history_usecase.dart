import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

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
