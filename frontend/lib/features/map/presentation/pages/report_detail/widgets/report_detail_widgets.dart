import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/theme.dart';

/// Fills the box it is given; the hero owns the sizing and the clipping.
class ReportDetailPhoto extends StatefulWidget {
  const ReportDetailPhoto({super.key, required this.photoUrls});

  final List<String> photoUrls;

  @override
  State<ReportDetailPhoto> createState() => _ReportDetailPhotoState();
}

class _ReportDetailPhotoState extends State<ReportDetailPhoto> {
  final _pageController = PageController();
  int _page = 0;

  @override
  void didUpdateWidget(covariant ReportDetailPhoto oldWidget) {
    super.didUpdateWidget(oldWidget);

    // A refresh can hand back a shorter (or reordered) gallery than the one
    // the user was mid-swipe through; keep the dots and controller in sync
    // with it instead of pointing past the new photo count.
    if (_page != 0 && !listEquals(widget.photoUrls, oldWidget.photoUrls)) {
      _page = 0;
      if (_pageController.hasClients) _pageController.jumpToPage(0);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urls = widget.photoUrls;
    if (urls.isEmpty) {
      return const _PhotoFallback(label: 'No photo attached');
    }

    if (urls.length == 1) {
      return _NetworkPhoto(url: urls.first);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: urls.length,
          onPageChanged: (page) => setState(() => _page = page),
          itemBuilder: (context, index) => _NetworkPhoto(url: urls[index]),
        ),
        Positioned(
          bottom: AppSpacing.xs2,
          left: 0,
          right: 0,
          child: _PhotoDots(count: urls.length, activeIndex: _page),
        ),
      ],
    );
  }
}

class _NetworkPhoto extends StatelessWidget {
  const _NetworkPhoto({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return const _PhotoFallback(label: 'No photo attached');

    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : const ColoredBox(
              color: AppColors.surfaceRaised,
              child: Center(child: CircularProgressIndicator()),
            ),
      errorBuilder: (context, error, stackTrace) =>
          const _PhotoFallback(label: 'Photo unavailable'),
    );
  }
}

class _PhotoDots extends StatelessWidget {
  const _PhotoDots({required this.count, required this.activeIndex});

  final int count;
  final int activeIndex;

  static const double _dotSize = 6;
  static const double _activeDotWidth = 16;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? _activeDotWidth : _dotSize,
          height: _dotSize,
          decoration: BoxDecoration(
            color: AppColors.textPrimary.withValues(alpha: isActive ? 1 : 0.6),
            borderRadius: AppRadius.radiusFull,
          ),
        );
      }),
    );
  }
}

class _PhotoFallback extends StatelessWidget {
  const _PhotoFallback({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.surfaceRaised,
      child: Center(child: Text(label, style: AppTypography.body)),
    );
  }
}

/// Label/value line used for category, coordinates and timestamps.
class ReportDetailRow extends StatelessWidget {
  const ReportDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isMono = false,
  });

  final IconData icon;
  final String label;
  final String value;

  /// Coordinates and other data values use the mono face.
  final bool isMono;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppIconSizes.md, color: AppColors.textMuted),
        const Gap(AppSpacing.xs),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTypography.label),
              const Gap(2),
              Text(
                value,
                style: isMono
                    ? AppTypography.mono(color: AppColors.textPrimary)
                    : AppTypography.body.copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
