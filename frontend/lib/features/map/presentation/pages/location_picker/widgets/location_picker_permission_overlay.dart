import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/components/empty_state/empty_state.dart';
import '../../../../../../core/service/service.dart';
import '../../../../../../core/theme/theme.dart';
import '../provider/provider.dart';

/// Copy and recovery action for a permission-related picker overlay.
typedef _PermissionOverlay = ({
  String title,
  String message,
  String actionText,
  VoidCallback onAction,
});

/// Full-screen cover shown when location access is unavailable.
///
/// Mirrors `MapPermissionOverlay`: the picker's "locate me" control is
/// useless without a position, so the cover blocks it and the map underneath
/// rather than leaving the failure to a passing snackbar. Owns its
/// subscription, so a location change repaints it alone.
class LocationPickerPermissionOverlay extends StatelessWidget {
  const LocationPickerPermissionOverlay({super.key});

  /// Every blocking [LocationResult] gets a designed state, not a silent
  /// fallback to the Jakarta pin with a passing snackbar.
  _PermissionOverlay? _overlayFor(WidgetRef ref, LocationResult? result) {
    return switch (result) {
      LocationPermissionDeniedForever() => (
        title: 'Location is switched off',
        message:
            'Pantau uses your location to start the pin where you are. '
            'Enable location access to continue.',
        actionText: 'Open settings',
        onAction: () =>
            ref.read(locationPickerLocationProvider.notifier).openSettings(),
      ),
      LocationPermissionDenied() => (
        title: 'Location permission needed',
        message: 'Pantau needs your location to start the pin where you are.',
        actionText: 'Try again',
        onAction: () =>
            ref.read(locationPickerLocationProvider.notifier).locate(),
      ),
      LocationServiceDisabled() => (
        title: 'Location services are off',
        message:
            'Turn on location services in your device settings to start '
            'the pin where you are.',
        actionText: 'Try again',
        onAction: () =>
            ref.read(locationPickerLocationProvider.notifier).locate(),
      ),
      LocationSuccess() || LocationFailed() || null => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final locationResult = ref.watch(
          locationPickerLocationProvider.select((state) => state.value),
        );
        final overlay = _overlayFor(ref, locationResult);
        if (overlay == null) return const SizedBox.shrink();

        return Positioned.fill(
          child: ColoredBox(
            color: AppColors.surfaceBase.withValues(alpha: 0.92),
            child: AppEmptyState(
              icon: Icons.location_off_outlined,
              title: overlay.title,
              message: overlay.message,
              action: AppButton(
                text: overlay.actionText,
                fullWidth: false,
                onPressed: overlay.onAction,
              ),
            ),
          ),
        );
      },
    );
  }
}
