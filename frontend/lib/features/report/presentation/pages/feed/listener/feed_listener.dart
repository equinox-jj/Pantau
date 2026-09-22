import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/error/error.dart';
import '../../../../../../core/service/service.dart';
import '../../../../../../core/theme/theme.dart';
import '../provider/provider.dart';

/// Side effects of the feed tab: the location-to-fetch handoff, a snackbar
/// when a fetch fails, and the settings dialog for a permanent denial.
///
/// Blocking permission outcomes are rendered by the page itself, so this
/// listener only speaks up where a state alone would be silent.
class FeedListener extends ConsumerWidget {
  const FeedListener({super.key, required this.onLocated, required this.child});

  /// Called with every settled [LocationResult]; the page turns a success into
  /// a fetch.
  final ValueChanged<LocationResult> onLocated;

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(feedProvider.select((state) => state.nearbyReports), (
      previous,
      next,
    ) {
      if (next case AsyncError(error: final error)) {
        final message = error is Failure
            ? error.displayMessage
            : error.toString();

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

    ref.listen(feedProvider.select((state) => state.location), (
      previous,
      next,
    ) {
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
          'The feed shows what has been reported around you. Enable location '
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
              ref.read(feedProvider.notifier).openSettings();
            },
            child: const Text('Open settings'),
          ),
        ],
      ),
    );
  }
}
