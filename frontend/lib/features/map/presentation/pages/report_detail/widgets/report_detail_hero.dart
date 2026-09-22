import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/router/app_routes.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import 'report_detail_widgets.dart';

/// Photo hero for the report detail screen: the report's photo under a scrim,
/// with the back/share chrome and the status pill floating over it.
///
/// Pinned rather than floating so the back button survives a long scroll; the
/// photo collapses into a plain bar.
class ReportDetailHero extends StatelessWidget {
  const ReportDetailHero({
    super.key,
    required this.photoUrls,
    required this.status,
    required this.reportId,
    required this.onShare,
  });

  final List<String> photoUrls;
  final ReportStatus status;
  final String reportId;
  final VoidCallback onShare;

  /// Design 11: the hero is 246px tall before it collapses.
  static const double expandedHeight = 246;

  /// The scrim only needs to cover the lower third, where the status pill sits.
  static const double _scrimHeight = 90;

  /// Short, readable stand-in for the API's uuid — the design's `#PTU-2481`
  /// has no equivalent in the payload.
  String get _shortId => reportId.split('-').first.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      backgroundColor: AppColors.surfaceSunken,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: _HeroIconButton.size + AppSpacing.lg,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.lg),
        child: _HeroIconButton(
          icon: Icons.chevron_left,
          tooltip: 'Back',
          onPressed: () => context.canPop()
              ? context.pop()
              : context.go(AppRoutes.dashboard),
        ),
      ),
      title: _ReportIdPill(shortId: _shortId),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.lg),
          child: _HeroIconButton(
            icon: Icons.ios_share,
            tooltip: 'Share report',
            onPressed: onShare,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            ReportDetailPhoto(photoUrls: photoUrls),
            const Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(height: _scrimHeight, child: _HeroScrim()),
            ),
            Positioned(
              left: AppSpacing.lg,
              bottom: AppSpacing.sm,
              child: _ReportStatusPill(status: status),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom fade so the status pill stays readable over a bright photo.
class _HeroScrim extends StatelessWidget {
  const _HeroScrim();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.surfaceSunken],
        ),
      ),
    );
  }
}

/// Status as a translucent pill: dot + label + tinted border, legible over a
/// photo. Colour never carries the meaning alone (NFR-8).
class _ReportStatusPill extends StatelessWidget {
  const _ReportStatusPill({required this.status});

  final ReportStatus status;

  /// The design's status dot is a small 6px circle, not tied to a spacing
  /// token.
  static const double _dotSize = 6;

  /// One step tighter than `AppSpacing.xs2` (8) so the pill hugs its short
  /// label instead of reading as padded chrome.
  static const double _verticalPadding = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: _verticalPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceSunken.withValues(alpha: 0.75),
        borderRadius: AppRadius.radiusFull,
        border: Border.all(color: status.color.withValues(alpha: 0.32)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _dotSize,
            height: _dotSize,
            decoration: BoxDecoration(
              color: status.color,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(AppSpacing.xs2),
          Text(
            status.label,
            style: AppTypography.label.copyWith(
              fontWeight: FontWeight.w700,
              color: status.color,
            ),
          ),
        ],
      ),
    );
  }
}

/// 44×44 blurred glass button used for back and share.
class _HeroIconButton extends StatelessWidget {
  const _HeroIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  static const double size = AppSpacing.xl3;

  /// Backdrop blur sigma for the glass effect behind the icon.
  static const double _blur = 6;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.radiusMd,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _blur, sigmaY: _blur),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.surfaceSunken.withValues(alpha: 0.6),
            borderRadius: AppRadius.radiusMd,
            border: Border.all(color: AppColors.borderDefault),
          ),
          child: IconButton(
            icon: Icon(icon),
            iconSize: AppIconSizes.md,
            color: AppColors.textPrimary,
            tooltip: tooltip,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

/// Centre chrome: the report's identifier, in the data face.
class _ReportIdPill extends StatelessWidget {
  const _ReportIdPill({required this.shortId});

  final String shortId;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.radiusFull,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs2,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceSunken.withValues(alpha: 0.6),
          borderRadius: AppRadius.radiusFull,
          border: Border.all(color: AppColors.borderDefault),
        ),
        child: Text(
          'Report #$shortId',
          style: AppTypography.mono(fontSize: 11),
        ),
      ),
    );
  }
}
