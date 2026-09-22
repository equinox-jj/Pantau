import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/core_di.dart';
import '../../../../core/service/service.dart';

part 'resolver_location_notifier.g.dart';

/// Owns the device-location request shared by every resolver tab that needs
/// "reports around me" (Queue, Map). One fetch feeds both — a resolver
/// switching tabs should not trigger a second GPS request for the same
/// purpose. Each consuming page's own listener turns a successful fix into
/// its own load call and every other outcome into its own designed state.
@riverpod
class ResolverLocation extends _$ResolverLocation {
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
