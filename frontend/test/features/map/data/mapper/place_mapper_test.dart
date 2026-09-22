import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('PlaceModelMapper.toEntity', () {
    test(
      'maps a full hit, title from name and address from the tail segments',
      () {
        const model = PlaceModel(
          placeId: 123,
          lat: '-6.2',
          lon: '106.8',
          name: 'Monas',
          displayName: 'Monas, Gambir, Jakarta Pusat',
        );

        final entity = model.toEntity();

        expect(entity, isNotNull);
        expect(entity!.id, '123');
        expect(entity.name, 'Monas');
        expect(entity.address, 'Gambir, Jakarta Pusat');
        expect(entity.latitude, -6.2);
        expect(entity.longitude, 106.8);
      },
    );

    test('returns null when lat is missing or unparsable', () {
      const model = PlaceModel(lon: '106.8', name: 'Monas');
      expect(model.toEntity(), isNull);
    });

    test('returns null when lon is missing or unparsable', () {
      const model = PlaceModel(lat: '-6.2', name: 'Monas');
      expect(model.toEntity(), isNull);
    });

    test('falls back to the first display-name segment when name is blank', () {
      const model = PlaceModel(
        lat: '-6.2',
        lon: '106.8',
        name: '   ',
        displayName: 'Gambir, Jakarta Pusat, Indonesia',
      );

      final entity = model.toEntity();

      expect(entity!.name, 'Gambir');
      expect(entity.address, 'Jakarta Pusat, Indonesia');
    });

    test(
      'falls back to "Unknown place" when both name and displayName are blank',
      () {
        const model = PlaceModel(lat: '-6.2', lon: '106.8');

        final entity = model.toEntity();

        expect(entity!.name, 'Unknown place');
        expect(entity.address, '');
      },
    );

    test('falls back to a coordinate-based id when placeId is null', () {
      const model = PlaceModel(lat: '-6.2', lon: '106.8', name: 'Monas');

      final entity = model.toEntity();

      expect(entity!.id, '-6.2,106.8');
    });
  });

  group('PlaceModelListMapper.toEntities', () {
    test('drops hits without usable coordinates', () {
      const models = [
        PlaceModel(lat: '-6.2', lon: '106.8', name: 'Monas'),
        PlaceModel(lat: null, lon: '106.8', name: 'No lat'),
        PlaceModel(lat: '-6.3', lon: 'not-a-number', name: 'Bad lon'),
      ];

      final entities = models.toEntities();

      expect(entities, hasLength(1));
      expect(entities.single.name, 'Monas');
    });

    test('empty list yields an empty list', () {
      expect(<PlaceModel>[].toEntities(), isEmpty);
    });
  });
}
