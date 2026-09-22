import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../domain/entity/resolver_entity.dart';
import '../provider/provider.dart';
import 'resolver_report_marker.dart';

/// Base tiles, clustered queue markers, current-location pin. The resolver
/// map never pan-refetches (unlike the citizen map), so the camera is free
/// to move without triggering a new query — [controller] only exists so the
/// page can recentre it after a re-locate.
class ResolverMapCanvas extends StatelessWidget {
  const ResolverMapCanvas({
    super.key,
    required this.controller,
    required this.initialCenter,
    required this.onReportTap,
  });

  static const double initialZoom = 14.5;

  final MapController controller;
  final LatLng initialCenter;
  final ValueChanged<QueueReport> onReportTap;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: initialZoom,
        minZoom: 3,
        maxZoom: 18,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.pantau.app',
          tileProvider: CancellableNetworkTileProvider(),
        ),
        // Below the markers, same as the citizen map's ring: context, not a
        // target, so it never covers a report pin.
        _QueueRadiusLayer(center: initialCenter),
        _ReportClusterLayer(onReportTap: onReportTap),
        const _SearchedPlaceLayer(),
        MarkerLayer(
          markers: [
            Marker(
              point: initialCenter,
              width: _CurrentLocationPin.size,
              height: _CurrentLocationPin.size,
              alignment: Alignment.topCenter,
              child: const _CurrentLocationPin(),
            ),
          ],
        ),
        const RichAttributionWidget(
          attributions: [TextSourceAttribution('OpenStreetMap contributors')],
        ),
      ],
    );
  }
}

/// [kResolverMapRadiusInMeters] ring around the query centre — the device
/// position, since the resolver map never refetches on pan (unlike the
/// citizen map, whose ring follows the last fetch instead). Same radius as
/// the citizen map's ring ([kNearbyRadiusInMeters]).
class _QueueRadiusLayer extends StatelessWidget {
  const _QueueRadiusLayer({required this.center});

  final LatLng center;

  @override
  Widget build(BuildContext context) {
    return CircleLayer(
      circles: [
        CircleMarker(
          point: center,
          radius: kResolverMapRadiusInMeters.toDouble(),
          useRadiusInMeter: true,
          color: AppColors.teal400.withValues(alpha: 0.12),
          borderColor: AppColors.teal400.withValues(alpha: 0.55),
          borderStrokeWidth: 2,
        ),
      ],
    );
  }
}

/// Pin for the device position — same icon as the citizen map's pin
/// ([Icons.place]), anchored so its tip sits on the coordinate.
class _CurrentLocationPin extends StatelessWidget {
  const _CurrentLocationPin();

  static const double size = 36;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Your location',
      child: const Icon(
        Icons.place,
        size: size,
        color: AppColors.teal400,
        shadows: AppShadows.floating,
      ),
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
          resolverMapProvider.select((state) => state.searchedPlace),
        );
        if (place == null) return const SizedBox.shrink();

        return MarkerLayer(
          markers: [
            Marker(
              point: LatLng(place.latitude, place.longitude),
              width: _SearchedPlacePin.size,
              height: _SearchedPlacePin.size,
              alignment: Alignment.topCenter,
              child: _SearchedPlacePin(label: place.name),
            ),
          ],
        );
      },
    );
  }
}

/// Pin for a searched place — same icon as the device pin, distinguished by
/// color so the two are never mistaken for each other.
class _SearchedPlacePin extends StatelessWidget {
  const _SearchedPlacePin({required this.label});

  final String label;

  static const double size = 36;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Searched place: $label',
      child: const Icon(
        Icons.place,
        size: size,
        color: AppColors.accent,
        shadows: AppShadows.floating,
      ),
    );
  }
}

/// Marker layer for the active tab's reports. Reads the raw list — unlike
/// the citizen map there is no client-side category filter to memoise
/// against.
class _ReportClusterLayer extends StatelessWidget {
  const _ReportClusterLayer({required this.onReportTap});

  final ValueChanged<QueueReport> onReportTap;

  List<Marker> _markersFrom(List<QueueReport> reports) {
    return reports
        .where((r) => r.id != null && r.latitude != null && r.longitude != null)
        .map(
          (report) => Marker(
            point: LatLng(report.latitude!, report.longitude!),
            width: ResolverReportMarker.size,
            height: ResolverReportMarker.size,
            child: ResolverReportMarker(
              report: report,
              onTap: () => onReportTap(report),
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
          resolverMapProvider.select(
            (state) => state.reports.value?.items ?? const <QueueReport>[],
          ),
        );

        return MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 48,
            size: const Size(44, 44),
            padding: const EdgeInsets.all(50),
            markers: _markersFrom(reports),
            builder: (context, markers) =>
                _ResolverClusterMarker(count: markers.length),
          ),
        );
      },
    );
  }
}

/// Bubble shown in place of overlapping markers, labelled with the count.
class _ResolverClusterMarker extends StatelessWidget {
  const _ResolverClusterMarker({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$count reports',
      child: Container(
        width: 44,
        height: 44,
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
