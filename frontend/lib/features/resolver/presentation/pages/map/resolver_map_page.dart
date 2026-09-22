import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/components/empty_state/empty_state.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/service/service.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/enums/enums.dart';
import '../../../../map/domain/entity/entity.dart';
import '../../../../map/presentation/pages/map/widgets/map_search.dart';
import '../../../domain/entity/resolver_entity.dart';
import '../../provider/provider.dart';
import '../queue/widgets/queue_widgets.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';
import 'widgets/widgets.dart';

/// Map tab — the same queue reports as the Queue page, plotted as clustered
/// markers. Tapping a marker opens a small preview card with an "advance
/// status" shortcut into the shared detail screen and a "directions"
/// shortcut into the device's maps app.
class ResolverMapPage extends ConsumerStatefulWidget {
  const ResolverMapPage({super.key});

  @override
  ConsumerState<ResolverMapPage> createState() => _ResolverMapPageState();
}

class _ResolverMapPageState extends ConsumerState<ResolverMapPage> {
  final MapController _mapController = MapController();

  /// Null until the first fix lands — the map has nothing to centre on or
  /// query before that, so it stays out of the tree entirely (no fallback
  /// camera, unlike the citizen map).
  LatLng? _center;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(resolverLocationProvider.notifier).locate();
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _handleLocated(LocationResult result) async {
    if (result is! LocationSuccess) return;

    final center = LatLng(result.latitude, result.longitude);
    final tab = ref.read(resolverMapProvider).tab;
    final hadCenter = _center != null;

    setState(() => _center = center);
    // The map is already mounted — `initialCenter` alone won't recentre an
    // existing FlutterMap, so the controller does it explicitly. On the
    // first fix the map isn't built yet; `initialCenter` handles that case.
    if (hadCenter) {
      _mapController.move(center, ResolverMapCanvas.initialZoom);
    }

    await ref
        .read(resolverMapProvider.notifier)
        .load(tab: tab, latitude: center.latitude, longitude: center.longitude);
    if (!mounted) return;

    _fitToReports(center);
  }

  Future<void> _selectTab(QueueTab tab) async {
    final notifier = ref.read(resolverMapProvider.notifier);
    notifier.selectTab(tab);
    notifier.clearSelectedReport();

    final center = _center;
    if (center == null) return;

    await notifier.load(
      tab: tab,
      latitude: center.latitude,
      longitude: center.longitude,
    );
    if (!mounted) return;

    _fitToReports(center);
  }

  /// Recentres on whatever the tab just loaded. A tab switch never moves the
  /// query centre, but a report far from it (an "in progress" job the
  /// resolver already travelled away from, say) can sit outside the current
  /// viewport — invisible on screen even though it's on the map. Fitting the
  /// camera to the loaded points each time keeps a tab switch from silently
  /// hiding its own markers.
  void _fitToReports(LatLng center) {
    final items =
        ref.read(resolverMapProvider).reports.value?.items ?? const [];
    final points = [
      center,
      for (final r in items)
        if (r.latitude != null && r.longitude != null)
          LatLng(r.latitude!, r.longitude!),
    ];

    if (points.length == 1) {
      _mapController.move(center, ResolverMapCanvas.initialZoom);
      return;
    }

    _mapController.fitCamera(
      CameraFit.coordinates(
        coordinates: points,
        padding: const EdgeInsets.all(64),
        maxZoom: ResolverMapCanvas.initialZoom,
      ),
    );
  }

  /// Runs a place search biased toward the visible bounds, so "Gambir"
  /// resolves to the one on screen first.
  void _searchPlaces(String query) {
    final bounds = _mapController.camera.visibleBounds;

    ref
        .read(resolverMapProvider.notifier)
        .searchPlaces(
          query,
          viewBox: PlaceViewBox(
            minLatitude: bounds.south,
            minLongitude: bounds.west,
            maxLatitude: bounds.north,
            maxLongitude: bounds.east,
          ),
        );
  }

