import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../../../../domain/entity/resolver_entity.dart';

/// Segmented control switching the queue between its three tabs, each
/// labelled with its count from the most recent response.
class QueueTabSelector extends StatelessWidget {
  const QueueTabSelector({
    super.key,
    required this.currentTab,
    required this.counts,
    required this.onTabSelected,
  });

  final QueueTab currentTab;
  final QueueCounts? counts;
  final ValueChanged<QueueTab> onTabSelected;

  static const double _trackPadding = 4;
  static const double _segmentRadius = 10;
  static const double _segmentHeight = 38;

  int _countFor(QueueTab tab) => switch (tab) {
    QueueTab.open => counts?.open ?? 0,
    QueueTab.inProgress => counts?.inProgress ?? 0,
    QueueTab.resolved => counts?.resolved ?? 0,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_trackPadding),
      decoration: BoxDecoration(
        color: AppColors.fillSubtle,
        borderRadius: AppRadius.radiusMd,
        border: Border.all(color: AppColors.borderHairline),
      ),
      child: Row(
        children: [
          for (final tab in QueueTab.values)
            Expanded(
              child: _QueueTabSegment(
                tab: tab,
                count: _countFor(tab),
                isActive: tab == currentTab,
                onTap: () => onTabSelected(tab),
              ),
            ),
        ],
      ),
    );
  }
}

class _QueueTabSegment extends StatelessWidget {
  const _QueueTabSegment({
    required this.tab,
    required this.count,
    required this.isActive,
    required this.onTap,
  });

  final QueueTab tab;
  final int count;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isActive,
      label: '${tab.label}, $count',
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: QueueTabSelector._segmentHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.borderDefault : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(QueueTabSelector._segmentRadius),
            ),
            boxShadow: isActive ? AppShadows.segment : const [],
          ),
          child: Text(
            '${tab.label} · $count',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.label.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

/// One report in the queue: photo band with the status over it, then
/// category, distance, description and age.
///
/// Tapping opens the shared report-detail screen (`/reports/:id`), same
/// destination the citizen feed pushes to.
class QueueReportCard extends StatelessWidget {
  const QueueReportCard({super.key, required this.report, required this.onTap});

  final QueueReport report;
  final VoidCallback onTap;

  static const double _photoAspectRatio = 16 / 10;

  String get _title {
    final description = report.description?.trim();
    if (description != null && description.isNotEmpty) return description;

    return report.categoryName ?? 'Report';
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${report.status.label} · $_title',
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppRadius.radiusXl,
          boxShadow: AppShadows.card,
        ),
        child: Material(
          color: AppColors.surfaceRaised,
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.radiusXl,
            side: BorderSide(color: AppColors.borderHairline),
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AspectRatio(
                  aspectRatio: _photoAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _QueuePhoto(photoUrl: report.photoUrl),
                      Positioned(
                        top: AppSpacing.xs,
                        left: AppSpacing.xs,
                        child: _QueueStatusChip(status: report.status),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.sm,
                    AppSpacing.md,
                    AppSpacing.sm,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CardMetaRow(report: report),
                      const Gap(AppSpacing.xs2),
                      Text(
                        _title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.body.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Gap(AppSpacing.xs),
                      _CardFooter(createdAt: report.createdAt),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardMetaRow extends StatelessWidget {
  const _CardMetaRow({required this.report});

  final QueueReport report;

  @override
  Widget build(BuildContext context) {
    final distance = report.distanceMeter;

    return Row(
      children: [
        Flexible(child: _CategoryPill(label: report.categoryName)),
        if (distance != null) ...[
          const Gap(AppSpacing.xs2),
          Text(
            '${formatDistance(distance)} away',
            style: AppTypography.mono(fontSize: 11, color: AppColors.textMuted),
          ),
        ],
      ],
    );
  }
}

class _CardFooter extends StatelessWidget {
  const _CardFooter({required this.createdAt});

  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, size: 15, color: AppColors.textSecondary),
        const Gap(AppSpacing.xs2 - 1),
        Text(
          createdAt == null ? '—' : formatShortAge(createdAt!.toLocal()),
          style: AppTypography.body.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

class _CategoryPill extends StatelessWidget {
  const _CategoryPill({required this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.fillAccent,
        borderRadius: AppRadius.radiusFull,
        border: Border.all(color: AppColors.borderAccent),
      ),
      child: Text(
        label ?? 'Uncategorised',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTypography.label.copyWith(
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: AppColors.teal400,
        ),
      ),
    );
  }
}

class _QueueStatusChip extends StatelessWidget {
  const _QueueStatusChip({required this.status});

  final ReportStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceBase.withValues(alpha: 0.75),
        borderRadius: AppRadius.radiusFull,
        border: Border.all(color: status.color.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: AppIconSizes.sm, color: status.color),
          const Gap(AppSpacing.xs2 - 1),
          Text(
            status.label,
            style: AppTypography.label.copyWith(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}

class _QueuePhoto extends StatelessWidget {
  const _QueuePhoto({required this.photoUrl});

  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final url = photoUrl;
    if (url == null || url.isEmpty) {
      return const _PhotoFallback(label: 'No photo attached');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

        return Image.network(
          url,
          fit: BoxFit.cover,
          cacheWidth: (constraints.maxWidth * devicePixelRatio).round(),
          loadingBuilder: (context, child, progress) => progress == null
              ? child
              : const ColoredBox(color: AppColors.surfaceFloat),
          errorBuilder: (context, error, stackTrace) =>
              const _PhotoFallback(label: 'Photo unavailable'),
        );
      },
    );
  }
}

class _PhotoFallback extends StatelessWidget {
  const _PhotoFallback({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.surfaceFloat,
      child: Center(
        child: Text(
          label,
          style: AppTypography.mono(fontSize: 10.5, color: AppColors.textFaint),
        ),
      ),
    );
  }
}

/// Placeholder card for the first load, shaped like the real card.
///
/// Carries no `Skeletonizer` of its own — the list wraps the whole sliver in
/// one, so the shimmer runs off a single ticker instead of one per card.
class QueueSkeletonCard extends StatelessWidget {
  const QueueSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surfaceRaised,
        borderRadius: AppRadius.radiusXl,
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.borderHairline),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(
            aspectRatio: QueueReportCard._photoAspectRatio,
            child: Bone(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.xl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Bone.text(words: 2),
                const Gap(AppSpacing.xs2),
                const Bone.multiText(lines: 2),
                const Gap(AppSpacing.xs),
                Bone.text(width: context.screenWidth * 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
