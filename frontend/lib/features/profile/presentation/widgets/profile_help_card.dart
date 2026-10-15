import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/theme.dart';
import 'profile_icon_badge.dart';

/// Single row that opens a static contact dialog. No backend, no
/// dependency — the app has no support ticketing or `url_launcher`.
class ProfileHelpCard extends StatelessWidget {
  const ProfileHelpCard({super.key});

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
          onTap: () => _showHelpDialog(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm + 3,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                const ProfileIconBadge(icon: Icons.help_outline),
                const Gap(AppSpacing.xs),
                Expanded(
                  child: Text(
                    'Help & feedback',
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

  void _showHelpDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceRaised,
        title: Text('Help & feedback', style: AppTypography.subheading),
        content: SelectableText(
          'Found a bug or have feedback? Reach out at '
          'joshua.jeremia1@gmail.com — every report helps.',
          style: AppTypography.body,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
