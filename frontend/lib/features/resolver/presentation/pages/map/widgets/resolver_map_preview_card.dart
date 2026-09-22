import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../../../../domain/entity/resolver_entity.dart';
import '../provider/provider.dart';

/// Floating card shown when a marker is selected: status/meta, title, and
/// two actions. Renders nothing when nothing is selected.
class ResolverMapPreviewCard extends ConsumerWidget {
  const ResolverMapPreviewCard({super.key, required this.onOpenDetail});

  /// Pushes the shared detail screen and refreshes the map's report list
  /// (and this card's selection) on return — owned by the page since only
  /// it holds the tab/location context a refetch needs.
  final ValueChanged<QueueReport> onOpenDetail;

  String _titleFor(QueueReport report) {
    final description = report.description?.trim();
    if (description != null && description.isNotEmpty) return description;

    return report.categoryName ?? 'Report';
  }

  Future<void> _openDirections(BuildContext context, QueueReport report) async {
    final latitude = report.latitude;
    final longitude = report.longitude;
    if (latitude == null || longitude == null) return;

    final opened = await openMapsDirections(latitude, longitude);
    if (!context.mounted || opened) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text("Couldn't open a maps app.")),
      );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(
      resolverMapProvider.select((state) => state.selectedReport),
    );
    if (report == null) return const SizedBox.shrink();

    final status = report.status;

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: status.color.withValues(alpha: 0.12),
                  borderRadius: AppRadius.radiusFull,
                  border: Border.all(
                    color: status.color.withValues(alpha: 0.45),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      status.icon,
                      size: AppIconSizes.sm,
                      color: status.color,
                    ),
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
              ),
              if (report.distanceMeter case final distance?) ...[
                const Gap(AppSpacing.xs2),
                Text(
                  '${formatDistance(distance)} away',
                  style: AppTypography.mono(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ],
          ),
          const Gap(AppSpacing.sm),
          Text(
            _titleFor(report),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.body.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const Gap(AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'Advance status',
                  leading: const Icon(Icons.sync_alt),
                  onPressed: () => onOpenDetail(report),
                ),
              ),
              const Gap(AppSpacing.sm),
              _DirectionsButton(
                onPressed: () => _openDirections(context, report),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DirectionsButton extends StatelessWidget {
  const _DirectionsButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fillSubtle,
        borderRadius: AppRadius.radiusMd,
        border: Border.all(color: AppColors.borderHairline),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.directions_outlined,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
