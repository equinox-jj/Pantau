import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/enums/enums.dart';
import '../../../../../core/utils/helpers/helpers.dart';
import '../../../domain/entity/entity.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';
import 'widgets/widgets.dart';

/// Full-screen report detail: photo hero, the report's own copy, and the
/// status timeline (design 11).
///
/// [distanceInMeters] is handed over by the caller — the map and the feed both
/// already know where the device is — so this screen never asks for location
/// permission. A deep link arrives without it and simply omits the line.
class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({
    super.key,
    required this.reportId,
    this.distanceInMeters,
  });

  final String reportId;
  final double? distanceInMeters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceSunken,
      body: ReportStatusListener(
        reportId: reportId,
        child: Consumer(
          builder: (context, ref, _) {
            final state = ref.watch(
              reportDetailProvider(reportId).select((state) => state.detail),
            );

            return switch (state) {
              AsyncError<ReportDetail>(error: final error) => _DetailError(
                message: error is Failure
                    ? error.displayMessage
                    : error.toString(),
                onRetry: () =>
                    ref.read(reportDetailProvider(reportId).notifier).refresh(),
              ),
              // A refetch keeps the previously loaded report on screen; only
              // the first load has nothing to show yet and falls back to the
              // skeleton.
              AsyncValue<ReportDetail>(isLoading: true, value: null) =>
                const _DetailSkeleton(),
              AsyncValue<ReportDetail>(value: final detail?) => _DetailContent(
                reportId: reportId,
                detail: detail,
                distanceInMeters: distanceInMeters,
              ),
              _ => const _DetailSkeleton(),
            };
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.reportId,
    required this.detail,
    required this.distanceInMeters,
  });

  final String reportId;
  final ReportDetail detail;
  final double? distanceInMeters;

  static final _dateFormat = DateFormat('d MMM yyyy · HH:mm');

  Future<void> _refresh(WidgetRef ref) =>
      ref.read(reportDetailProvider(reportId).notifier).refresh();

  String get _coordinates {
    final latitude = detail.latitude;
    final longitude = detail.longitude;
    if (latitude == null || longitude == null) return '—';

    return '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
  }

  /// Plain text: the app has no deeplink host yet, so there is no URL to send.
  Future<void> _share() {
    final createdAt = detail.createdAt;
    final lines = <String>[
      detail.category?.name ?? 'Report',
      'Status: ${detail.status.label}',
      if (createdAt != null) 'Reported ${formatRelativeAge(createdAt)}',
      if (detail.latitude != null && detail.longitude != null)
        'Location: $_coordinates',
      'Report #$reportId',
    ];

    return SharePlus.instance.share(ShareParams(text: lines.join('\n')));
  }

  @override
  Widget build(BuildContext context) {
    final distance = distanceInMeters;
    final description = detail.description;
    final createdAt = detail.createdAt;

    return Consumer(
      builder: (context, ref, child) => RefreshIndicator(
        onRefresh: () => _refresh(ref),
        backgroundColor: AppColors.surfaceRaised,
        color: AppColors.accent,
        child: child!,
      ),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          ReportDetailHero(
            photoUrls: detail.photoUrls,
            status: detail.status,
            reportId: reportId,
            onShare: _share,
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.xl2,
            ),
            sliver: SliverList.list(
              children: [
                if (distance != null)
                  Text(
                    formatDistance(distance),
                    style: AppTypography.mono(color: AppColors.textMuted),
                  ),
                if (distance != null) const Gap(AppSpacing.xs2),
                Text(
                  detail.category?.name ?? 'Uncategorised',
                  style: AppTypography.title,
                ),
                if (description != null && description.isNotEmpty) ...[
                  const Gap(AppSpacing.xs2),
                  Text(description, style: AppTypography.bodyLarge),
                ],
                const Gap(AppSpacing.xs2),
                Text(
                  // The API never exposes reporter identity, so this is literal.
                  createdAt == null
                      ? 'anonymous'
                      : 'reported ${formatRelativeAge(createdAt.toLocal())} · anonymous',
                  style: AppTypography.mono(
                    fontSize: AppTypography.metaMonoSize,
                    color: AppColors.textMuted,
                  ),
                ),
                const Gap(AppSpacing.lg),
                ReportRejectionNote(reportId: reportId, status: detail.status),
                ReportStatusTimeline(
                  reportId: reportId,
                  updatedAt: detail.updatedAt,
                ),
                const Gap(AppSpacing.lg),
                ReportStatusActionPanel(
                  reportId: reportId,
                  status: detail.status,
                ),
                ReportResubmitButton(reportId: reportId, detail: detail),
                const Gap(AppSpacing.lg),
                ReportDetailRow(
                  icon: Icons.place_outlined,
                  label: 'Coordinates',
                  value: _coordinates,
                  isMono: true,
                ),
                const Gap(AppSpacing.md),
                ReportDetailRow(
                  icon: Icons.update,
                  label: 'Last updated',
                  value: detail.updatedAt == null
                      ? '—'
                      : _dateFormat.format(detail.updatedAt!.toLocal()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Loading state: the same shape as the loaded page, so nothing jumps when the
/// data lands.
///
/// Deliberately not `_DetailContent` with a stub report — that would mount
/// [ReportStatusTimeline] with a fake id and fire a request for a report that
/// does not exist. The timeline is a plain placeholder box here.
class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  /// Roughly a four-step timeline card.
  static const double _timelinePlaceholderHeight = 240;

  @override
  Widget build(BuildContext context) {
    // The hero carries the real back/share buttons, so it stays outside the
    // shimmer entirely — Skeletonizer's `ignorePointers` defaults to true and
    // would otherwise leave them hit-test dead for the length of the load.
    return CustomScrollView(
      slivers: [
        ReportDetailHero(
          photoUrls: const [],
          status: ReportStatus.reported,
          reportId: 'loading',
          onShare: () {},
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.md,
            AppSpacing.lg,
            AppSpacing.xl2,
          ),
          sliver: SliverToBoxAdapter(
            child: Skeletonizer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '120 m',
                    style: AppTypography.mono(color: AppColors.textMuted),
                  ),
                  const Gap(AppSpacing.xs2),
                  Text('Streetlight', style: AppTypography.title),
                  const Gap(AppSpacing.xs2),
                  Text(
                    'Placeholder description text while the report loads.',
                    style: AppTypography.bodyLarge,
                  ),
                  const Gap(AppSpacing.xs2),
                  Text(
                    'reported 2 hours ago · anonymous',
                    style: AppTypography.mono(
                      fontSize: AppTypography.metaMonoSize,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const Gap(AppSpacing.lg),
                  const Bone(
                    height: _timelinePlaceholderHeight,
                    width: double.infinity,
                    borderRadius: AppRadius.radiusXl,
                  ),
                  const Gap(AppSpacing.lg),
                  const ReportDetailRow(
                    icon: Icons.place_outlined,
                    label: 'Coordinates',
                    value: '0.00000, 0.00000',
                    isMono: true,
                  ),
                  const Gap(AppSpacing.md),
                  const ReportDetailRow(
                    icon: Icons.update,
                    label: 'Last updated',
                    value: '1 Jan 2026 · 00:00',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xs2),
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                color: AppColors.textPrimary,
                tooltip: 'Back',
                onPressed: () => context.canPop()
                    ? context.pop()
                    : context.go(AppRoutes.dashboard),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTypography.body,
                    ),
                    const Gap(AppSpacing.lg),
                    AppButton(
                      text: 'Try again',
                      fullWidth: false,
                      onPressed: onRetry,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
