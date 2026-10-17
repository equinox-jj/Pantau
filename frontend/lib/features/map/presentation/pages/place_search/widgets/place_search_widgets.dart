import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pantau/core/theme/theme.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';

/// Body of the place-search screen: idle, loading, error, empty, and data
/// states of a place search.
class PlaceSearchResults extends StatelessWidget {
  const PlaceSearchResults({
    super.key,
    required this.state,
    required this.onSelected,
    required this.onRetry,
  });

  /// Null before the first submit.
  final AsyncValue<List<Place>>? state;
  final ValueChanged<Place> onSelected;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      null => const _SearchMessage(
        icon: Icons.search,
        message: 'Ketik nama tempat, lalu tekan cari',
      ),
      AsyncLoading() => const _SearchMessage(
        icon: Icons.search,
        message: 'Mencari tempat…',
        isLoading: true,
      ),
      AsyncError() => _SearchMessage(
        icon: Icons.error_outline,
        message: 'Gagal mencari tempat',
        actionLabel: 'Coba lagi',
        onAction: onRetry,
      ),
      AsyncData(:final value) when value.isEmpty => const _SearchMessage(
        icon: Icons.location_off_outlined,
        message: 'Tempat tidak ditemukan',
      ),
      AsyncData(:final value) => _SearchResultList(
        places: value,
        onSelected: onSelected,
      ),
    };
  }
}

class _SearchResultList extends StatelessWidget {
  const _SearchResultList({required this.places, required this.onSelected});

  final List<Place> places;
  final ValueChanged<Place> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
      // Scrolling means reading the results — the keyboard only hides them.
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: places.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, color: AppColors.borderHairline),
      itemBuilder: (context, index) {
        final place = places[index];

        return _SearchResultTile(place: place, onTap: () => onSelected(place));
      },
    );
  }
}

class _SearchResultTile extends StatelessWidget {
  const _SearchResultTile({required this.place, required this.onTap});

  final Place place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2),
              child: Icon(
                Icons.place_outlined,
                size: AppIconSizes.md,
                color: AppColors.teal400,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.body.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (place.address.isNotEmpty)
                    Text(
                      place.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.label,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The non-list states: an icon, a line of copy, and an optional action,
/// pinned to the top so they sit right under the field.
class _SearchMessage extends StatelessWidget {
  const _SearchMessage({
    required this.icon,
    required this.message,
    this.isLoading = false,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String message;
  final bool isLoading;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            if (isLoading)
              const SizedBox(
                width: AppIconSizes.md,
                height: AppIconSizes.md,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(icon, size: AppIconSizes.md, color: AppColors.textSecondary),
            const SizedBox(width: AppSpacing.xs),
            Expanded(child: Text(message, style: AppTypography.body)),
            if (actionLabel != null && onAction != null)
              TextButton(onPressed: onAction, child: Text(actionLabel!)),
          ],
        ),
      ),
    );
  }
}
