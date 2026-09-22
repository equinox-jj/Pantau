import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/service/service.dart';
import '../../../../../core/theme/theme.dart';
import '../../../domain/entity/entity.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';
import 'widgets/widgets.dart';

/// Nearby reports on an OSM map with clustered markers.
///
/// Panning never fetches; once the camera drifts from the loaded area a
/// "Search this area" pill appears and the user triggers the request.
class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  /// Jakarta — fallback camera when the device position is unavailable.
  static const _fallbackCenter = LatLng(-6.2088, 106.8456);

  /// Chosen so the [kNearbyRadiusInMeters] ring fills most of the view.
  static const _initialZoom = 14.5;
  static const _distance = Distance();

  /// Allowed camera drift from the loaded centre, as a fraction of
  /// [kNearbyRadiusInMeters].
  static const _centreDriftFraction = 0.3;

  final MapController _mapController = MapController();

  /// Cancels in-flight tile requests on fast pan/zoom instead of letting them
  /// queue up and 404 against OSM's rate-limited tile server.
  final _tileProvider = CancellableNetworkTileProvider();

  /// Centre the visible reports were loaded around. Null until the first load.
  LatLng? _loadedCenter;

  /// A [ValueNotifier] rather than [setState] so toggling the pill repaints it
  /// alone, never the map.
  final ValueNotifier<bool> _canSearchArea = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mapProvider.notifier).locate();
    });
  }

  @override
  void dispose() {
    _canSearchArea.dispose();
    _mapController.dispose();
    _tileProvider.dispose();
    super.dispose();
  }

  /// Whether the camera drifted far enough that the visible reports no longer
  /// describe what the user is looking at.
  ///
  /// Zoom is ignored: the fetch radius is fixed, so only moving the centre
  /// adds reports to ask for.
  bool _cameraLeftLoadedArea(MapCamera camera) {
    final loadedCenter = _loadedCenter;
    // Nothing loaded yet — offering the search is the only way back.
    if (loadedCenter == null) return true;

    final drift = _distance.as(LengthUnit.Meter, loadedCenter, camera.center);

    return drift > kNearbyRadiusInMeters * _centreDriftFraction;
  }

  void _handleMapEvent(MapEvent event) {
    final settled =
        event is MapEventMoveEnd ||
        event is MapEventFlingAnimationEnd ||
        event is MapEventDoubleTapZoomEnd;
    if (!settled) return;

    // The only thing a pan does: offer the fetch, never make it.
    _canSearchArea.value = _cameraLeftLoadedArea(_mapController.camera);
  }

  /// Fetches reports for [camera]'s centre. Shared by the "Search this area"
  /// pill and the error state's retry action.
  void _loadReportsForCamera(MapCamera camera) =>
      _loadReportsAround(camera.center);

  /// Loads the reports within [kNearbyRadiusInMeters] of [center] and retires
  /// the pill.
  void _loadReportsAround(LatLng center) {
    _loadedCenter = center;
    _canSearchArea.value = false;
    final notifier = ref.read(mapProvider.notifier);
    // Moves the ring with the fetch, so it never marks unloaded ground.
    notifier.updateLoadedArea(center);

    notifier.loadNearby(
      latitude: center.latitude,
      longitude: center.longitude,
      radiusInMeters: kNearbyRadiusInMeters,
    );
  }

  void _handleLocated(LocationResult result) {
    // Position unavailable — fall back to the Jakarta camera. Kept as the only
    // other startup fetch trigger; fetching the fallback up front would
    // double-hit the API on every cold open.
    if (result is! LocationSuccess) {
      _loadReportsAround(_fallbackCenter);
      return;
    }

    final center = LatLng(result.latitude, result.longitude);
    ref.read(mapProvider.notifier).updateCurrentLocation(center);
    _mapController.move(center, _initialZoom);
    _loadReportsAround(center);
  }

  /// Runs a place search biased toward the visible bounds, so "Gambir"
  /// resolves to the one on screen first.
  void _searchPlaces(String query) {
    final bounds = _mapController.camera.visibleBounds;

    ref
        .read(mapProvider.notifier)
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
    final notifier = ref.read(mapProvider.notifier);
    notifier.clearSearch();
    notifier.clearSearchedPlace();
  }

  /// Moves the camera to [place], marks it, and loads the reports around it.
  void _handlePlaceSelected(Place place) {
    FocusScope.of(context).unfocus();

    final center = LatLng(place.latitude, place.longitude);
    final notifier = ref.read(mapProvider.notifier);
    notifier.selectPlace(place);
    // Close the panel but keep the pin — the field still shows the query.
    notifier.clearSearch();

    _mapController.move(center, _initialZoom);
    _loadReportsAround(center);
  }

  void _searchThisArea() => _loadReportsForCamera(_mapController.camera);

  void _openReport(NearbyReport report) {
    final id = report.id;
    if (id == null) return;

    context.push(AppRoutes.reportDetailPath(id), extra: _distanceTo(report));
  }

  /// Distance from the last resolved device position. Null before the device
  /// has located, which drops the line on the detail screen.
  double? _distanceTo(NearbyReport report) {
    final origin = ref.read(mapProvider).currentLocation;
    final latitude = report.latitude;
    final longitude = report.longitude;
    if (origin == null || latitude == null || longitude == null) return null;

    return _distance.as(LengthUnit.Meter, origin, LatLng(latitude, longitude));
  }

  void _startReport() => context.push(AppRoutes.createReport);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapListener(
        onLocated: _handleLocated,
        child: Stack(
          children: [
            MapCanvas(
              controller: _mapController,
              initialCenter: _fallbackCenter,
              initialZoom: _initialZoom,
              onMapEvent: _handleMapEvent,
              onReportTap: _openReport,
              tileProvider: _tileProvider,
            ),
            // Below the top bar in paint order: their offset assumes the
            // collapsed bar, so an open results panel must cover them.
            _SearchAreaControl(
              topOffset: MediaQuery.paddingOf(context).top + MapTopBar.height,
              canSearch: _canSearchArea,
              onPressed: _searchThisArea,
            ),
            _ReportsLoadingIndicator(
              topOffset: MediaQuery.paddingOf(context).top + MapTopBar.height,
            ),
            MapTopBar(
              onSearchSubmitted: _searchPlaces,
              onSearchCleared: _clearSearch,
              onPlaceSelected: _handlePlaceSelected,
            ),
            _BottomStack(
              onStartReport: _startReport,
              onRetry: () => _loadReportsForCamera(_mapController.camera),
            ),
            // Last layer: without a position the controls are useless, so the
            // permission cover hides them along with the map.
            const MapPermissionOverlay(),
          ],
        ),
      ),
    );
  }
}

