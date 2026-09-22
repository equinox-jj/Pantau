import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/di/core_di.dart';
import '../../../../../../core/service/service.dart';

part 'location_picker_location_notifier.g.dart';

/// Owns the device-location request for the location picker's "locate me"
/// control. Holds the raw [LocationResult] so the permission overlay can
/// branch on the same outcomes as the map and feed tabs.
@riverpod
class LocationPickerLocation extends _$LocationPickerLocation {
  @override
  AsyncValue<LocationResult?> build() => const AsyncData(null);

  Future<void> locate() async {
    state = const AsyncLoading();

    final locationService = ref.read(locationServiceProvider);
    final result = await locationService.getCurrentLocation();
    if (!ref.mounted) return;

    state = AsyncData(result);
  }

  Future<void> openSettings() =>
      ref.read(locationServiceProvider).openSettings();
}
