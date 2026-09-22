import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/error/error.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../provider/provider.dart';

/// "Status timeline" card: the reported → resolved loop, made visible.
///
/// Owns its own async state so a history failure degrades to an inline retry
/// instead of blanking the report.
class ReportStatusTimeline extends StatelessWidget {
  const ReportStatusTimeline({
    super.key,
    required this.reportId,
    required this.updatedAt,
  });

  final String reportId;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceRaised,
        borderRadius: AppRadius.radiusXl,
        border: Border.all(color: AppColors.borderHairline),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TimelineHeader(updatedAt: updatedAt),
          const Gap(AppSpacing.md),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(
                reportDetailProvider(reportId)
                    .select((state) => state.timeline),
              );

              return switch (state) {
                AsyncError<List<TimelineStep>>(error: final error) =>
                  _TimelineError(
                    error: error,
                    // The history is the only call this card makes; the
                    // timeline recomputes off the back of it.
                    onRetry: () => ref
                        .read(reportDetailProvider(reportId).notifier)
                        .reloadHistory(),
                  ),
                // A refetch keeps the previously loaded steps on screen;
                // only the first load has nothing to show yet and falls
                // back to the skeleton.
                AsyncValue<List<TimelineStep>>(isLoading: true, value: null) =>
                  const _TimelineSkeleton(),
                AsyncValue<List<TimelineStep>>(value: final steps?) =>
                  _TimelineSteps(steps: steps),
                _ => const _TimelineSkeleton(),
              };
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineHeader extends StatelessWidget {
  const _TimelineHeader({required this.updatedAt});

  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    final updated = updatedAt;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text('Status timeline', style: AppTypography.subheading),
        ),
        if (updated != null)
          Text(
            'updated ${formatRelativeAge(updated.toLocal())}',
            style: AppTypography.mono(
              fontSize: AppTypography.metaMonoSize,
              color: AppColors.textMuted,
            ),
          ),
      ],
    );
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({required this.steps});

  final List<TimelineStep> steps;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Fixed, short and inside a card — this list never scrolls on its own.
        for (var index = 0; index < steps.length; index++)
          _TimelineRow(step: steps[index], isLast: index == steps.length - 1),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.step, required this.isLast});

  final TimelineStep step;
  final bool isLast;

  static final _timeFormat = DateFormat('MMM d · HH:mm');

  /// Stroke width of the line connecting consecutive timeline nodes.
  static const double _connectorWidth = 2;

  /// Minimum length of the connector, so a short gap between two nodes
  /// still reads as a visible line rather than collapsing to a dot.
  static const double _connectorMinHeight = 16;

  /// Vertical margin around the connector, keeping it clear of the node
  /// circles immediately above and below it.
  static const double _connectorMargin = 4;

  /// Space between a step's label row and its optional note.
  static const double _noteGap = 4;

  Color get _labelColor => switch (step.state) {
    TimelineStepState.done => AppColors.textPrimary,
    TimelineStepState.current => step.status.color,
    TimelineStepState.future => AppColors.textMuted,
  };

  String get _time {
    final time = step.time;
    if (time == null) return 'Pending';

    return _timeFormat.format(time.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final note = step.note;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              _TimelineNode(status: step.status, state: step.state),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: _connectorWidth,
                    constraints: const BoxConstraints(
                      minHeight: _connectorMinHeight,
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: _connectorMargin,
                    ),
                    decoration: BoxDecoration(
                      color: step.state == TimelineStepState.done
                          ? step.status.color
                          : AppColors.borderDefault,
                      borderRadius: AppRadius.radiusXs,
                    ),
                  ),
                ),
            ],
          ),
          const Gap(AppSpacing.xs),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          step.status.label,
                          style: AppTypography.body.copyWith(
                            fontWeight: FontWeight.w700,
                            color: _labelColor,
                          ),
                        ),
                      ),
                      const Gap(AppSpacing.xs2),
                      Text(
                        _time,
                        style: AppTypography.mono(
                          fontSize: AppTypography.metaMonoSize,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                  if (note != null && note.isNotEmpty) ...[
                    const Gap(_noteGap),
                    Text(note, style: AppTypography.label),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Circle marking one step: a check when done, a filled dot for the current
/// state, a hollow ring for a step not yet reached.
class _TimelineNode extends StatelessWidget {
  const _TimelineNode({required this.status, required this.state});

  final ReportStatus status;
  final TimelineStepState state;

  /// Diameter of the timeline node circle.
  static const double _size = 30;

  /// Diameter of the filled dot marking the current step, inset within
  /// the node ring.
  static const double _currentDotSize = 9;

  /// Ring thickness for the node circle; heavier than a hairline so the
  /// status color reads clearly at a glance.
  static const double _borderWidth = 1.5;

  /// Opacity of the fill behind the "current" step, distinguishing it
  /// from "done" (solid fill) and "future" (no fill) without
  /// overpowering the dot drawn on top of it.
  static const double _currentTintAlpha = 0.18;

  @override
  Widget build(BuildContext context) {
    final isFuture = state == TimelineStepState.future;

    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switch (state) {
          TimelineStepState.done => status.color,
          TimelineStepState.current => status.color.withValues(
            alpha: _currentTintAlpha,
          ),
          TimelineStepState.future => AppColors.fillSubtle,
        },
        border: Border.all(
          color: isFuture ? AppColors.borderDefault : status.color,
          width: _borderWidth,
        ),
      ),
      child: switch (state) {
        TimelineStepState.done => Icon(
          status == ReportStatus.rejected ? Icons.close : Icons.check,
          size: AppIconSizes.sm,
          color: status.inkColor,
        ),
        TimelineStepState.current => Container(
          width: _currentDotSize,
          height: _currentDotSize,
          decoration: BoxDecoration(
            color: status.color,
            shape: BoxShape.circle,
          ),
        ),
        TimelineStepState.future => const SizedBox.shrink(),
      },
    );
  }
}

class _TimelineSkeleton extends StatelessWidget {
  const _TimelineSkeleton();

  /// Matches the canonical ladder, so the skeleton is the same height as the
  /// content that replaces it in the common case.
  static const int _placeholderCount = 4;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: _TimelineSteps(
        steps: List<TimelineStep>.generate(
          _placeholderCount,
          (index) => (
            status: ReportStatus.reported,
            time: DateTime.now(),
            note: 'Placeholder note for the loading state.',
            state: TimelineStepState.done,
          ),
        ),
      ),
    );
  }
}

