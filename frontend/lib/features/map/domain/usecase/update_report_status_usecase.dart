import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

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
