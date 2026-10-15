import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/theme.dart';

/// Rounded square icon used at the start of profile action rows.
class ProfileIconBadge extends StatelessWidget {
  const ProfileIconBadge({super.key, required this.icon});

  final IconData icon;

  static const _size = 38.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.fillSubtle,
        borderRadius: AppRadius.radiusMd,
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Icon(icon, size: 18, color: AppColors.textSecondary),
    );
  }
}
