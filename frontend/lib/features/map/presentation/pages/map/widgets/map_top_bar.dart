import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../domain/entity/entity.dart';
import '../../../provider/provider.dart';
import '../provider/provider.dart';
import 'map_search.dart';

/// The place-search field, and below it either the search results or the
/// category filter chips.
///
/// Owns the scrim and the safe area for both, so the strip fades into the map
/// as one surface.
class MapTopBar extends StatelessWidget {
  const MapTopBar({
    super.key,
    required this.onSearchSubmitted,
    required this.onSearchCleared,
    required this.onPlaceSelected,
  });

  /// The trimmed query from the keyboard's search action.
  final ValueChanged<String> onSearchSubmitted;

  /// Fired by the field's clear button.
  final VoidCallback onSearchCleared;

  final ValueChanged<Place> onPlaceSelected;

  /// Scrim below the content, so the bar fades out instead of ending on a
  /// hard edge.
  static const _scrimFade = AppSpacing.xl2;

  /// Height below the status bar, for anything the map stacks under the bar.
  /// Measured against the chip row, not the taller results panel.
  static const height =
      AppSpacing.xs2 +
      MapSearchField.height +
      AppSpacing.xs2 +
      _MapFilterBar.height +
      _scrimFade;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: DecoratedBox(
        decoration: const BoxDecoration(gradient: _scrim),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSpacing.xs2,
              bottom: _scrimFade,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: MapSearchField(
                    onSubmitted: onSearchSubmitted,
                    onCleared: onSearchCleared,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs2),
                _SearchResultsOrFilters(onPlaceSelected: onPlaceSelected),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Scrim behind the bar. Opaque only where the status bar text sits, then
/// stepped through partial alphas — a single hard stop to transparent read as
/// a dark slab under the search field.
const _scrim = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    AppColors.surfaceBase,
    Color(0xD9050C0B), // surfaceBase · .85
    Color(0x8C050C0B), // surfaceBase · .55
    Color(0x33050C0B), // surfaceBase · .2
    Colors.transparent,
  ],
  stops: [0, 0.35, 0.62, 0.82, 1],
);

/// The second row of the bar. Shows the results panel while a search is open
/// and the chips otherwise — never both, so nothing overlaps.
class _SearchResultsOrFilters extends StatelessWidget {
  const _SearchResultsOrFilters({required this.onPlaceSelected});

  final ValueChanged<Place> onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(
          mapProvider.select((state) => state.placeSearch),
        );
        // Null means the panel is closed; loading, failed, and empty searches
        // all still have something to show.
        if (state == null) return child!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: MapSearchResults(
            state: state,
            onSelected: onPlaceSelected,
            onRetry: () => ref.read(mapProvider.notifier).retrySearch(),
          ),
        );
      },
      child: const _MapFilterBar(),
    );
  }
}

/// The category filter chips across the top of the map (FR-10).
///
/// The "All" chip renders outside the taxonomy subscription, so the filter
/// stays clearable whatever the fetch is doing. Positioning, the scrim, and
/// the safe area belong to [MapTopBar].
class _MapFilterBar extends StatelessWidget {
  const _MapFilterBar();

  /// Row height, for anything the top bar stacks below the chips.
  static const height = _FilterChip._height;

  @override
  Widget build(BuildContext context) {
    return const _FilterChipRow();
  }
}

/// Horizontally scrolling chip strip. Never wraps — a second line would eat
/// the map.
class _FilterChipRow extends StatelessWidget {
  const _FilterChipRow();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Consumer(
        builder: (context, ref, _) {
          final selectedId = ref.watch(
            mapProvider.select((state) => state.categoryFilter),
          );
          final notifier = ref.read(mapProvider.notifier);

          return Row(
            children: [
              _FilterChip(
                label: 'All',
                isSelected: selectedId == null,
                onTap: notifier.clearCategory,
              ),
              const SizedBox(width: AppSpacing.xs2),
              _CategoryChips(
                selectedId: selectedId,
                onSelected: notifier.selectCategory,
              ),
            ],
          );
        },
      ),
    );
  }
}

/// The taxonomy-driven half of the row, with its own loading and error states.
class _CategoryChips extends StatelessWidget {
  const _CategoryChips({required this.selectedId, required this.onSelected});

  final int? selectedId;
  final ValueChanged<int> onSelected;

  /// Placeholders while the taxonomy loads — only their widths matter.
  static const _skeletonLabels = ['Pothole', 'Streetlight', 'Flooding'];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(reportCategoriesProvider);

        return switch (state) {
          AsyncLoading() => const _SkeletonChips(labels: _skeletonLabels),
          AsyncValue<List<ReportCategory>>(value: final categories?)
              when categories.any((category) => category.id != null) =>
            _CategoryChipList(
              categories: categories,
              selectedId: selectedId,
              onSelected: onSelected,
            ),
          // A failed fetch and an unusable taxonomy both leave nothing to
          // filter by, and both recover the same way.
          _ => _RetryChip(
            onTap: () => ref.invalidate(reportCategoriesProvider),
          ),
        };
      },
    );
  }
}

class _CategoryChipList extends StatelessWidget {
  const _CategoryChipList({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<ReportCategory> categories;
  final int? selectedId;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final usable = categories.where((category) => category.id != null);

    return Row(
      children: [
        for (final category in usable) ...[
          _FilterChip(
            label: category.name ?? '—',
            isSelected: category.id == selectedId,
            onTap: () => onSelected(category.id!),
          ),
          const SizedBox(width: AppSpacing.xs2),
        ],
      ],
    );
  }
}

class _SkeletonChips extends StatelessWidget {
  const _SkeletonChips({required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Row(
        children: [
          for (final label in labels) ...[
            _FilterChip(label: label, isSelected: false, onTap: () {}),
            const SizedBox(width: AppSpacing.xs2),
          ],
        ],
      ),
    );
  }
}

class _RetryChip extends StatelessWidget {
  const _RetryChip({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _FilterChip(
      label: 'Retry',
      isSelected: false,
      onTap: onTap,
      icon: Icons.refresh,
    );
  }
}

/// A single pill.
///
/// Not a Material [ChoiceChip]: the global chip theme fills with
/// `AppColors.fillSubtle` (4% white), invisible over map tiles.
class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData? icon;

  static const _height = 38.0;

  @override
  Widget build(BuildContext context) {
    final foreground = isSelected ? AppColors.teal400 : AppColors.textSecondary;

    return Material(
      // Opaque so the map never shows through the pill.
      color: isSelected
          ? Color.alphaBlend(AppColors.fillAccent, AppColors.surfaceFloat)
          : AppColors.surfaceFloat,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.radiusFull,
        side: BorderSide(
          color: isSelected ? AppColors.borderAccent : AppColors.borderDefault,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: _height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: AppIconSizes.sm, color: foreground),
                  const SizedBox(width: AppSpacing.xs2 / 2),
                ],
                Text(
                  label,
                  style: AppTypography.body.copyWith(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: foreground,
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
