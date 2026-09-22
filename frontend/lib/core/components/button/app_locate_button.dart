import 'package:material_ui/material_ui.dart';

import '../../theme/theme.dart';

/// Floating square button that recentres a map on the device position.
///
/// Shared by the map tab and the compose flow's location picker.
class AppLocateButton extends StatelessWidget {
  const AppLocateButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceFloat,
        borderRadius: AppRadius.radiusMd,
        border: Border.all(color: AppColors.borderDefault),
        boxShadow: AppShadows.floating,
      ),
      child: IconButton(
        tooltip: 'Use my location',
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
                width: AppIconSizes.md,
                height: AppIconSizes.md,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.my_location, size: AppIconSizes.lg),
      ),
    );
  }
}
