import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../domain/entity/entity.dart';
import '../provider/provider.dart';

/// Base tiles, clustered report markers, attribution.
///
/// Only the marker layer subscribes to the reports provider, so a refetch
/// never rebuilds [FlutterMap] or its tiles.
class MapCanvas extends StatelessWidget {
  const MapCanvas({
    super.key,
    required this.controller,
    required this.initialCenter,
    required this.initialZoom,
    required this.onMapEvent,
    required this.onReportTap,
    required this.tileProvider,
  });

  final MapController controller;
  final LatLng initialCenter;
  final double initialZoom;
  final void Function(MapEvent event) onMapEvent;
  final ValueChanged<NearbyReport> onReportTap;
  final TileProvider tileProvider;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: initialZoom,
        minZoom: 3,
        maxZoom: 18,
        onMapEvent: onMapEvent,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.pantau.app',
          tileProvider: tileProvider,
        ),
        // Below the markers: the ring is context, not a target, so its tint
        // never covers a report pin.
        const _LoadedAreaLayer(),
        _ReportClusterLayer(onReportTap: onReportTap),
        // Above the clusters: place pins must never be buried under a cluster
        // bubble. The searched pin sits last — it is what the user asked for.
        const _CurrentLocationLayer(),
        const _SearchedPlaceLayer(),
        const RichAttributionWidget(
          attributions: [TextSourceAttribution('OpenStreetMap contributors')],
        ),
      ],
    );
  }
}

/// [kNearbyRadiusInMeters] ring around the centre the reports were fetched for.
///
/// Follows the fetch rather than a pin: after "Search this area" the loaded
/// centre is the camera's, so a ring on the pin would promise coverage that
/// was never loaded.
class _LoadedAreaLayer extends StatelessWidget {
  const _LoadedAreaLayer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final center = ref.watch(
          mapProvider.select((state) => state.loadedArea),
        );
        if (center == null) return const SizedBox.shrink();

        return CircleLayer(
          circles: [
            CircleMarker(
              point: center,
              radius: kNearbyRadiusInMeters.toDouble(),
              useRadiusInMeter: true,
              color: AppColors.teal400.withValues(alpha: 0.12),
              borderColor: AppColors.teal400.withValues(alpha: 0.55),
              borderStrokeWidth: 2,
            ),
          ],
        );
      },
    );
  }
}

/// Pin for the searched place. Its own layer so a reports refetch never
/// rebuilds it.
class _SearchedPlaceLayer extends StatelessWidget {
  const _SearchedPlaceLayer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final place = ref.watch(
          mapProvider.select((state) => state.searchedPlace),
        );
        if (place == null) return const SizedBox.shrink();

        return MarkerLayer(
          markers: [
            _placePin(
              point: LatLng(place.latitude, place.longitude),
              child: _MapPinMarker(label: 'Searched place: ${place.name}'),
            ),
          ],
        );
      },
    );
  }
}

/// Pin for the device position. Its own layer so a re-locate repaints the pin
/// alone.
class _CurrentLocationLayer extends StatelessWidget {
  const _CurrentLocationLayer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final position = ref.watch(
          mapProvider.select((state) => state.currentLocation),
        );
        if (position == null) return const SizedBox.shrink();

        return MarkerLayer(
          markers: [
            _placePin(
              point: position,
              child: const _MapPinMarker(label: 'Your location'),
            ),
          ],
        );
      },
    );
  }
}

/// A [_MapPinMarker] anchored so its tip, not its centre, sits on the
/// coordinate.
Marker _placePin({required LatLng point, required _MapPinMarker child}) {
  return Marker(
    point: point,
    width: _MapPinMarker.size,
    height: _MapPinMarker.size,
    alignment: Alignment.topCenter,
    child: child,
  );
}

/// Marker layer for the current camera's reports. Reads the memoised,
/// category-filtered list so markers stay put across a pan refetch.
///
/// Owns a single pulse [AnimationController] shared by every [_ReportMarker]
/// — a dense cluster of reports used to spawn one ticker per pin, which
/// scaled the per-frame rebuild/tick cost with the report count. One ticker
/// driving every marker keeps that cost flat regardless of how many reports
/// are on screen.
class _ReportClusterLayer extends StatefulWidget {
  const _ReportClusterLayer({required this.onReportTap});

  final ValueChanged<NearbyReport> onReportTap;

  @override
  State<_ReportClusterLayer> createState() => _ReportClusterLayerState();
}

