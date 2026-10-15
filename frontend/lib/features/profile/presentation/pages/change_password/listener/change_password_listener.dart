import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/dialog/dialog.dart';
import '../../../../../../core/error/error.dart';
import '../../profile/provider/provider.dart';
import '../provider/provider.dart';

class ChangePasswordListener extends ConsumerWidget {
  const ChangePasswordListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(changePasswordProvider, (previous, next) {
      switch (next) {
        case AsyncLoading():
          LoadingDialog.show(context);
          break;
        case AsyncData(value: true):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Center(
                child: Text('Password updated. Please sign in again.'),
              ),
            ),
          );
          // The old session was issued against the previous password, so
          // sign out. This page is only pushed from ProfilePage, whose
          // LogoutListener stays mounted underneath and navigates to login.
          ref.read(logoutProvider.notifier).logout();
          break;
        case AsyncData():
          break;
        case AsyncError(error: final error):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text(displayMessageOf(error))),
            ),
          );
          break;
      }
    });

    return child;
  }
}
