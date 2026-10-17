import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class SearchPlacesParams extends Equatable {
  const SearchPlacesParams({required this.query, this.viewBox, this.limit = 6});

  final String query;
  final PlaceViewBox? viewBox;
  final int limit;

  @override
  List<Object?> get props => [query, viewBox, limit];
}

class SearchPlacesUsecase extends UseCase<List<Place>, SearchPlacesParams> {
  SearchPlacesUsecase({required this._placeRepository});

  final PlaceRepository _placeRepository;

  @override
  Future<Either<Failure, List<Place>>> call(SearchPlacesParams params) =>
      _placeRepository.searchPlaces(
        query: params.query,
        viewBox: params.viewBox,
        limit: params.limit,
      );
}