class _ReportClusterLayerState extends State<_ReportClusterLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  List<Marker> _markersFrom(List<NearbyReport> reports) {
    return reports
        .where((r) => r.id != null && r.latitude != null && r.longitude != null)
        .map(
          (report) => Marker(
            point: LatLng(report.latitude!, report.longitude!),
            width: _ReportMarker.size,
            height: _ReportMarker.size,
            child: _ReportMarker(
              report: report,
              pulse: _pulse,
              onTap: () => widget.onReportTap(report),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final reports = ref.watch(
          mapProvider.select((state) => state.filteredReports),
        );

        return MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 48,
            size: const Size(
              _ReportClusterMarker.size,
              _ReportClusterMarker.size,
            ),
            padding: const EdgeInsets.all(50),
            markers: _markersFrom(reports),
            builder: (context, markers) =>
                _ReportClusterMarker(count: markers.length),
          ),
        );
      },
    );
  }
}

/// Teardrop pin for the map's two singular places: where the user is and where
/// they searched.
///
/// Not a circle — report markers are status-coloured circles, so shape alone
/// tells a place apart from a report. The two pins share the accent colour and
/// differ only by position and the semantics [label].
class _MapPinMarker extends StatelessWidget {
  const _MapPinMarker({required this.label});

  /// Spoken description of what the pin marks.
  final String label;

  static const double size = 36;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: const Icon(
        Icons.place,
        size: size,
        color: AppColors.teal400,
        shadows: AppShadows.floating,
      ),
    );
  }
}

/// Status-coloured map pin for a single report. The icon repeats the status
/// so the marker still reads without colour, and the semantics label names it.
///
/// A radar pulse rings out of the dot to draw the eye to reports without
/// moving the dot itself — the marker's anchor point stays exactly on the
/// report's coordinate.
class _ReportMarker extends StatelessWidget {
  const _ReportMarker({
    required this.report,
    required this.pulse,
    required this.onTap,
  });

  /// Marker box. Wider than [dotSize] so the pulse has room to expand into.
  static const double size = 52;

  /// The tappable dot at the centre of the box.
  static const double dotSize = 32;

  final NearbyReport report;

  /// Shared pulse ticker owned by [_ReportClusterLayer] — one ticker drives
  /// every marker on screen instead of each pin running its own.
  final Animation<double> pulse;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final status = report.status;
    // Honour the platform's reduce-motion setting: a map full of pulsing
    // markers is exactly what that setting exists to switch off.
    final animate = !MediaQuery.disableAnimationsOf(context);

    return Semantics(
      button: true,
      label: '${report.category?.name ?? 'Report'}, ${status.label}',
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (animate)
            RepaintBoundary(
              child: AnimatedBuilder(
                animation: pulse,
                builder: (context, _) => CustomPaint(
                  size: const Size.square(_ReportMarker.size),
                  painter: _RadarPulsePainter(
                    progress: pulse.value,
                    color: status.color,
                    minRadius: _ReportMarker.dotSize / 2,
                  ),
                ),
              ),
            ),
          // Only the dot takes taps — the pulse would otherwise swallow taps
          // meant for a neighbouring marker.
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: _ReportMarker.dotSize,
              height: _ReportMarker.dotSize,
              decoration: BoxDecoration(
                color: status.color,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surfaceBase, width: 2),
                boxShadow: AppShadows.floating,
              ),
              child: Icon(
                status.icon,
                size: AppIconSizes.sm,
                color: status.inkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Two rings, half a cycle apart, growing out of the dot and fading as they go.
class _RadarPulsePainter extends CustomPainter {
  const _RadarPulsePainter({
    required this.progress,
    required this.color,
    required this.minRadius,
  });

  /// Cycle position, 0 to 1.
  final double progress;
  final Color color;

  /// Where a ring starts — the dot's edge, so it never appears inside it.
  final double minRadius;

  static const int _ringCount = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide / 2;

    for (var i = 0; i < _ringCount; i++) {
      final t = (progress + i / _ringCount) % 1;
      // Ease out so the ring leaves the dot quickly, then settles as it fades.
      final eased = Curves.easeOutSine.transform(t);
      final radius = minRadius + (maxRadius - minRadius) * eased;
      final fade = 1 - t;

      canvas
        ..drawCircle(
          center,
          radius,
          Paint()..color = color.withValues(alpha: 0.12 * fade),
        )
        ..drawCircle(
          center,
          radius,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = color.withValues(alpha: 0.45 * fade),
        );
    }
  }

  @override
  bool shouldRepaint(_RadarPulsePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.minRadius != minRadius;
  }
}

/// Bubble shown in place of overlapping markers, labelled with the count.
class _ReportClusterMarker extends StatelessWidget {
  const _ReportClusterMarker({required this.count});

  static const double size = 44;

  final int count;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$count reports',
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.accent,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.surfaceBase, width: 2),
          boxShadow: AppShadows.accentGlow(),
        ),
        child: Text(
          '$count',
          style: AppTypography.subheading.copyWith(
            fontSize: 14,
            color: AppColors.onAccent,
          ),
        ),
      ),
    );
  }
}
