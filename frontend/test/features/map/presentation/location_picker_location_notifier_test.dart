import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/service/service.dart';
import 'package:pantau/features/map/presentation/pages/location_picker/provider/location_picker_location_notifier.dart';

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockLocationService locationService;
  late ProviderContainer container;

  setUp(() {
    locationService = MockLocationService();
    container = ProviderContainer(
      overrides: [locationServiceProvider.overrideWithValue(locationService)],
    );
    addTearDown(container.dispose);
  });

  LocationPickerLocation notifier() =>
      container.read(locationPickerLocationProvider.notifier);

  test('initial state is AsyncData(null)', () {
    final state = container.read(locationPickerLocationProvider);
    expect(state, const AsyncData<LocationResult?>(null));
  });

  test('locate() stores the location result from LocationService', () async {
    const result = LocationSuccess(
      latitude: 1,
      longitude: 2,
      accuracyInMeters: 5,
    );
    when(() => locationService.getCurrentLocation())
        .thenAnswer((_) async => result);

    await notifier().locate();

    expect(
      container.read(locationPickerLocationProvider),
      const AsyncData<LocationResult?>(result),
    );
  });

  test(
    'locate() surfaces a permission-denied result the same as a success',
    () async {
      const result = LocationPermissionDenied();
      when(() => locationService.getCurrentLocation())
          .thenAnswer((_) async => result);

      await notifier().locate();

      expect(
        container.read(locationPickerLocationProvider),
        const AsyncData<LocationResult?>(result),
      );
    },
  );

  test('locate() goes through a loading state before settling', () async {
    const result = LocationSuccess(
      latitude: 1,
      longitude: 2,
      accuracyInMeters: 5,
    );
    when(() => locationService.getCurrentLocation())
        .thenAnswer((_) async => result);

    final future = notifier().locate();

    expect(
      container.read(locationPickerLocationProvider),
      isA<AsyncLoading<LocationResult?>>(),
    );
    await future;
  });

  test('openSettings() delegates to LocationService.openSettings', () async {
    when(() => locationService.openSettings()).thenAnswer((_) async {});

    await notifier().openSettings();

    verify(() => locationService.openSettings()).called(1);
  });
}
