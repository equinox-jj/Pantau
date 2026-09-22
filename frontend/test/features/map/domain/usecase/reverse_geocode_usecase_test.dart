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
  late ReverseGeocodeUsecase usecase;

  setUp(() {
    repository = MockPlaceRepository();
    usecase = ReverseGeocodeUsecase(placeRepository: repository);
  });

  test('ReverseGeocodeParams equatable props include every field', () {
    const params = ReverseGeocodeParams(latitude: 1, longitude: 2);
    expect(params.props, [1.0, 2.0]);
  });

  test(
    'delegates to repository.reverseGeocode with the params fields',
    () async {
      const place = Place(
        id: '1',
        name: 'Monas',
        address: '',
        latitude: -6.2,
        longitude: 106.8,
      );
      when(
        () => repository.reverseGeocode(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
        ),
      ).thenAnswer((_) async => const Right(place));

      final result = await usecase(
        const ReverseGeocodeParams(latitude: -6.2, longitude: 106.8),
      );

      expect(result, const Right<Failure, Place?>(place));
      verify(() => repository.reverseGeocode(latitude: -6.2, longitude: 106.8))
          .called(1);
    },
  );

  test('propagates a Right(null) when the point has no address', () async {
    when(
      () => repository.reverseGeocode(
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => const Right(null));

    final result = await usecase(
      const ReverseGeocodeParams(latitude: 0, longitude: 0),
    );

    expect(result, const Right<Failure, Place?>(null));
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.reverseGeocode(
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(
      const ReverseGeocodeParams(latitude: 0, longitude: 0),
    );

    expect(result, const Left<Failure, Place?>(Failure.network()));
  });
}
