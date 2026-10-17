import 'package:material_ui/material_ui.dart';

import 'package:pantau/core/theme/theme.dart';

enum AvatarAction { camera, gallery, remove }

/// Bottom sheet of profile picture actions. "Remove photo" only appears
/// when there is one to remove.
class AvatarActionsSheet extends StatelessWidget {
  const AvatarActionsSheet({super.key, required this.hasAvatar});

  final bool hasAvatar;

  static Future<AvatarAction?> show(
    BuildContext context, {
    required bool hasAvatar,
  }) {
    return showModalBottomSheet<AvatarAction>(
      context: context,
      backgroundColor: AppColors.surfaceSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => AvatarActionsSheet(hasAvatar: hasAvatar),
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
            title: const Text('Take photo'),
            onTap: () => Navigator.of(context).pop(AvatarAction.camera),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Choose from gallery'),
            onTap: () => Navigator.of(context).pop(AvatarAction.gallery),
          ),
          if (hasAvatar)
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: const Text(
                'Remove photo',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => Navigator.of(context).pop(AvatarAction.remove),
            ),
        ],
      ),
    );
  }
}
