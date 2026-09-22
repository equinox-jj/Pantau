import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class UpdateReportStatusParams extends Equatable {
  const UpdateReportStatusParams({
    required this.id,
    required this.toStatus,
    this.note,
  });

  final String id;
  final ReportStatus toStatus;
  final String? note;

  @override
  List<Object?> get props => [id, toStatus, note];
}

class UpdateReportStatusUsecase
    extends UseCase<ReportDetail, UpdateReportStatusParams> {
  UpdateReportStatusUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, ReportDetail>> call(UpdateReportStatusParams params) =>
      _mapRepository.updateReportStatus(
        id: params.id,
        toStatus: params.toStatus,
        note: params.note,
      );
}
