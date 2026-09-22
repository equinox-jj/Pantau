import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../provider/provider.dart';

/// Resolver's rejection note (design 21), surfaced as its own callout above
/// the status timeline rather than buried inside a timeline row — the one
/// piece of context a reporter actually needs to read after a rejection.
///
/// Renders nothing for any other status, and nothing while the timeline is
/// still loading or came back without a note; the timeline card below
/// already owns the loading/error affordance for that same data.
class ReportRejectionNote extends StatelessWidget {
  const ReportRejectionNote({
    super.key,
    required this.reportId,
    required this.status,
  });

  final String reportId;
  final ReportStatus status;

  @override
  Widget build(BuildContext context) {
    if (status != ReportStatus.rejected) return const SizedBox.shrink();

    return Consumer(
      builder: (context, ref, _) {
        final steps = ref.watch(
          reportDetailProvider(reportId)
              .select((state) => state.timeline.value),
        );
        // The rejected entry is always the last step — rejected leaves the
        // ladder, so no future steps are appended after it.
        final note = (steps != null && steps.isNotEmpty)
            ? steps.last.note
            : null;
        if (note == null || note.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.statusRejected.withValues(alpha: 0.07),
              borderRadius: AppRadius.radiusXl,
              border: Border.all(
                color: AppColors.statusRejected.withValues(alpha: 0.25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: AppIconSizes.sm,
                      color: AppColors.statusRejected,
                    ),
                    const Gap(AppSpacing.xs2),
                    Text(
                      'Resolver note',
                      style: AppTypography.label.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.statusRejected,
                      ),
                    ),
                  ],
                ),
                const Gap(AppSpacing.xs2),
                Text(
                  note,
                  style: AppTypography.body.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
