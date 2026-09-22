import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class GetReportCategoriesUsecase
    extends UseCase<List<ReportCategory>, NoParams> {
  GetReportCategoriesUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, List<ReportCategory>>> call(NoParams params) =>
      _mapRepository.getReportCategories();
}
