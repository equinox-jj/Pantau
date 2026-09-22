import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/router/app_routes.dart';
import '../provider/provider.dart';

class OnboardingListener extends ConsumerWidget {
  const OnboardingListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(onboardingProvider.select((state) => state.completion), (
      previous,
      next,
    ) {
      if (next case AsyncData(value: true)) {
        context.go(AppRoutes.login);
      }
    });

    return child;
  }
}