  /// Clears both the results panel and the pin.
  void _clearSearch() {
    final notifier = ref.read(resolverMapProvider.notifier);
    notifier.clearSearch();
    notifier.clearSearchedPlace();
  }

  /// Moves the camera to [place], marks it, and reloads the active tab's
  /// reports around it.
  Future<void> _handlePlaceSelected(Place place) async {
    FocusScope.of(context).unfocus();

    final center = LatLng(place.latitude, place.longitude);
    final notifier = ref.read(resolverMapProvider.notifier);
    notifier.selectPlace(place);
    // Close the panel but keep the pin — the field still shows the query.
    notifier.clearSearch();

    setState(() => _center = center);
    _mapController.move(center, ResolverMapCanvas.initialZoom);

    final tab = ref.read(resolverMapProvider).tab;
    await notifier.load(
      tab: tab,
      latitude: center.latitude,
      longitude: center.longitude,
    );
    if (!mounted) return;

    _fitToReports(center);
  }

  void _locate() => ref.read(resolverLocationProvider.notifier).locate();

  void _openSettings() =>
      ref.read(resolverLocationProvider.notifier).openSettings();

  void _selectReport(QueueReport report) =>
      ref.read(resolverMapProvider.notifier).selectReport(report);

  /// Pushes the shared detail screen and refreshes on return — mirrors
  /// `QueuePage._openReport`. The preview card would otherwise keep showing
  /// the status the report had when the marker was tapped, since
  /// `selectedReport` holds its own copy rather than deriving from the list.
  Future<void> _openDetail(QueueReport report) async {
    final id = report.id;
    if (id == null) return;

    await context.push(
      AppRoutes.reportDetailPath(id),
      extra: report.distanceMeter,
    );
    if (!mounted) return;

    final center = _center;
    if (center == null) return;

    final notifier = ref.read(resolverMapProvider.notifier);
    final tab = ref.read(resolverMapProvider).tab;
    await notifier.load(
      tab: tab,
      latitude: center.latitude,
      longitude: center.longitude,
    );
    if (!mounted) return;

    final items = ref.read(resolverMapProvider).reports.value?.items;
    QueueReport? updated;
    if (items != null) {
      for (final item in items) {
        if (item.id == id) {
          updated = item;
          break;
        }
      }
    }

    if (updated != null) {
      notifier.selectReport(updated);
    } else {
      notifier.clearSelectedReport();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResolverMapListener(
        onLocated: _handleLocated,
        child: SafeArea(
          bottom: false,
          child: Consumer(
            builder: (context, ref, _) {
              final locationResult = ref.watch(
                resolverLocationProvider.select((state) => state.value),
              );
              if (locationResult != null &&
                  locationResult is! LocationSuccess) {
                return _MapLocationState(
                  result: locationResult,
                  onRetry: _locate,
                  onOpenSettings: _openSettings,
                );
              }

              final center = _center;
              if (center == null) return const _MapLocatingState();

              return Stack(
                children: [
                  ResolverMapCanvas(
                    controller: _mapController,
                    initialCenter: center,
                    onReportTap: _selectReport,
                  ),
                  _MapHeader(
                    onTabSelected: _selectTab,
                    onSearchSubmitted: _searchPlaces,
                    onSearchCleared: _clearSearch,
                    onPlaceSelected: _handlePlaceSelected,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: _LocateControl(onPressed: _locate),
                          ),
                          const Gap(AppSpacing.md),
                          ResolverMapPreviewCard(onOpenDetail: _openDetail),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Search field, then either the tab selector or the search results panel,
/// scrimmed over the map tiles so both stay legible regardless of what's
/// underneath.
class _MapHeader extends StatelessWidget {
  const _MapHeader({
    required this.onTabSelected,
    required this.onSearchSubmitted,
    required this.onSearchCleared,
    required this.onPlaceSelected,
  });

  final ValueChanged<QueueTab> onTabSelected;

  /// The trimmed query from the keyboard's search action.
  final ValueChanged<String> onSearchSubmitted;

  /// Fired by the field's clear button.
  final VoidCallback onSearchCleared;

  final ValueChanged<Place> onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.surfaceBase.withValues(alpha: 0.92),
              AppColors.surfaceBase,
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MapSearchField(
                onSubmitted: onSearchSubmitted,
                onCleared: onSearchCleared,
              ),
              const Gap(AppSpacing.xs2),
              _TabSelectorOrSearchResults(
                onTabSelected: onTabSelected,
                onPlaceSelected: onPlaceSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The row under the search field: the tab selector while no search is open,
/// the results panel while one is — never both, so nothing overlaps.
class _TabSelectorOrSearchResults extends StatelessWidget {
  const _TabSelectorOrSearchResults({
    required this.onTabSelected,
    required this.onPlaceSelected,
  });

  final ValueChanged<QueueTab> onTabSelected;
  final ValueChanged<Place> onPlaceSelected;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(
          resolverMapProvider.select((state) => state.placeSearch),
        );
        // Null means the panel is closed; loading, failed, and empty
        // searches all still have something to show.
        if (state == null) return child!;

        return MapSearchResults(
          state: state,
          onSelected: onPlaceSelected,
          onRetry: () => ref.read(resolverMapProvider.notifier).retrySearch(),
        );
      },
      child: Consumer(
        builder: (context, ref, _) {
          return QueueTabSelector(
            currentTab: ref.watch(
              resolverMapProvider.select((state) => state.tab),
            ),
            counts: ref.watch(
              resolverMapProvider.select(
                (state) => state.reports.value?.counts,
              ),
            ),
            onTabSelected: onTabSelected,
          );
        },
      ),
    );
  }
}

/// Recentre button, spinning only while a location request is in flight.
class _LocateControl extends StatelessWidget {
  const _LocateControl({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLocating = ref.watch(
          resolverLocationProvider.select((state) => state.isLoading),
        );

        return AppLocateButton(isLoading: isLocating, onPressed: onPressed);
      },
    );
  }
}

/// Same copy pattern as `QueuePage`'s private `_QueueLocationState`, with
/// "the queue" swapped for "the map".
class _MapLocationState extends StatelessWidget {
  const _MapLocationState({
    required this.result,
    required this.onRetry,
    required this.onOpenSettings,
  });

  final LocationResult result;
  final VoidCallback onRetry;
  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final (:title, :message, :actionText, :onAction) = switch (result) {
      LocationPermissionDeniedForever() => (
        title: 'Location is switched off',
        message:
            'The map shows what needs attention around you. Enable '
            'location access to see it.',
        actionText: 'Open settings',
        onAction: onOpenSettings,
      ),
      LocationPermissionDenied() => (
        title: 'Location permission needed',
        message: 'Pantau needs your location to show the map around you.',
        actionText: 'Try again',
        onAction: onRetry,
      ),
      LocationServiceDisabled() => (
        title: 'Location services are off',
        message:
            'Turn on location services in your device settings to see the '
            'map.',
        actionText: 'Try again',
        onAction: onRetry,
      ),
      // LocationFailed; LocationSuccess never reaches this widget.
      _ => (
        title: 'Could not get your location',
        message: LocationFailed.message,
        actionText: 'Try again',
        onAction: onRetry,
      ),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl2),
        child: AppEmptyState(
          icon: Icons.location_off_outlined,
          title: title,
          message: message,
          action: AppButton(
            text: actionText,
            fullWidth: false,
            onPressed: onAction,
          ),
        ),
      ),
    );
  }
}

class _MapLocatingState extends StatelessWidget {
  const _MapLocatingState();

  static const _spinnerSize = 34.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: _spinnerSize,
            height: _spinnerSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.accent,
            ),
          ),
          const Gap(AppSpacing.md),
          Text(
            'Locating your position…',
            style: AppTypography.mono(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
