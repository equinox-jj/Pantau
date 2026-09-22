import 'package:flutter/widgets.dart';

/// Pure, unit-testable form field validators shared across the app.
abstract final class AppValidators {
  static final _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  static String? email(String? value) {
    final trimmed = value?.trim() ?? '';

    if (trimmed.isEmpty) return 'Email is required';
    if (!_emailPattern.hasMatch(trimmed)) return 'Enter a valid email address';

    return null;
  }

  static String? password(String? value, {int minLength = 8}) {
    final input = value ?? '';

    if (input.isEmpty) return 'Password is required';
    if (input.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    return null;
  }

  static String? required(String? value, {String fieldName = 'This field'}) {
    if ((value ?? '').trim().isEmpty) return '$fieldName is required';

    return null;
  }

  /// Returns a validator bound to [passwordController] so the confirm field
  /// always checks against the password field's current value.
  static FormFieldValidator<String> confirmPassword(
    TextEditingController passwordController,
  ) {
    return (value) {
      if ((value ?? '').isEmpty) return 'Confirm your password';
      if (value != passwordController.text) return "Passwords don't match yet";

      return null;
    };
  }
}
