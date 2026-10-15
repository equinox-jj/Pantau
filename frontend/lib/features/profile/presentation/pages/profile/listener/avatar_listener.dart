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
        case AsyncData(value: final change?):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(
                child: Text(switch (change) {
                  AvatarChange.uploaded => 'Profile picture updated.',
                  AvatarChange.removed => 'Profile picture removed.',
                }),
              ),
            ),
          );
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
