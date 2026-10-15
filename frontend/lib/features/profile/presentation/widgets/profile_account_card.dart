import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/theme.dart';
import 'profile_icon_badge.dart';

/// Account actions: currently just "Change password".
class ProfileAccountCard extends StatelessWidget {
  const ProfileAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceRaised,
        borderRadius: AppRadius.radiusXl,
        border: Border.all(color: AppColors.borderHairline),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppRadius.radiusXl,
          onTap: () => context.push(AppRoutes.changePassword),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm + 3,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                const ProfileIconBadge(icon: Icons.lock_outline),
                const Gap(AppSpacing.xs),
                Expanded(
                  child: Text(
                    'Change password',
                    style: AppTypography.subheading,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.textMuted,
                  size: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
