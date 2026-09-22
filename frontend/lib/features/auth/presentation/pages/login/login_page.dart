import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pantau/features/auth/presentation/pages/login/listener/listener.dart';

import '../../../../../core/components/button/button.dart';
import '../../../../../core/components/textfield/textfield.dart';
import '../../../../../core/router/app_routes.dart';
import '../../../../../core/theme/theme.dart';
import '../../../../../core/utils/validators/validators.dart';
import '../../widgets/widgets.dart';
import 'provider/provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await ref
        .read(loginUserProvider.notifier)
        .login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  void _goToRegister() {
    context.push(AppRoutes.register);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginListener(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xl2,
              ),
              children: [
                const AuthHeader(
                  title: 'Welcome back',
                  subtitle: 'Sign in to keep tracking your reports.',
                ),
                const Gap(AppSpacing.xl2),
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
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  autofillHints: const [AutofillHints.password],
                  validator: AppValidators.password,
                  onFieldSubmitted: (_) => _submit(),
                ),
                const Gap(AppSpacing.xl2),
                AppButton(
                  text: 'Sign in',
                  trailing: const Icon(Icons.arrow_forward),
                  onPressed: _submit,
                ),
                const Gap(AppSpacing.lg),
                AuthFooterPrompt(
                  promptText: "Don't have an account?",
                  actionText: 'Sign up',
                  onPressed: _goToRegister,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
