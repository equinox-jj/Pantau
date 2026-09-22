import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/provider.dart';

class SplashListener extends ConsumerWidget {
  const SplashListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashProvider, (previous, next) {
      if (next case AsyncData(value: final route)) {
        context.go(route);
      }
    });

    return child;
  }
}
