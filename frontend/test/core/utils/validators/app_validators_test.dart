import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/validators/validators.dart';

void main() {
  group('AppValidators.newPassword', () {
    late TextEditingController current;
    late FormFieldValidator<String> validator;

    setUp(() {
      current = TextEditingController(text: 'oldpass12');
      validator = AppValidators.newPassword(current);
    });

    tearDown(() => current.dispose());

    test('rejects a value equal to the current password', () {
      expect(validator('oldpass12'), 'New password must be different');
    });

    test('applies the minimum length rule first', () {
      expect(validator('short'), 'Password must be at least 8 characters');
    });

    test('accepts a valid, different password', () {
      expect(validator('newpass34'), isNull);
    });
  });
}
