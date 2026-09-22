import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/helpers/geo_helper.dart';

void main() {
  group('distanceInMetersBetween', () {
    test('returns 0 for identical points', () {
      final distance = distanceInMetersBetween(
        startLatitude: -6.2,
        startLongitude: 106.8,
        endLatitude: -6.2,
        endLongitude: 106.8,
      );
      expect(distance, 0);
    });

    test('returns a positive distance for two distinct points', () {
      final distance = distanceInMetersBetween(
        startLatitude: -6.200000,
        startLongitude: 106.816666,
        endLatitude: -6.914744,
        endLongitude: 107.609810,
      );
      expect(distance, greaterThan(0));
      // Jakarta -> Bandung great-circle distance is roughly 116km.
      expect(distance, closeTo(116000, 5000));
    });

    test('distance is symmetric', () {
      final forward = distanceInMetersBetween(
        startLatitude: 1,
        startLongitude: 2,
        endLatitude: 3,
        endLongitude: 4,
      );
      final backward = distanceInMetersBetween(
        startLatitude: 3,
        startLongitude: 4,
        endLatitude: 1,
        endLongitude: 2,
      );
      expect(forward, closeTo(backward, 0.0001));
    });
  });
}
