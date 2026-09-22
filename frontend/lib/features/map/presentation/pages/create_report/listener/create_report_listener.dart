import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/error/error.dart';
import '../../../../../../core/theme/theme.dart';
import '../../map/provider/provider.dart';
import '../provider/provider.dart';

/// Side effects of the compose flow: success snackbar, pop back to the map,
/// and a refresh so the new marker appears.
class CreateReportListener extends ConsumerWidget {
  const CreateReportListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createReportProvider, (previous, next) {
      switch (next) {
        case AsyncData(value: final report?):
          ref.read(mapProvider.notifier).refreshNearby();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.statusResolved,
              content: Text(
                'Report submitted — ${report.status.label.toLowerCase()}.',
              ),
            ),
          );
          if (context.canPop()) context.pop();
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
    });

    return child;
  }
}
