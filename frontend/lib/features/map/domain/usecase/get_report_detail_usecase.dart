import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

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
