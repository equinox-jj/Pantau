import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/components/empty_state/empty_state.dart';
import '../../../../../../core/service/service.dart';
import '../../../../../../core/theme/theme.dart';
import '../provider/provider.dart';

/// Copy and recovery action for a permission-related map overlay.
typedef _PermissionOverlay = ({
  String title,
  String message,
  String actionText,
  VoidCallback onAction,
});

/// Full-screen cover shown when location access is unavailable.
///
/// Blocking is the point: without a position the map cannot centre, locate or
/// pin, so the cover hides the controls too — hence the last layer of the map
/// stack. Owns its subscription, so a location change repaints it alone.
class MapPermissionOverlay extends StatelessWidget {
  const MapPermissionOverlay({super.key});

  /// Every blocking [LocationResult] gets a designed state, not a silent
  /// fallback to the Jakarta camera with a passing snackbar.
  _PermissionOverlay? _overlayFor(WidgetRef ref, LocationResult? result) {
    return switch (result) {
      LocationPermissionDeniedForever() => (
        title: 'Location is switched off',
        message:
            'Pantau shows reports around you and pins new ones where you '
            'are. Enable location access to continue.',
        actionText: 'Open settings',
        onAction: () => ref.read(mapProvider.notifier).openSettings(),
      ),
      LocationPermissionDenied() => (
        title: 'Location permission needed',
        message:
            'Pantau needs your location to show reports around you and pin '
            'new ones where you are.',
        actionText: 'Try again',
        onAction: () => ref.read(mapProvider.notifier).locate(),
      ),
      LocationServiceDisabled() => (
        title: 'Location services are off',
        message:
            'Turn on location services in your device settings to see '
            'reports around you.',
        actionText: 'Try again',
        onAction: () => ref.read(mapProvider.notifier).locate(),
      ),
      LocationSuccess() || LocationFailed() || null => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final locationResult = ref.watch(
          mapProvider.select((state) => state.mapLocation.value),
        );
        final overlay = _overlayFor(ref, locationResult);
        if (overlay == null) return const SizedBox.shrink();

        return Positioned.fill(
          child: ColoredBox(
            color: AppColors.surfaceBase.withValues(alpha: 0.92),
            child: _MapPermissionState(
              title: overlay.title,
              message: overlay.message,
              actionText: overlay.actionText,
              onAction: overlay.onAction,
            ),
          ),
        );
      },
    );
  }
}

/// Shown instead of markers when location access is unavailable, explaining
/// why the app needs it and offering the matching recovery action.
class _MapPermissionState extends StatelessWidget {
  const _MapPermissionState({
    required this.title,
    required this.message,
    required this.actionText,
    required this.onAction,
  });

  final String title;
  final String message;
  final String actionText;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      icon: Icons.location_off_outlined,
      title: title,
      message: message,
      action: AppButton(
        text: actionText,
        fullWidth: false,
        onPressed: onAction,
      ),
    );
  }
}
