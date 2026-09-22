import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/theme/theme.dart';

class PhotoSourceSheet extends StatelessWidget {
  const PhotoSourceSheet({super.key});

  static Future<ImageSource?> show(BuildContext context) {
    return showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: AppColors.surfaceSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => const PhotoSourceSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_camera_outlined),
            title: const Text('Take a photo'),
            onTap: () => Navigator.of(context).pop(ImageSource.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Choose from gallery'),
            onTap: () => Navigator.of(context).pop(ImageSource.gallery),
          ),
        ],
      ),
    );
  }
}

/// On a resubmit, the rejected report's own photo is shown once as a dimmed
/// reference tile that doubles as the add trigger — reference only, since
/// filing always needs a fresh local file.
class ReportPhotoPicker extends StatelessWidget {
  const ReportPhotoPicker({
    super.key,
    required this.photoPaths,
    required this.maxPhotos,
    required this.onAdd,
    required this.onRemove,
    this.errorText,
    this.initialPhotoUrl,
  });

  final List<String> photoPaths;
  final int maxPhotos;

  /// Null renders the disabled affordance instead of an inert tap target
  /// (e.g. while submitting).
  final VoidCallback? onAdd;
  final ValueChanged<int>? onRemove;
  final String? errorText;

  /// Reference only — a report can only ever be filed with fresh local
  /// files, so this never satisfies the photo requirement on its own;
  /// picking the first new photo replaces it.
  final String? initialPhotoUrl;

  static const double _tileSize = 84;

  @override
  Widget build(BuildContext context) {
    final initialPhotoUrl = this.initialPhotoUrl;
    final showReference = photoPaths.isEmpty && initialPhotoUrl != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Photos', style: AppTypography.label),
            const Spacer(),
            Text(
              '${photoPaths.length}/$maxPhotos',
              style: AppTypography.label.copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
        const Gap(AppSpacing.xs2),
        Wrap(
          spacing: AppSpacing.xs2,
          runSpacing: AppSpacing.xs2,
          children: [
            if (showReference)
              _PreviousPhotoSlot(
                photoUrl: initialPhotoUrl,
                onTap: onAdd,
                size: _tileSize,
              )
            else ...[
              ...List.generate(
                photoPaths.length,
                (index) => _PickedPhotoTile(
                  path: photoPaths[index],
                  onRemove: onRemove == null ? null : () => onRemove!(index),
                  size: _tileSize,
                ),
              ),
              if (photoPaths.length < maxPhotos)
                _AddPhotoTile(onTap: onAdd, size: _tileSize),
            ],
          ],
        ),
        if (errorText != null) ...[
          const Gap(AppSpacing.xs2),
          Text(
            errorText!,
            style: AppTypography.label.copyWith(
              color: AppColors.statusRejected,
            ),
          ),
        ],
      ],
    );
  }
}

class _PickedPhotoTile extends StatelessWidget {
  const _PickedPhotoTile({
    required this.path,
    required this.onRemove,
    required this.size,
  });

  final String path;
  final VoidCallback? onRemove;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: AppRadius.radiusLg,
            child: Image.file(
              File(path),
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
          if (onRemove != null)
            Positioned(
              top: 4,
              right: 4,
              child: _RemoveButton(onPressed: onRemove!),
            ),
        ],
      ),
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({required this.onPressed});

  final VoidCallback onPressed;

  static const double _size = 22;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          color: AppColors.surfaceSunken.withValues(alpha: 0.75),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          size: AppIconSizes.sm,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

/// Doubles as the only tile shown before the first photo is picked.
class _AddPhotoTile extends StatelessWidget {
  const _AddPhotoTile({required this.onTap, required this.size});

  final VoidCallback? onTap;
  final double size;

  /// Local: no token in the scale covers a disabled-affordance dim.
  static const double _disabledOpacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? _disabledOpacity : 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.fillSubtle,
            border: Border.all(color: AppColors.borderDefault),
            borderRadius: AppRadius.radiusLg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_a_photo_outlined,
                size: AppIconSizes.md,
                color: AppColors.accent,
              ),
              const Gap(2),
              Text('Add', style: AppTypography.label),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviousPhotoSlot extends StatelessWidget {
  const _PreviousPhotoSlot({
    required this.photoUrl,
    required this.onTap,
    required this.size,
  });

  final String photoUrl;
  final VoidCallback? onTap;
  final double size;

  static const double _scrimOpacity = 0.55;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: AppRadius.radiusXl,
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                photoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const ColoredBox(color: AppColors.fillSubtle),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.surfaceSunken.withValues(
                    alpha: _scrimOpacity,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add_a_photo_outlined,
                      size: AppIconSizes.xl,
                      color: AppColors.accent,
                    ),
                    const Gap(AppSpacing.xs2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      child: Text(
                        'Photo from the rejected report — tap to add 1 to '
                        '4 photos',
                        style: AppTypography.body,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
