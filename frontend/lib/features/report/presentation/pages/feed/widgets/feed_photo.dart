import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/theme.dart';

/// Only the first photo shows — a card in a vertically scrolling list
/// shouldn't add its own horizontal swipe gesture. When there's more than
/// one, a count badge signals that the full gallery is one tap away on the
/// report detail page.
class FeedPhoto extends StatelessWidget {
  const FeedPhoto({super.key, required this.photoUrls});

  final List<String> photoUrls;

  @override
  Widget build(BuildContext context) {
    if (photoUrls.isEmpty) {
      return const _PhotoFallback(label: 'No photo attached');
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        _NetworkFeedPhoto(url: photoUrls.first),
        if (photoUrls.length > 1)
          Positioned(
            top: AppSpacing.xs,
            right: AppSpacing.xs,
            child: _PhotoCountBadge(count: photoUrls.length),
          ),
      ],
    );
  }
}

class _NetworkFeedPhoto extends StatelessWidget {
  const _NetworkFeedPhoto({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return const _PhotoFallback(label: 'No photo attached');

    // Reporter photos come straight off a phone camera, so decoding them at
    // their native size would cost tens of megabytes per card and thrash the
    // image cache on a list this long. Decode to the band's own pixel width.
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

class _PhotoCountBadge extends StatelessWidget {
  const _PhotoCountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs2,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceBase.withValues(alpha: 0.75),
        borderRadius: AppRadius.radiusFull,
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.photo_library_outlined,
            size: AppIconSizes.sm,
            color: AppColors.textPrimary,
          ),
          const Gap(AppSpacing.xs2 - 2),
          Text(
            '$count',
            style: AppTypography.label.copyWith(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
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
