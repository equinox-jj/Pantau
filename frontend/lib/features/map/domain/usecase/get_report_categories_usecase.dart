import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class GetReportCategoriesUsecase
    extends UseCase<List<ReportCategory>, NoParams> {
  GetReportCategoriesUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, List<ReportCategory>>> call(NoParams params) =>
      _mapRepository.getReportCategories();
}
