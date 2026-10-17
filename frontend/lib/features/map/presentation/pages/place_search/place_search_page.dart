import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:pantau/core/components/textfield/app_text_field.dart';
import 'package:pantau/core/theme/theme.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/presentation/pages/place_search/provider/place_search_notifier.dart';
import 'package:pantau/features/map/presentation/pages/place_search/widgets/place_search_widgets.dart';

/// Full-screen place search, pushed from a map's search bar.
///
/// Pops the chosen [Place], or nothing when the user backs out. A screen of
/// its own rather than a panel over the map, so the map's floating controls
/// can never cover the results.
class PlaceSearchPage extends ConsumerStatefulWidget {
  const PlaceSearchPage({super.key, this.viewBox, this.initialQuery});

  /// Bias for every search run from this screen.
  final PlaceViewBox? viewBox;

  /// Text the field opens with.
  final String? initialQuery;

  @override
  ConsumerState<PlaceSearchPage> createState() => _PlaceSearchPageState();
}

class _PlaceSearchPageState extends ConsumerState<PlaceSearchPage> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialQuery,
  );

  /// Held in state rather than read from the controller, so the trailing icon
  /// swaps as the user types.
  late bool _hasText = _controller.text.trim().isNotEmpty;

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

    ref
        .read(placeSearchProvider.notifier)
        .search(query, viewBox: widget.viewBox);
  }

  /// Empties the field but keeps the keyboard up — clearing is the first step
  /// of typing something else.
  void _handleClear() {
    _controller.clear();
    ref.read(placeSearchProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.xs2,
                AppSpacing.xs2,
                AppSpacing.md,
                AppSpacing.xs2,
              ),
              child: Row(
                children: [
                  const BackButton(),
                  const SizedBox(width: AppSpacing.xs2),
                  Expanded(
                    child: AppTextField(
                      controller: _controller,
                      autofocus: true,
                      hintText: 'Cari tempat',
                      prefixIcon: Icons.search,
                      suffixIcon: _hasText ? Icons.close : null,
                      onSuffixIconTap: _handleClear,
                      suffixIconTooltip: 'Hapus pencarian',
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: _handleSubmitted,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.borderHairline),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  return PlaceSearchResults(
                    state: ref.watch(placeSearchProvider),
                    onSelected: (place) => context.pop(place),
                    onRetry: () =>
                        ref.read(placeSearchProvider.notifier).retry(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
