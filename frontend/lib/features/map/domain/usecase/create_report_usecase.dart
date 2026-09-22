import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class CreateReportParams extends Equatable {
  const CreateReportParams({
    required this.categoryId,
    required this.description,
    required this.photoPaths,
    required this.latitude,
    required this.longitude,
  });

  final int categoryId;
  final String description;
  final List<String> photoPaths;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [
    categoryId,
    description,
    photoPaths,
    latitude,
    longitude,
  ];
}

class CreateReportUsecase extends UseCase<ReportDetail, CreateReportParams> {
  CreateReportUsecase({required this._mapRepository});

  static const _minPhotos = 1;
  static const _maxPhotos = 4;

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, ReportDetail>> call(CreateReportParams params) async {
    final photoCount = params.photoPaths.length;
    if (photoCount < _minPhotos || photoCount > _maxPhotos) {
      return const Left(
        Failure.validation({
          'photos': ['Attach between $_minPhotos and $_maxPhotos photos'],
        }),
      );
    }

    return _mapRepository.createReport(
      categoryId: params.categoryId,
      description: params.description,
      photoPaths: params.photoPaths,
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}
