import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/service/location_service.dart';
import 'package:pantau/core/theme/theme.dart';
import 'package:pantau/features/resolver/presentation/provider/resolver_location_notifier.dart';
import 'package:pantau/features/resolver/presentation/pages/queue/provider/queue_notifier.dart';

/// Side effects of the queue tab: the location-to-fetch handoff, a snackbar
/// when a fetch fails, and the settings dialog for a permanent denial.
class QueueListener extends ConsumerWidget {
  const QueueListener({
    super.key,
    required this.onLocated,
    required this.child,
  });

  /// Called with every settled [LocationResult]; the page turns a success
  /// into a fetch.
  final ValueChanged<LocationResult> onLocated;

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(queueProvider.select((state) => state.queue), (previous, next) {
      if (next case AsyncError(error: final error)) {
        final message = displayMessageOf(error);

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              backgroundColor: AppColors.statusRejected,
              content: Text(message),
            ),
          );
      }
    });

    ref.listen(resolverLocationProvider, (previous, next) {
      if (next case AsyncData(value: final result?)) {
        onLocated(result);

        if (result is LocationPermissionDeniedForever) {
          _showSettingsDialog(context, ref);
        }
      }
    });

    return child;
  }

  void _showSettingsDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Location permission needed'),
        content: const Text(
          'The queue shows what needs attention around you. Enable location '
          'access in Settings to see it.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Not now'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              ref.read(resolverLocationProvider.notifier).openSettings();
            },
            child: const Text('Open settings'),
          ),
        ],
      ),
    );
  }
}
