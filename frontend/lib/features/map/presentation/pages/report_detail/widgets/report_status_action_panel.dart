import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/components/textfield/textfield.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../provider/provider.dart';

/// Valid next statuses for [current] in the fixed pipeline a resolver may
/// advance a report through. An empty list means the report is in a
/// terminal state and [ReportStatusActionPanel] renders nothing.
List<ReportStatus> nextStatusesFor(ReportStatus current) => switch (current) {
  ReportStatus.reported => const [
    ReportStatus.acknowledged,
    ReportStatus.rejected,
  ],
  ReportStatus.acknowledged => const [
    ReportStatus.inProgress,
    ReportStatus.rejected,
  ],
  ReportStatus.inProgress => const [
    ReportStatus.resolved,
    ReportStatus.rejected,
  ],
  ReportStatus.resolved => const [ReportStatus.closed],
  ReportStatus.closed => const [],
  ReportStatus.rejected => const [],
  ReportStatus.unknown => const [],
};

/// Resolver-only "advance status" card, shown below the read-only timeline.
/// Renders nothing for a citizen viewer or once the report has reached a
/// terminal status.
class ReportStatusActionPanel extends StatelessWidget {
  const ReportStatusActionPanel({
    super.key,
    required this.reportId,
    required this.status,
  });

  final String reportId;
  final ReportStatus status;

  @override
  Widget build(BuildContext context) {
    final next = nextStatusesFor(status);
    if (next.isEmpty) return const SizedBox.shrink();

    return Consumer(
      builder: (context, ref, _) {
        final isResolver =
            ref.watch(
              reportDetailProvider(reportId)
                  .select((state) => state.isResolver.value),
            ) ??
            false;
        if (!isResolver) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surfaceRaised,
            borderRadius: AppRadius.radiusXl,
            border: Border.all(color: AppColors.borderHairline),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Update status', style: AppTypography.subheading),
              const Gap(AppSpacing.sm),
              AppButton(
                text: 'Change status',
                variant: AppButtonVariant.secondary,
                leading: const Icon(Icons.sync_alt),
                onPressed: () => _StatusUpdateSheet.show(
                  context,
                  reportId: reportId,
                  options: next,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Bottom sheet listing [options] as radio-style rows, plus an optional
/// note. Confirm calls [UpdateStatus.submit] and closes itself once that
/// call lands with data — the page-level `ReportStatusListener` (separate
/// widget) owns the resulting snackbar/refetch, this sheet only owns its own
/// dismissal.
class _StatusUpdateSheet extends ConsumerStatefulWidget {
  const _StatusUpdateSheet({required this.reportId, required this.options});

  final String reportId;
  final List<ReportStatus> options;

  static Future<void> show(
    BuildContext context, {
    required String reportId,
    required List<ReportStatus> options,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) =>
          _StatusUpdateSheet(reportId: reportId, options: options),
    );
  }

  @override
  ConsumerState<_StatusUpdateSheet> createState() => _StatusUpdateSheetState();
}

class _StatusUpdateSheetState extends ConsumerState<_StatusUpdateSheet> {
  ReportStatus? _selected;
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _confirm() {
    final selected = _selected;
    if (selected == null) return;

    final note = _noteController.text.trim();
    ref
        .read(reportDetailProvider(widget.reportId).notifier)
        .submitStatus(toStatus: selected, note: note.isEmpty ? null : note);
  }

  @override
  Widget build(BuildContext context) {
    // Closes the sheet on the transition into a successful submission. Does
    // not fire on first build even if a previous submission already left
    // `updateStatus` holding data — `ref.listen` only calls back on a
    // *change*, and this notifier is autodispose, so a fresh sheet always
    // starts from whatever state a still-mounted page left behind, which is
    // only ever non-null right after this exact callback already popped it.
    ref.listen(
      reportDetailProvider(widget.reportId)
          .select((state) => state.updateStatus),
      (previous, next) {
        if (next case AsyncData(value: final report?)) {
          if (report.id != null && Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
      },
    );

    final isSubmitting = ref.watch(
      reportDetailProvider(widget.reportId)
          .select((state) => state.updateStatus.isLoading),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        MediaQuery.viewInsetsOf(context).bottom + AppSpacing.lg,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change status',
              style: AppTypography.title.copyWith(fontSize: 20),
            ),
            const Gap(AppSpacing.md),
            for (final option in widget.options)
              _StatusOptionTile(
                status: option,
                isSelected: option == _selected,
                onTap: () => setState(() => _selected = option),
              ),
            const Gap(AppSpacing.md),
            AppTextField(
              controller: _noteController,
              labelText: 'Note (optional)',
              hintText: 'Add context for this change',
              maxLines: 3,
              maxLength: 1000,
            ),
            const Gap(AppSpacing.lg),
            AppButton(
              text: 'Confirm',
              isLoading: isSubmitting,
              onPressed: _selected == null ? null : _confirm,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusOptionTile extends StatelessWidget {
  const _StatusOptionTile({
    required this.status,
    required this.isSelected,
    required this.onTap,
  });

  final ReportStatus status;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Material(
        color: isSelected
            ? status.color.withValues(alpha: 0.12)
            : AppColors.fillSubtle,
        borderRadius: AppRadius.radiusLg,
        child: InkWell(
          borderRadius: AppRadius.radiusLg,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              borderRadius: AppRadius.radiusLg,
              border: Border.all(
                color: isSelected ? status.color : AppColors.borderHairline,
              ),
            ),
            child: Row(
              children: [
                Icon(status.icon, color: status.color, size: AppIconSizes.md),
                const Gap(AppSpacing.sm),
                Expanded(
                  child: Text(
                    status.label,
                    style: AppTypography.body.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? status.color : AppColors.textMuted,
                  size: AppIconSizes.md,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
