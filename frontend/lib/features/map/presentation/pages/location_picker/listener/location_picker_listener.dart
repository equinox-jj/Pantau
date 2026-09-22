import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/service/service.dart';
import '../provider/provider.dart';

/// Side effect of a location attempt: hands every settled [LocationResult] to
/// the page so it can move the pin, and shows a snackbar for a transient
/// failure. Permission-related outcomes are covered by
/// `LocationPickerPermissionOverlay` instead of a toast here.
class LocationPickerListener extends ConsumerWidget {
  const LocationPickerListener({
    super.key,
    required this.onLocated,
    required this.child,
  });

  final ValueChanged<LocationResult> onLocated;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(locationPickerLocationProvider, (previous, next) {
      if (next case AsyncData(value: final result?)) {
        onLocated(result);

        if (result case LocationFailed()) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text(LocationFailed.message)));
        }
      }
    });

    return child;
  }
}
