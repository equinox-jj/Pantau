import 'package:material_ui/material_ui.dart';

import '../../../../../../core/theme/theme.dart';
import '../../../../../../core/utils/extensions/extensions.dart';
import '../../../../domain/entity/resolver_entity.dart';

/// Status-coloured dot for one queue report on the map. No pulse animation
/// — that effect lives in the citizen map's private marker widget and is
/// purely decorative; a plain marker keeps this feature small.
class ResolverReportMarker extends StatelessWidget {
  const ResolverReportMarker({
    super.key,
    required this.report,
    required this.onTap,
  });

  static const double size = 36;

  final QueueReport report;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final status = report.status;

    return Semantics(
      button: true,
      label: '${report.categoryName ?? 'Report'}, ${status.label}',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
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
    );
  }
}
