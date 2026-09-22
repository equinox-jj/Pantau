import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/theme.dart';
import '../../../auth/di/di.dart';

/// Reports / Resolved counts, straight from `GET /users/me` — the same call
/// that backs [ProfileIdentityCard], so opening Profile costs one round trip
/// rather than a second `GET /reports/mine`.
class ProfileStatsRow extends ConsumerWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Selected down to the two counts this row renders: a name/email/avatar
    // change (read by ProfileIdentityCard off the same provider) no longer
    // rebuilds this row too.
    final counts = ref.watch(
      currentUserProvider.select(
        (async) => async.whenData(
          (user) => (
            total: user?.reportsCount ?? 0,
            resolved: user?.resolvedCount ?? 0,
          ),
        ),
      ),
    );

    return switch (counts) {
      AsyncError() => _StatsError(
        onRetry: () => ref.invalidate(currentUserProvider),
      ),
      AsyncData(value: final counts) => _StatsTiles(
        total: counts.total,
        resolved: counts.resolved,
      ),
      _ => const Skeletonizer(child: _StatsTiles(total: 0, resolved: 0)),
    };
  }
}

class _StatsTiles extends StatelessWidget {
  const _StatsTiles({required this.total, required this.resolved});

  final int total;
  final int resolved;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatTile(value: '$total', label: 'Reports', tinted: false),
        ),
        const Gap(AppSpacing.xs),
        Expanded(
          child: _StatTile(value: '$resolved', label: 'Resolved', tinted: true),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    required this.tinted,
  });

  final String value;
  final String label;
  final bool tinted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tinted
            ? AppColors.statusResolved.withValues(alpha: 0.07)
            : AppColors.fillSubtle,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(
          color: tinted
              ? AppColors.statusResolved.withValues(alpha: 0.22)
              : AppColors.borderDefault,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.sm,
          horizontal: AppSpacing.xs2,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: AppTypography.heading.copyWith(
                fontSize: 22,
                color: tinted ? AppColors.statusResolved : null,
              ),
            ),
            const Gap(3),
            Text(label, style: AppTypography.label.copyWith(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

class _StatsError extends StatelessWidget {
  const _StatsError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fillSubtle,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Stats unavailable', style: AppTypography.body),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
