import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/error/error.dart';
import '../../../../../../core/theme/theme.dart';
import '../provider/provider.dart';

/// Side effects of a resolver's status change: success/error snackbar, plus
/// a refetch of the detail and history providers so the read-only timeline
/// picks up the new step without a manual pull-to-refresh. The picker sheet
/// (in `widgets/report_status_action_panel.dart`) owns only its own
/// dismissal — this listener is what the rest of the page reacts to.
class ReportStatusListener extends ConsumerWidget {
  const ReportStatusListener({
    super.key,
    required this.reportId,
    required this.child,
  });

  final String reportId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      reportDetailProvider(reportId).select((state) => state.updateStatus),
      (previous, next) {
        switch (next) {
          case AsyncData(value: final report?):
            ref.read(reportDetailProvider(reportId).notifier).refresh();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.statusResolved,
                content: Text('Status updated to ${report.status.label}.'),
              ),
            );
          case AsyncError(error: final error):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.statusRejected,
                content: Text(
                  error is Failure ? error.displayMessage : error.toString(),
                ),
              ),
            );
          case _:
            break;
        }
      },
    );

    return child;
  }
}
