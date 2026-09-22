import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/textfield/textfield.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../domain/entity/entity.dart';

/// Place-search input above the map.
///
/// Submit-driven, not reactive: [onSubmitted] fires on the keyboard's search
/// action, so one search is one request to the geocoder.
class MapSearchField extends StatefulWidget {
  const MapSearchField({
    super.key,
    required this.onSubmitted,
    required this.onCleared,
  });

  /// The trimmed query. Never called with an empty string.
  final ValueChanged<String> onSubmitted;

  /// Fired by the clear button — drops both the results panel and the pin.
  final VoidCallback onCleared;

  /// Height [AppTextField] settles at under the app's input theme, published
  /// so the top bar can stack against it without measuring.
  static const double height = AppSpacing.xl4;

  @override
  State<MapSearchField> createState() => _MapSearchFieldState();
}

class _MapSearchFieldState extends State<MapSearchField> {
  final TextEditingController _controller = TextEditingController();

  /// Held in state rather than read from the controller, so the trailing icon
  /// swaps as the user types.
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_handleTextChanged)
      ..dispose();
    super.dispose();
  }

  void _handleTextChanged() {
    final hasText = _controller.text.trim().isNotEmpty;
    if (hasText == _hasText) return;

    setState(() => _hasText = hasText);
  }

  void _handleSubmitted(String value) {
    final query = value.trim();
    if (query.isEmpty) return;

    widget.onSubmitted(query);
  }

  void _handleClear() {
    _controller.clear();
    FocusScope.of(context).unfocus();
    widget.onCleared();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // The field's own fill is translucent, so the map would show through.
      // This opaque plate also carries the shadow lifting it off the tiles.
      decoration: const BoxDecoration(
        color: AppColors.surfaceFloat,
        borderRadius: AppRadius.radiusLg,
        boxShadow: AppShadows.floating,
      ),
      child: AppTextField(
        controller: _controller,
        hintText: 'Cari tempat',
        prefixIcon: Icons.search,
        suffixIcon: _hasText ? Icons.close : null,
        onSuffixIconTap: _handleClear,
        suffixIconTooltip: 'Hapus pencarian',
        textInputAction: TextInputAction.search,
        onFieldSubmitted: _handleSubmitted,
      ),
    );
  }
}

/// Result panel under the search field: loading, error, empty, and data
/// states of a place search.
///
/// Replaces the category chips while a search is active rather than floating
/// over them, so the two never fight for the same strip of map.
class MapSearchResults extends StatelessWidget {
  const MapSearchResults({
    super.key,
    required this.state,
    required this.onSelected,
    required this.onRetry,
  });

  final AsyncValue<List<Place>> state;
  final ValueChanged<Place> onSelected;
  final VoidCallback onRetry;

  /// Caps the panel so a full result set cannot swallow the map.
  static const double _maxHeight = 280;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: _maxHeight),
      decoration: BoxDecoration(
        color: AppColors.surfaceFloat,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderDefault),
        boxShadow: AppShadows.floating,
      ),
      clipBehavior: Clip.antiAlias,
      child: switch (state) {
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
      },
    );
  }
}

class _SearchResultList extends StatelessWidget {
  const _SearchResultList({required this.places, required this.onSelected});

  final List<Place> places;
  final ValueChanged<Place> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
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

/// The non-list states: a centred icon, a line of copy, and an optional
/// action.
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
    return Padding(
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
    );
  }
}
