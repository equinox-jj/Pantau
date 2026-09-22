import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/components/textfield/textfield.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/validators/validators.dart';
import '../../widgets/widgets.dart';
import 'listener/listener.dart';
import 'provider/provider.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await ref
        .read(registerUserProvider.notifier)
        .register(
          displayName: _displayNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RegisterListener(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl2,
              ),
              children: [
                const AuthHeader(
                  title: 'Create your account',
                  subtitle: 'Report issues and watch them get resolved.',
                ),
                const Gap(AppSpacing.xl2),
                AppTextField(
                  controller: _displayNameController,
                  labelText: 'Display name',
                  hintText: 'Your name',
                  prefixIcon: Icons.person_outline,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.name],
                  validator: (value) =>
                      AppValidators.required(value, fieldName: 'Display name'),
                ),
                const Gap(AppSpacing.md),
                AppTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  hintText: 'you@example.com',
                  prefixIcon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.email],
                  validator: AppValidators.email,
                ),
                const Gap(AppSpacing.md),
                AppTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'At least 8 characters',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: AppValidators.password,
                ),
                const Gap(AppSpacing.md),
                AppTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm password',
                  hintText: 'Re-enter your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.newPassword],
                  validator: AppValidators.confirmPassword(_passwordController),
                  onFieldSubmitted: (_) => _submit(),
                ),
                const Gap(AppSpacing.xl2),
                AppButton(
                  text: 'Create account',
                  trailing: const Icon(Icons.arrow_forward),
                  onPressed: _submit,
                ),
                const Gap(AppSpacing.lg),
                AuthFooterPrompt(
                  promptText: 'Already have an account?',
                  actionText: 'Sign in',
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go(AppRoutes.login);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
