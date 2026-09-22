import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/helpers/date_parser.dart';

void main() {
  group('parseDate', () {
    test('returns null for null input', () {
      expect(parseDate(null), isNull);
    });

    test('returns the same DateTime when given a DateTime', () {
      final date = DateTime(2024, 1, 2, 3, 4, 5);
      expect(parseDate(date), date);
    });

    test('parses a valid ISO-8601 string', () {
      final result = parseDate('2024-01-02T03:04:05.000Z');
      expect(result, DateTime.parse('2024-01-02T03:04:05.000Z'));
    });

    test('returns null for an unparsable string', () {
      expect(parseDate('not-a-date'), isNull);
    });

    test('returns null for an unsupported type', () {
      expect(parseDate(12345), isNull);
    });
  });
}
