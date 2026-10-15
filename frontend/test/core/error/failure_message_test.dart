import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/error/error.dart';

void main() {
  group('displayMessage', () {
    test('validation failure shows its first field error', () {
      const failure = Failure.validation({
        'photos': ['Attach between 1 and 4 photos'],
      });
      expect(failure.displayMessage, 'Attach between 1 and 4 photos');
    });

    test('validation failure without field errors falls back to message', () {
      const failure = Failure.validation({});
      expect(failure.displayMessage, const Failure.validation({}).message);
    });
  });

  group('displayMessageOf', () {
    test('uses the failure message', () {
      expect(
        displayMessageOf(const Failure.notFound('Report is gone')),
        'Report is gone',
      );
    });

    test('hides raw text of non-failure errors', () {
      final message = displayMessageOf(StateError('Bad state: boom'));
      expect(message, isNot(contains('boom')));
      expect(message, const Failure.unknown().message);
    });
  });
}
