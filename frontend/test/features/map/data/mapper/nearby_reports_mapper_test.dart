import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('NearbyReportsModelMapper.toEntities', () {
    test('maps every row in data', () {
      const model = NearbyReportsModel(
        data: [
          NearbyReportsDataModel(id: 'a', status: 'reported'),
          NearbyReportsDataModel(id: 'b', status: 'resolved'),
        ],
      );

      final entities = model.toEntities();

      expect(entities, hasLength(2));
      expect(entities[0].id, 'a');
      expect(entities[1].id, 'b');
    });

    test('null data yields an empty list', () {
      const model = NearbyReportsModel();
      expect(model.toEntities(), isEmpty);
    });
  });

  group('NearbyReportsDataModelMapper.toEntity', () {
    test(
      'maps every field, including nested category and status/date parsing',
      () {
        const model = NearbyReportsDataModel(
          id: 'r1',
          category: NearbyReportsCategoryModel(id: 3, name: 'Pothole'),
          status: 'acknowledged',
          photoUrls: ['https://example.com/p.jpg'],
          latitude: -6.2,
          longitude: 106.8,
          createdAt: '2024-05-01T10:00:00.000Z',
        );

        final entity = model.toEntity();

        expect(entity.id, 'r1');
        expect(entity.category?.id, 3);
        expect(entity.category?.name, 'Pothole');
        expect(entity.status, ReportStatus.acknowledged);
        expect(entity.photoUrl, 'https://example.com/p.jpg');
        expect(entity.latitude, -6.2);
        expect(entity.longitude, 106.8);
        expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      },
    );

    test('missing category yields null category and unknown status', () {
      const model = NearbyReportsDataModel(
        id: 'r2',
        status: 'not_a_real_status',
      );

      final entity = model.toEntity();

      expect(entity.category, isNull);
      expect(entity.status, ReportStatus.unknown);
      expect(entity.createdAt, isNull);
    });
  });

  group('NearbyReportsCategoryModelMapper.toEntity', () {
    test('maps every field', () {
      const model = NearbyReportsCategoryModel(
        id: 1,
        name: 'Trash',
        slug: 'trash',
        isActive: true,
      );

      final entity = model.toEntity();

      expect(entity.id, 1);
      expect(entity.name, 'Trash');
      expect(entity.slug, 'trash');
      expect(entity.isActive, isTrue);
    });
  });
}
