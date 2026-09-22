import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class GetMyReportsParams extends Equatable {
  const GetMyReportsParams({this.limit = 50, this.offset = 0});

  final int limit;
  final int offset;

  @override
  List<Object?> get props => [limit, offset];
}

class GetMyReportsUsecase
    extends UseCase<List<FeedReport>, GetMyReportsParams> {
  GetMyReportsUsecase({required this._reportRepository});

  final ReportRepository _reportRepository;

  @override
  Future<Either<Failure, List<FeedReport>>> call(GetMyReportsParams params) =>
      _reportRepository.getMyReports(
        limit: params.limit,
        offset: params.offset,
      );
}
