import 'package:material_ui/material_ui.dart';

import 'package:pantau/core/theme/theme.dart';

/// Place-search entry above the map.
///
/// Not a text field: tapping it opens the full-screen search, so the results
/// never share the map with its floating controls. Shows the place the map
/// jumped to, or a hint when there is none.
class MapSearchBar extends StatelessWidget {
  const MapSearchBar({
    super.key,
    required this.placeName,
    required this.onTap,
    required this.onCleared,
  });

  /// The searched place, or null to show the hint.
  final String? placeName;

  final VoidCallback onTap;

  /// Fired by the clear button, shown only while [placeName] is set.
  final VoidCallback onCleared;

  /// Matches the app's text fields, and published so the top bar can stack
  /// against it without measuring.
  static const double height = AppSpacing.xl4;

  @override
  Widget build(BuildContext context) {
    final placeName = this.placeName;

    return DecoratedBox(
      // Opaque so the map never shows through; the shadow lifts it off the
      // tiles.
      decoration: BoxDecoration(
        color: AppColors.surfaceFloat,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderDefault),
        boxShadow: AppShadows.floating,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.radiusLg,
          child: SizedBox(
            height: height,
            child: Row(
              children: [
                const SizedBox(width: AppSpacing.xs),
                const Icon(
                  Icons.search,
                  size: AppIconSizes.md,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Text(
                    placeName ?? 'Cari tempat',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.body.copyWith(
                      fontSize: 15,
                      color: placeName == null
                          ? AppColors.textMuted
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
                if (placeName != null)
                  IconButton(
                    tooltip: 'Hapus pencarian',
                    onPressed: onCleared,
                    icon: const Icon(Icons.close, size: AppIconSizes.md),
                  )
                else
                  const SizedBox(width: AppSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
