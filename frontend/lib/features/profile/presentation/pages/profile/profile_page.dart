import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../auth/di/di.dart';
import '../../../../report/presentation/pages/feed/provider/provider.dart';
import '../../widgets/profile_widgets.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';

/// Profile tab — identity, report stats, help and sign-out.
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: LogoutListener(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => Future.wait([
              ref.read(myReportsProvider.notifier).refresh(),
              ref.refresh(currentUserProvider.future),
            ]),
            backgroundColor: AppColors.surfaceRaised,
            color: AppColors.accent,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.xl2,
              ),
              children: [
                const ProfileIdentityCard(),
                const Gap(AppSpacing.md),
                const ProfileStatsRow(),
                const Gap(AppSpacing.md),
                const ProfileHelpCard(),
                const Gap(AppSpacing.xl),
                AppButton(
                  text: 'Sign out',
                  variant: AppButtonVariant.secondary,
                  leading: const Icon(Icons.logout),
                  onPressed: () => _confirmSignOut(context, ref),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text('You will need to sign in again to report.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Sign out'),
          ),
        ],
      ),
    );

    if (confirmed ?? false) await ref.read(logoutProvider.notifier).logout();
  }
}
