import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/service/service.dart';
import 'package:pantau/features/resolver/presentation/provider/resolver_location_notifier.dart';

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

  ResolverLocation notifier() =>
      container.read(resolverLocationProvider.notifier);

  test('build() starts with AsyncData(null) and does not call the location service', () {
    final state = container.read(resolverLocationProvider);

    expect(state, const AsyncData<LocationResult?>(null));
    verifyNever(() => locationService.getCurrentLocation());
  });

  test(
    'locate() stores a successful LocationResult from LocationService',
    () async {
      const result = LocationSuccess(
        latitude: 1,
        longitude: 2,
        accuracyInMeters: 5,
      );
      when(() => locationService.getCurrentLocation())
          .thenAnswer((_) async => result);

      await notifier().locate();

      expect(
        container.read(resolverLocationProvider),
        const AsyncData<LocationResult?>(result),
      );
    },
  );

  test(
    'locate() sets loading state before the location service resolves',
    () async {
      final completer = Completer<LocationResult>();
      when(() => locationService.getCurrentLocation())
          .thenAnswer((_) => completer.future);

      final future = notifier().locate();
      expect(
        container.read(resolverLocationProvider),
        isA<AsyncLoading<LocationResult?>>(),
      );

      completer.complete(const LocationServiceDisabled());
      await future;
    },
  );

  test(
    'locate() surfaces every non-success LocationResult unchanged',
    () async {
      for (final result in const [
        LocationServiceDisabled(),
        LocationPermissionDenied(),
        LocationPermissionDeniedForever(),
        LocationFailed(debugDetail: 'boom'),
      ]) {
        when(() => locationService.getCurrentLocation())
            .thenAnswer((_) async => result);

        await notifier().locate();

        expect(container.read(resolverLocationProvider).value, same(result));
      }
    },
  );

  test('openSettings() delegates to LocationService.openSettings', () async {
    when(() => locationService.openSettings()).thenAnswer((_) async {});

    await notifier().openSettings();

    verify(() => locationService.openSettings()).called(1);
  });
}