/// The history call failed. Scoped to the card, so the rest of the report stays
/// readable; a compact variant of [AppEmptyState] rather than the full-screen
/// one, which would tower over the surrounding copy.
class _TimelineError extends StatelessWidget {
  const _TimelineError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  /// Side of the icon medallion — deliberately smaller than the 96 used by
  /// full-screen empty states.
  static const double _medallionSize = 48;

  /// Opacity of the medallion fill and border, tinting the card's own surface
  /// rather than introducing a new solid colour.
  static const double _medallionFillAlpha = 0.12;
  static const double _medallionBorderAlpha = 0.28;

  /// Vertical breathing room so the failure does not sit flush against the
  /// header, and the card keeps a card-like height.
  static const double _verticalPadding = AppSpacing.md;

  String get _message => switch (error) {
    final Failure failure => failure.displayMessage,
    // Anything that is not a mapped Failure is a bug, not something the
    // reader can act on — give them the recovery, not the stack.
    _ => 'Check your connection and try again.',
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Column(
        children: [
          Container(
            width: _medallionSize,
            height: _medallionSize,
            decoration: BoxDecoration(
              color: AppColors.statusRejected.withValues(
                alpha: _medallionFillAlpha,
              ),
              borderRadius: AppRadius.radiusLg,
              border: Border.all(
                color: AppColors.statusRejected.withValues(
                  alpha: _medallionBorderAlpha,
                ),
              ),
            ),
            child: const Icon(
              Icons.cloud_off,
              size: AppIconSizes.md,
              color: AppColors.statusRejected,
            ),
          ),
          const Gap(AppSpacing.sm),
          Text(
            "Couldn't load the timeline",
            style: AppTypography.body.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const Gap(AppSpacing.xs2),
          Text(
            _message,
            style: AppTypography.label,
            textAlign: TextAlign.center,
          ),
          const Gap(AppSpacing.md),
          AppButton(
            text: 'Try again',
            variant: AppButtonVariant.secondary,
            fullWidth: false,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
