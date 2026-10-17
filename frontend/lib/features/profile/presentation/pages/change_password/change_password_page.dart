import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:pantau/core/components/button/button.dart';
import 'package:pantau/core/components/textfield/app_text_field.dart';
import 'package:pantau/core/theme/theme.dart';
import 'package:pantau/core/utils/validators/app_validators.dart';
import 'package:pantau/features/profile/presentation/pages/change_password/listener/change_password_listener.dart';
import 'package:pantau/features/profile/presentation/pages/change_password/provider/change_password_notifier.dart';

/// Matches the backend's password length cap.
const _maxPasswordLength = 50;

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Change password?'),
        content: const Text(
          'You will be signed out and need to sign in again with your new '
          'password.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Change password'),
          ),
        ],
      ),
    );
    if (!(confirmed ?? false) || !mounted) return;

    await ref
        .read(changePasswordProvider.notifier)
        .submit(
          currentPassword: _currentController.text,
          newPassword: _newController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change password')),
      body: ChangePasswordListener(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                AppTextField(
                  controller: _currentController,
                  labelText: 'Current password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  maxLength: _maxPasswordLength,
                  counterText: '',
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.password],
                  validator: (value) => AppValidators.required(
                    value,
                    fieldName: 'Current password',
                  ),
                ),
                const Gap(AppSpacing.md),
                AppTextField(
                  controller: _newController,
                  labelText: 'New password',
                  hintText: 'At least 8 characters',
                  prefixIcon: Icons.lock_reset,
                  obscureText: true,
                  maxLength: _maxPasswordLength,
                  counterText: '',
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: AppValidators.newPassword(_currentController),
                ),
                const Gap(AppSpacing.md),
                AppTextField(
                  controller: _confirmController,
                  labelText: 'Confirm new password',
                  prefixIcon: Icons.lock_reset,
                  obscureText: true,
                  maxLength: _maxPasswordLength,
                  counterText: '',
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: AppValidators.confirmPassword(_newController),
                  onFieldSubmitted: (_) => _submit(),
                ),
                const Gap(AppSpacing.xl),
                AppButton(text: 'Update password', onPressed: _submit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
