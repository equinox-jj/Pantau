import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/error/error.dart';
import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/helpers/helpers.dart';
import '../../../../domain/entity/entity.dart';
import '../picked_location.dart';
import '../provider/provider.dart';

/// Full-bleed map whose fixed centre marker is the pin: the user pans the map
/// under it rather than dragging the marker itself.
class LocationPickerMap extends StatelessWidget {
  const LocationPickerMap({
    super.key,
    required this.controller,
    required this.initialCenter,
    required this.onPositionChanged,
    required this.tileProvider,
  });

  final MapController controller;

  /// Camera the map opens on; later movement goes through [controller].
  final LatLng initialCenter;

  /// Fires on every camera change, gesture-driven or not.
  final void Function(MapCamera camera, bool hasGesture) onPositionChanged;

  final TileProvider tileProvider;

  static const double initialZoom = 17;

  /// Lifts the marker so its tip, not its bounding-box centre, lands on the
  /// map centre. 0.6 of [_pinSize].
  static const double _pinTipOffset = 30;
  static const double _pinSize = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FlutterMap(
          mapController: controller,
          options: MapOptions(
            initialCenter: initialCenter,
            initialZoom: initialZoom,
            onPositionChanged: onPositionChanged,
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
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: _pinTipOffset),
          child: Icon(
            Icons.place,
            size: _pinSize,
            color: AppColors.accent,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Back control, title and the live drag hint, over a scrim that keeps them
/// readable against any tile.
class LocationPickerHeader extends StatelessWidget {
  const LocationPickerHeader({
    super.key,
    required this.isMoving,
    required this.onBack,
  });

  final ValueListenable<bool> isMoving;
  final VoidCallback onBack;

  static const _scrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xEB060F0D), Color(0x80060F0D), Color(0x00060F0D)],
    stops: [0, 0.62, 1],
  );

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: _scrim),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.xs2,
            AppSpacing.md,
            AppSpacing.xl2,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  _GlassIconButton(
                    icon: Icons.arrow_back,
                    tooltip: 'Back',
                    onPressed: onBack,
                  ),
                  const Gap(AppSpacing.xs),
                  Expanded(
                    child: Text(
                      'Where is it, exactly?',
                      style: AppTypography.subheading,
                    ),
                  ),
                ],
              ),
              const Gap(AppSpacing.xs),
              _DragHintChip(isMoving: isMoving),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceFloat,
        borderRadius: AppRadius.radiusMd,
        border: Border.all(color: AppColors.borderDefault),
        boxShadow: AppShadows.floating,
      ),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(icon, size: AppIconSizes.md),
      ),
    );
  }
}

/// Tells the user the map moves, not the pin — and acknowledges the drag while
/// it happens.
class _DragHintChip extends StatelessWidget {
  const _DragHintChip({required this.isMoving});

  final ValueListenable<bool> isMoving;

  static const _height = 34.0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isMoving,
      builder: (context, moving, _) => Container(
        height: _height,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        decoration: BoxDecoration(
          color: AppColors.surfaceFloat,
          borderRadius: AppRadius.radiusFull,
          border: Border.all(color: AppColors.borderDefault),
          boxShadow: AppShadows.floating,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.my_location,
              size: AppIconSizes.sm,
              color: moving ? AppColors.accent : AppColors.textSecondary,
            ),
            const Gap(AppSpacing.xs2),
            Text(
              moving
                  ? 'Release to drop the pin'
                  : 'Drag the map to move the pin',
              style: AppTypography.label.copyWith(
                color: moving ? AppColors.accent : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom card: what the pin currently points at, and the action that takes it
/// back to the compose form.
class LocationPickerCard extends StatelessWidget {
  const LocationPickerCard({
    super.key,
    required this.pin,
    required this.settledPin,
    required this.onConfirm,
  });

  /// Live camera centre — updates on every frame of a pan.
  final ValueListenable<PickedLocation> pin;

  /// Debounced centre the address is resolved for; null while the pin moves.
  final ValueListenable<PickedLocation?> settledPin;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surfaceSurface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        border: Border(top: BorderSide(color: AppColors.borderDefault)),
        boxShadow: AppShadows.floating,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PinAddress(settledPin: settledPin),
              const Gap(AppSpacing.sm),
              _PinCoordinates(pin: pin),
              const Gap(AppSpacing.md),
              AppButton(
                text: 'Confirm location',
                onPressed: onConfirm,
                trailing: const Icon(
                  Icons.arrow_forward,
                  size: AppIconSizes.md,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reverse-geocoded name of the settled pin, with its own loading and error
/// copy. Shows the last resolved address while the pin moves, so the row never
/// flickers empty mid-drag.
class _PinAddress extends StatelessWidget {
  const _PinAddress({required this.settledPin});

  final ValueListenable<PickedLocation?> settledPin;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppSpacing.xl3,
          height: AppSpacing.xl3,
          decoration: BoxDecoration(
            color: AppColors.fillAccent,
            borderRadius: AppRadius.radiusMd,
            border: Border.all(color: AppColors.borderAccent),
          ),
          child: const Icon(
            Icons.location_on_outlined,
            size: AppIconSizes.md,
            color: AppColors.accent,
          ),
        ),
        const Gap(AppSpacing.xs),
        Expanded(
          child: ValueListenableBuilder<PickedLocation?>(
            valueListenable: settledPin,
            builder: (context, settled, _) => settled == null
                ? const _AddressText(title: 'Moving the pin…')
                : _ResolvedAddress(location: settled),
          ),
        ),
      ],
    );
  }
}

class _ResolvedAddress extends StatelessWidget {
  const _ResolvedAddress({required this.location});

  final PickedLocation location;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final provider = pinAddressProvider(
          latitude: roundedCoordinate(location.latitude),
          longitude: roundedCoordinate(location.longitude),
        );

        return switch (ref.watch(provider)) {
          AsyncLoading() => const _AddressText(title: 'Naming this spot…'),
          AsyncError(error: final error) => _AddressText(
            title: 'Address unavailable',
            subtitle: error is Failure ? error.displayMessage : null,
            onRetry: () => ref.invalidate(provider),
          ),
          AsyncValue<Place?>(value: final place) => _AddressText(
            title: place?.name ?? 'Unnamed location',
            subtitle: place?.address,
          ),
        };
      },
    );
  }
}

class _AddressText extends StatelessWidget {
  const _AddressText({required this.title, this.subtitle, this.onRetry});

  final String title;
  final String? subtitle;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.bodyLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle != null && subtitle.isNotEmpty)
          Text(
            subtitle,
            style: AppTypography.label.copyWith(color: AppColors.textSecondary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        if (onRetry != null)
          TextButton(
            onPressed: onRetry,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Try again'),
          ),
      ],
    );
  }
}

/// Live coordinate readout, plus the GPS accuracy while the pin is still the
/// untouched device fix.
class _PinCoordinates extends StatelessWidget {
  const _PinCoordinates({required this.pin});

  final ValueListenable<PickedLocation> pin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.xs2 + 3,
      ),
      decoration: BoxDecoration(
        color: AppColors.fillSubtle,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderHairline),
      ),
      child: ValueListenableBuilder<PickedLocation>(
        valueListenable: pin,
        builder: (context, location, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatCoordinates(location.latitude, location.longitude),
              style: AppTypography.mono(color: AppColors.textSecondary),
            ),
            if (location.accuracyInMeters case final accuracy?)
              Text(
                formatAccuracy(accuracy),
                style: AppTypography.mono(color: AppColors.textMuted),
              ),
          ],
        ),
      ),
    );
  }
}
