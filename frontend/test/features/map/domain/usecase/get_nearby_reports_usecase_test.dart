import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  late MockMapRepository repository;
  late GetNearbyReportsUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = GetNearbyReportsUsecase(mapRepository: repository);
  });

  test('GetNearbyReportsParams equatable props include every field and default limit', () {
    const params = GetNearbyReportsParams(
      latitude: 1,
      longitude: 2,
      radiusInMeters: 3,
    );
    expect(params.props, [1.0, 2.0, 3, 10]);
  });

  test(
    'delegates to repository.getNearbyReports with the params fields',
    () async {
      const reports = [NearbyReport(id: 'r1')];
      when(
        () => repository.getNearbyReports(
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusInMeters: any(named: 'radiusInMeters'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const Right(reports));

      final result = await usecase(
        const GetNearbyReportsParams(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 25,
        ),
      );

      expect(result, const Right<Failure, List<NearbyReport>>(reports));
      verify(
        () => repository.getNearbyReports(
          latitude: -6.2,
          longitude: 106.8,
          radiusInMeters: 1000,
          limit: 25,
        ),
      ).called(1);
    },
  );

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.getNearbyReports(
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
        radiusInMeters: any(named: 'radiusInMeters'),
        limit: any(named: 'limit'),
      ),
    ).thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(
      const GetNearbyReportsParams(
        latitude: 0,
        longitude: 0,
        radiusInMeters: 500,
      ),
    );

    expect(result, const Left<Failure, List<NearbyReport>>(Failure.network()));
  });
}
