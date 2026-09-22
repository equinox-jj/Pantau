import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockPlaceRepository extends Mock implements PlaceRepository {}

void main() {
  late MockPlaceRepository repository;
  late SearchPlacesUsecase usecase;

  setUp(() {
    repository = MockPlaceRepository();
    usecase = SearchPlacesUsecase(placeRepository: repository);
  });

  test(
    'SearchPlacesParams equatable props include every field and default limit',
    () {
      const params = SearchPlacesParams(query: 'Monas');
      expect(params.props, ['Monas', null, 6]);
    },
  );

  test('delegates to repository.searchPlaces with the params fields', () async {
    const places = [
      Place(
        id: '1',
        name: 'Monas',
        address: '',
        latitude: -6.2,
        longitude: 106.8,
      ),
    ];
    const viewBox = PlaceViewBox(
      minLatitude: 1,
      minLongitude: 2,
      maxLatitude: 3,
      maxLongitude: 4,
    );
    when(
      () => repository.searchPlaces(
        query: any(named: 'query'),
        viewBox: any(named: 'viewBox'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => const Right(places));

    final result = await usecase(
      const SearchPlacesParams(query: 'Monas', viewBox: viewBox, limit: 3),
    );

    expect(result, const Right<Failure, List<Place>>(places));
    verify(
      () => repository.searchPlaces(query: 'Monas', viewBox: viewBox, limit: 3),
    ).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.searchPlaces(
        query: any(named: 'query'),
        viewBox: any(named: 'viewBox'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(const SearchPlacesParams(query: 'Monas'));

    expect(result, const Left<Failure, List<Place>>(Failure.network()));
  });
}
