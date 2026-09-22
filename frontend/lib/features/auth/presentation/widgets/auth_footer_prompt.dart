import 'package:material_ui/material_ui.dart';

import '../../../../core/utils/extensions/extensions.dart';

/// "Don't have an account? Sign up" style row linking between auth pages.
class AuthFooterPrompt extends StatelessWidget {
  const AuthFooterPrompt({
    super.key,
    required this.promptText,
    required this.actionText,
    required this.onPressed,
  });

  final String promptText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(promptText, style: context.textTheme.bodyMedium),
        TextButton(onPressed: onPressed, child: Text(actionText)),
      ],
    );
  }
}
