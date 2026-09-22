import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/data/mapper/resolver_mapper.dart';
import 'package:pantau/features/resolver/data/model/resolver_model.dart';

void main() {
  group('QueueModelMapper.toEntity', () {
    test('maps items, counts and hasNext from a full payload', () {
      final createdAt = DateTime(2024, 1, 1).toIso8601String();
      final model = QueueModel(
        data: QueueDataModel(
          items: [
            QueueReportDataModel(
              id: 'q1',
              category: const QueueCategoryModel(id: 3, name: 'Trash'),
              description: 'desc',
              photoUrls: ['https://x/1.png'],
              status: 'in_progress',
              latitude: -6.2,
              longitude: 106.8,
              distanceMeter: 120,
              createdAt: createdAt,
            ),
          ],
          meta: const QueueMetaModel(hasNext: true),
          counts: const QueueCountsModel(open: 2, inProgress: 1, resolved: 5),
        ),
      );

      final entity = model.toEntity();

      expect(entity.items, hasLength(1));
      final item = entity.items.single;
      expect(item.id, 'q1');
      expect(item.categoryId, 3);
      expect(item.categoryName, 'Trash');
      expect(item.status, ReportStatus.inProgress);
      expect(item.description, 'desc');
      expect(item.photoUrl, 'https://x/1.png');
      expect(item.latitude, -6.2);
      expect(item.longitude, 106.8);
      expect(item.distanceMeter, 120);
      expect(item.createdAt, DateTime.parse(createdAt));
      expect(entity.counts.open, 2);
      expect(entity.counts.inProgress, 1);
      expect(entity.counts.resolved, 5);
      expect(entity.hasNext, isTrue);
    });

    test('null data yields empty items, zeroed counts and hasNext false', () {
      const model = QueueModel();

      final entity = model.toEntity();

      expect(entity.items, isEmpty);
      expect(entity.counts.open, 0);
      expect(entity.counts.inProgress, 0);
      expect(entity.counts.resolved, 0);
      expect(entity.hasNext, isFalse);
    });

    test('null items with non-null data yields an empty list', () {
      const model = QueueModel(data: QueueDataModel());

      expect(model.toEntity().items, isEmpty);
    });

    test('null meta defaults hasNext to false', () {
      const model = QueueModel(data: QueueDataModel(meta: null));

      expect(model.toEntity().hasNext, isFalse);
    });

    test('null counts defaults to a zeroed QueueCounts', () {
      const model = QueueModel(data: QueueDataModel(counts: null));

      final entity = model.toEntity();
      expect(entity.counts.open, 0);
      expect(entity.counts.inProgress, 0);
      expect(entity.counts.resolved, 0);
    });
  });

  group('QueueReportDataModelMapper.toEntity', () {
    test(
      'an unrecognized status string falls back to ReportStatus.unknown',
      () {
        const model = QueueReportDataModel(id: 'q2', status: 'something_else');

        expect(model.toEntity().status, ReportStatus.unknown);
      },
    );

    test('a null status falls back to ReportStatus.unknown', () {
      const model = QueueReportDataModel(id: 'q3');

      expect(model.toEntity().status, ReportStatus.unknown);
    });

    test('a null category leaves categoryId and categoryName null', () {
      const model = QueueReportDataModel(id: 'q4');

      final entity = model.toEntity();
      expect(entity.categoryId, isNull);
      expect(entity.categoryName, isNull);
    });

    test('a null createdAt leaves the entity field null', () {
      const model = QueueReportDataModel(id: 'q5');

      expect(model.toEntity().createdAt, isNull);
    });
  });

  group('QueueCountsModelMapper.toEntity', () {
    test('maps every field when present', () {
      const model = QueueCountsModel(open: 4, inProgress: 2, resolved: 9);

      final entity = model.toEntity();
      expect(entity.open, 4);
      expect(entity.inProgress, 2);
      expect(entity.resolved, 9);
    });

    test('defaults every field to 0 when null', () {
      const model = QueueCountsModel();

      final entity = model.toEntity();
      expect(entity.open, 0);
      expect(entity.inProgress, 0);
      expect(entity.resolved, 0);
    });
  });
}
