import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/service/service.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/helpers/helpers.dart';
import 'listener/listener.dart';
import 'picked_location.dart';
import 'provider/provider.dart';
import 'widgets/location_picker_permission_overlay.dart';
import 'widgets/location_picker_widgets.dart';

/// Full-screen pin placement for the compose flow.
///
/// Pops the chosen [PickedLocation], or nothing when the user backs out. The
/// address under the pin is resolved by `pinAddressProvider`, keyed by the
/// settled coordinate — this page only decides *when* a coordinate counts as
/// settled.
class LocationPickerPage extends ConsumerStatefulWidget {
  const LocationPickerPage({super.key, this.initialLocation});

  /// Pin to open on. Null starts a device-location lookup instead.
  final PickedLocation? initialLocation;

  @override
  ConsumerState<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends ConsumerState<LocationPickerPage> {
  /// Jakarta — fallback pin when the device position is unavailable.
  static const _fallbackCenter = LatLng(-6.2088, 106.8456);

  /// Quiet time after the last camera change before the pin counts as placed.
  /// Long enough that a continuous pan costs one geocode, not dozens — the
  /// Nominatim policy allows one request per second.
  static const _settleDelay = Duration(milliseconds: 700);

  /// Camera drift below this is treated as the same spot, so a nudge does not
  /// spend a geocode.
  static const _settleThresholdInMeters = 8.0;

  final MapController _mapController = MapController();

  /// Cancels in-flight tile requests on fast pan/zoom instead of letting them
  /// queue up and 404 against OSM's rate-limited tile server.
  final _tileProvider = CancellableNetworkTileProvider();

  /// Live camera centre, repainting only the readout — [FlutterMap] must not
  /// rebuild while it is being panned.
  late final ValueNotifier<PickedLocation> _pin;

  /// The centre the address is resolved for. Null while the pin is in motion.
  late final ValueNotifier<PickedLocation?> _settledPin;

  final ValueNotifier<bool> _isMoving = ValueNotifier(false);

  Timer? _settleTimer;

  @override
  void initState() {
    super.initState();

    final initial =
        widget.initialLocation ?? PickedLocation.fromLatLng(_fallbackCenter);
    _pin = ValueNotifier(initial);
    _settledPin = ValueNotifier(widget.initialLocation);

    if (widget.initialLocation == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _locate());
    }
  }

  @override
  void dispose() {
    _settleTimer?.cancel();
    _mapController.dispose();
    _tileProvider.dispose();
    _pin.dispose();
    _settledPin.dispose();
    _isMoving.dispose();
    super.dispose();
  }

  void _locate() => ref.read(locationPickerLocationProvider.notifier).locate();

  /// Moves the pin to the device position, dropping any accuracy claim if the
  /// fix failed — a failure is left to [LocationPickerListener] and
  /// [LocationPickerPermissionOverlay] to explain.
  void _handleLocated(LocationResult result) {
    if (result is! LocationSuccess) return;

    final located = PickedLocation(
      latitude: result.latitude,
      longitude: result.longitude,
      accuracyInMeters: result.accuracyInMeters,
    );

    _settleTimer?.cancel();
    _isMoving.value = false;
    _pin.value = located;
    _settledPin.value = located;
    _mapController.move(located.latLng, LocationPickerMap.initialZoom);
  }

  /// Tracks the camera and restarts the settle debounce.
  ///
  /// Only gestures count: programmatic moves come from [_locate], which has
  /// already placed the pin, and a non-gesture change (a size change on open)
  /// must not blank the address. Dropping the accuracy is deliberate — a pin
  /// the user placed is no longer a measured position.
  void _handlePositionChanged(MapCamera camera, bool hasGesture) {
    if (!hasGesture) return;

    _pin.value = PickedLocation.fromLatLng(camera.center);
    _isMoving.value = true;
    _settledPin.value = null;

    _settleTimer?.cancel();
    _settleTimer = Timer(_settleDelay, _settle);
  }

  /// Promotes the current centre to "placed", unless it is close enough to the
  /// last settled point to be the same spot.
  void _settle() {
    if (!mounted) return;

    _isMoving.value = false;

    final settled = _settledPin.value;
    final pin = _pin.value;
    if (settled != null &&
        distanceInMetersBetween(
              startLatitude: settled.latitude,
              startLongitude: settled.longitude,
              endLatitude: pin.latitude,
              endLongitude: pin.longitude,
            ) <
            _settleThresholdInMeters) {
      _settledPin.value = settled;

      return;
    }

    _settledPin.value = pin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceSunken,
      body: LocationPickerListener(
        onLocated: _handleLocated,
        child: Stack(
          children: [
            Positioned.fill(
              child: LocationPickerMap(
                controller: _mapController,
                initialCenter: _pin.value.latLng,
                onPositionChanged: _handlePositionChanged,
                tileProvider: _tileProvider,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LocationPickerHeader(
                isMoving: _isMoving,
                onBack: () => context.pop(),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: AppSpacing.md,
                      bottom: AppSpacing.xs,
                    ),
                    child: _LocateControl(onPressed: _locate),
                  ),
                  LocationPickerCard(
                    pin: _pin,
                    settledPin: _settledPin,
                    onConfirm: () => context.pop(_pin.value),
                  ),
                ],
              ),
            ),
            // Last layer: without a position "locate me" is useless, so the
            // permission cover hides the controls along with the map.
            const Positioned.fill(child: LocationPickerPermissionOverlay()),
          ],
        ),
      ),
    );
  }
}

/// Locate-me button, spinning only while a location request is in flight.
class _LocateControl extends StatelessWidget {
  const _LocateControl({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final isLocating = ref.watch(
          locationPickerLocationProvider.select((state) => state.isLoading),
        );

        return AppLocateButton(isLoading: isLocating, onPressed: onPressed);
      },
    );
  }
}
