import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/components/dialog/dialog.dart';
import '../../../../../../core/router/app_routes.dart';
import '../provider/provider.dart';

class LogoutListener extends ConsumerWidget {
  const LogoutListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(logoutProvider, (previous, next) {
      switch (next) {
        case AsyncLoading():
          LoadingDialog.show(context);
          break;
        case AsyncData(value: true):
          LoadingDialog.dismiss(context);
          context.go(AppRoutes.login);
          break;
        case AsyncData():
          break;
        case AsyncError(error: final error):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text(error.toString())),
            ),
          );
          break;
      }
    });

    return child;
  }
}
