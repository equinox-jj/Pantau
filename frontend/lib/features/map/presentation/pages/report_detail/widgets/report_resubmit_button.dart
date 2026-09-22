import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/button/button.dart';
import '../../../../../../core/router/app_routes.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../domain/entity/entity.dart';
import '../provider/provider.dart';

/// Bottom action on a rejected report (design 21): reopens the compose flow
/// pre-filled with this report's details.
///
/// Citizen-only. A resolver reaches this same shared detail page from the
/// queue and already has [ReportStatusActionPanel] for their own actions —
/// resubmitting someone else's report is not something they can do.
class ReportResubmitButton extends StatelessWidget {
  const ReportResubmitButton({
    super.key,
    required this.reportId,
    required this.detail,
  });

  final String reportId;
  final ReportDetail detail;

  @override
  Widget build(BuildContext context) {
    if (detail.status != ReportStatus.rejected) return const SizedBox.shrink();

    return Consumer(
      builder: (context, ref, _) {
        final isResolver =
            ref.watch(
              reportDetailProvider(reportId)
                  .select((state) => state.isResolver.value),
            ) ??
            false;
        if (isResolver) return const SizedBox.shrink();

        return AppButton(
          text: 'Edit & resubmit',
          leading: const Icon(Icons.edit_outlined),
          onPressed: () => context.push(AppRoutes.createReport, extra: detail),
        );
      },
    );
  }
}
