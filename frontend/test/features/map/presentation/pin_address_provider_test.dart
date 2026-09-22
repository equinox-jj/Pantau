import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/di/di.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';
import 'package:pantau/features/map/presentation/pages/location_picker/provider/pin_address_provider.dart';

class MockReverseGeocodeUsecase extends Mock implements ReverseGeocodeUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const ReverseGeocodeParams(latitude: 0, longitude: 0),
    );
  });

  late MockReverseGeocodeUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockReverseGeocodeUsecase();
    container = ProviderContainer(
      overrides: [reverseGeocodeUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  // pinAddressProvider is autoDispose; without a live listener the provider
  // can be torn down mid-flight, so pin it right before triggering the build
  // in every test — see splash_notifier_test.dart for the same pattern.
  Future<AsyncValue<Place?>> build(double latitude, double longitude) async {
    final provider = pinAddressProvider(
      latitude: latitude,
      longitude: longitude,
    );
    container.listen(provider, (_, _) {});
    container.read(provider);
    await pumpEventQueue();
    return container.read(provider);
  }

  test('resolves to the place returned by the usecase', () async {
    const place = Place(
      id: '1',
      name: 'Monas',
      address: '',
      latitude: -6.2,
      longitude: 106.8,
    );
    when(() => usecase(any())).thenAnswer((_) async => const Right(place));

    final state = await build(-6.2, 106.8);

    expect(state.value, place);
  });

  test('resolves to null when the point has no address', () async {
    when(() => usecase(any())).thenAnswer((_) async => const Right(null));

    final state = await build(0, 0);

    expect(state.hasValue, isTrue);
    expect(state.value, isNull);
  });

  test(
    'a Left(Failure) surfaces as an AsyncError carrying the Failure',
    () async {
      when(() => usecase(any()))
          .thenAnswer((_) async => const Left(Failure.network()));

      final state = await build(0, 0);

      expect(state.hasError, isTrue);
      expect(state.error, const Failure.network());
    },
  );

  test('passes latitude/longitude through as ReverseGeocodeParams', () async {
    when(() => usecase(any())).thenAnswer((_) async => const Right(null));

    await build(-6.2, 106.8);

    verify(
      () =>
          usecase(const ReverseGeocodeParams(latitude: -6.2, longitude: 106.8)),
    ).called(1);
  });

  test('roundedCoordinate snaps a value to ~5 decimal places', () {
    expect(roundedCoordinate(-6.200001234), -6.20000);
    expect(roundedCoordinate(106.8), 106.8);
  });
}
