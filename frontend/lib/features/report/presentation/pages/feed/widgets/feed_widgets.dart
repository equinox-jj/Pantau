import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../provider/provider.dart';
import 'feed_photo.dart';

/// Segmented control switching the feed between nearby reports and the
/// caller's own.
///
/// Both segments stay visible and labelled — the inactive one is a lower
/// contrast, never a hidden affordance.
class FeedTabSelector extends StatelessWidget {
  const FeedTabSelector({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final FeedTab currentTab;
  final ValueChanged<FeedTab> onTabSelected;

  /// Track pad and segment radius are one step tighter than the tokens either
  /// side of them, so both are spelled out here rather than rounded to a token.
  static const double _trackPadding = 4;
  static const double _segmentRadius = 10;
  static const double _segmentHeight = 38;

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
          for (final tab in FeedTab.values)
            Expanded(
              child: _FeedTabSegment(
                tab: tab,
                isActive: tab == currentTab,
                onTap: () => onTabSelected(tab),
              ),
            ),
        ],
      ),
    );
  }
}

class _FeedTabSegment extends StatelessWidget {
  const _FeedTabSegment({
    required this.tab,
    required this.isActive,
    required this.onTap,
  });

  final FeedTab tab;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isActive,
      label: tab.label,
      child: GestureDetector(
        onTap: onTap,
        // The gaps between the two segments must take the tap too, otherwise
        // the track has dead strips down its middle.
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: FeedTabSelector._segmentHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? AppColors.borderDefault : Colors.transparent,
            borderRadius: const BorderRadius.all(
              Radius.circular(FeedTabSelector._segmentRadius),
            ),
            boxShadow: isActive ? AppShadows.segment : const [],
          ),
          child: Text(
            tab.label,
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

/// One report in the feed: photo band with the status over it, then category,
/// distance, description and age.
///
/// Photo-led by design — the reporter's photo is the hero of a report — but it
/// degrades to a labelled placeholder when the payload carries no URL.
class FeedReportCard extends StatelessWidget {
  const FeedReportCard({super.key, required this.item, required this.onTap});

  final FeedItem item;
  final VoidCallback onTap;

  static const double _photoAspectRatio = 16 / 10;

  String get _title {
    final description = item.report.description?.trim();
    if (description != null && description.isNotEmpty) return description;

    // Without a description the category is the most specific thing known.
    return item.report.categoryName ?? 'Report';
  }

  @override
  Widget build(BuildContext context) {
    final report = item.report;
    final title = _title;

    return Semantics(
      button: true,
      label: '${report.status.label} · $title',
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
                      FeedPhoto(photoUrls: report.photoUrls),
                      Positioned(
                        top: AppSpacing.xs,
                        left: AppSpacing.xs,
                        child: FeedStatusChip(status: report.status),
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
                      _CardMetaRow(item: item),
                      const Gap(AppSpacing.xs2),
                      Text(
                        title,
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

/// Category pill and the distance from the device, side by side.
class _CardMetaRow extends StatelessWidget {
  const _CardMetaRow({required this.item});

  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    final distance = item.distanceInMeters;

    return Row(
      children: [
        Flexible(child: _CategoryPill(label: item.report.categoryName)),
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

/// Age of the report, and the affordance that the card opens something.
class _CardFooter extends StatelessWidget {
  const _CardFooter({required this.createdAt});

  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.schedule,
              size: 15,
              color: AppColors.textSecondary,
            ),
            const Gap(AppSpacing.xs2 - 1),
            Text(
              createdAt == null ? '—' : formatShortAge(createdAt!.toLocal()),
              style: AppTypography.body.copyWith(fontSize: 12),
            ),
          ],
        ),
        const Icon(
          Icons.chevron_right,
          size: AppIconSizes.md,
          color: AppColors.textMuted,
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

/// Status pill sitting over the photo: dark glass so it reads on any image,
/// tinted by the status and always carrying its icon and label (NFR-8).
class FeedStatusChip extends StatelessWidget {
  const FeedStatusChip({super.key, required this.status});

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

/// Placeholder cards for the first load.
///
/// Shaped like the real card so the list does not reflow when the data lands.
///
/// Carries no [Skeletonizer] of its own — the list wraps the whole sliver in
/// one, so the shimmer runs off a single ticker instead of one per card.
class FeedSkeletonCard extends StatelessWidget {
  const FeedSkeletonCard({super.key});

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
            aspectRatio: FeedReportCard._photoAspectRatio,
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
