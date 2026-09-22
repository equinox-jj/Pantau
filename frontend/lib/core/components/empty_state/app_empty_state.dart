import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../theme/theme.dart';

/// Icon medallion, headline and supporting copy, with an optional primary
/// action.
///
/// Empty states are a first-class screen state (NFR-8), so every list/map
/// surface renders this rather than a blank canvas.
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.action,
  });

  final IconData icon;
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.fillAccent,
                borderRadius: AppRadius.radiusXl,
                border: Border.all(color: AppColors.borderAccent),
              ),
              child: Icon(icon, size: 40, color: AppColors.accent),
            ),
            const Gap(AppSpacing.lg),
            Text(
              title,
              style: AppTypography.subheading,
              textAlign: TextAlign.center,
            ),
            const Gap(AppSpacing.xs2),
            Text(
              message,
              style: AppTypography.body,
              textAlign: TextAlign.center,
            ),
            if (action case final action?) ...[
              const Gap(AppSpacing.lg),
              action,
            ],
          ],
        ),
      ),
    );
  }
}
