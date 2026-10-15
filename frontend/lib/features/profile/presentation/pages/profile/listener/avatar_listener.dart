import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/dialog/dialog.dart';
import '../../../../../../core/error/error.dart';
import '../provider/provider.dart';

class AvatarListener extends ConsumerWidget {
  const AvatarListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(avatarProvider, (previous, next) {
      switch (next) {
        case AsyncLoading():
          LoadingDialog.show(context);
          break;
        case AsyncData():
          // Only a finished request closes the dialog; the initial state
          // never follows a loading one.
          if (previous is AsyncLoading) LoadingDialog.dismiss(context);
          break;
        case AsyncError(error: final error):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text(
                  error is Failure ? error.displayMessage : error.toString(),
                ),
              ),
            ),
          );
          break;
      }
    });

    return child;
  }
}
