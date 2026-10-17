import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class GetReportDetailParams extends Equatable {
  const GetReportDetailParams({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}

class GetReportDetailUsecase
    extends UseCase<ReportDetail, GetReportDetailParams> {
  GetReportDetailUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, ReportDetail>> call(GetReportDetailParams params) =>
      _mapRepository.getReportDetail(params.id);
}
