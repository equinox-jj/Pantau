import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/extensions/extensions.dart';

/// Screen title + subtitle used at the top of the login and register pages.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.headlineLarge),
        const SizedBox(height: AppSpacing.xs2),
        Text(subtitle, style: context.textTheme.bodyLarge),
      ],
    );
  }
}