/// Locate button, report FAB, and the status sheet under them.
///
/// A column rather than three positioned layers, so the controls lift by
/// exactly the sheet's height with no offset constant to keep in sync.
class _BottomStack extends StatelessWidget {
  const _BottomStack({required this.onStartReport, required this.onRetry});

  final VoidCallback onStartReport;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const _LocateControl(),
                const Gap(AppSpacing.md),
                MapReportFab(onPressed: onStartReport),
              ],
            ),
          ),
          // Doubles as bottom-edge clearance while the sheet is collapsed.
          const Gap(AppSpacing.md),
          MapStatusSheet(onRetry: onRetry, onStartReport: onStartReport),
        ],
      ),
    );
  }
}

/// The "Search this area" pill, shown once the camera leaves the loaded area.
///
/// Shares the slot under the top bar with [_ReportsLoadingIndicator]: tapping
/// the pill hides it and starts the fetch, so the two never overlap.
class _SearchAreaControl extends StatelessWidget {
  const _SearchAreaControl({
    required this.topOffset,
    required this.canSearch,
    required this.onPressed,
  });

  /// Clearance so the pill sits below the filter chips, not behind them.
  final double topOffset;

  final ValueListenable<bool> canSearch;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: canSearch,
      builder: (context, canSearch, child) {
        if (!canSearch) return const SizedBox.shrink();

        return Positioned(top: topOffset, left: 0, right: 0, child: child!);
      },
      child: Center(child: MapSearchAreaButton(onPressed: onPressed)),
    );
  }
}

/// Spinner for an in-flight refetch, shown over the map while the previous
/// markers stay visible.
class _ReportsLoadingIndicator extends StatelessWidget {
  const _ReportsLoadingIndicator({required this.topOffset});

  /// Clearance so the spinner sits below the filter chips, not behind them.
  final double topOffset;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isLoading = ref.watch(
          mapProvider.select((state) => state.nearbyReports.isLoading),
        );
        if (!isLoading) return const SizedBox.shrink();

        return Positioned(top: topOffset, left: 0, right: 0, child: child!);
      },
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

/// Recentre button, spinning only while a location request is in flight.
class _LocateControl extends StatelessWidget {
  const _LocateControl();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLocating = ref.watch(
          mapProvider.select((state) => state.mapLocation.isLoading),
        );

        return AppLocateButton(
          isLoading: isLocating,
          onPressed: () => ref.read(mapProvider.notifier).locate(),
        );
      },
    );
  }
}
