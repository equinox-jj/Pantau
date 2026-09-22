import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/report/data/mapper/mapper.dart';
import 'package:pantau/features/report/data/model/model.dart';

void main() {
  group('FeedReportsDataModelMapper.toEntity', () {
    test(
      'maps every field, including nested category and status/date parsing',
      () {
        const model = FeedReportsDataModel(
          id: 'r1',
          category: FeedReportsCategoryModel(id: 3, name: 'Pothole'),
          status: 'in_progress',
          description: 'Big hole',
          photoUrls: ['https://example.com/p.jpg'],
          latitude: -6.2,
          longitude: 106.8,
          createdAt: '2024-05-01T10:00:00.000Z',
        );

        final entity = model.toEntity();

        expect(entity.id, 'r1');
        expect(entity.categoryId, 3);
        expect(entity.categoryName, 'Pothole');
        expect(entity.status, ReportStatus.inProgress);
        expect(entity.description, 'Big hole');
        expect(entity.photoUrls, ['https://example.com/p.jpg']);
        expect(entity.latitude, -6.2);
        expect(entity.longitude, 106.8);
        expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      },
    );

    test(
      'missing category yields null categoryId/categoryName and unknown status',
      () {
        const model = FeedReportsDataModel(
          id: 'r2',
          status: 'not_a_real_status',
        );

        final entity = model.toEntity();

        expect(entity.categoryId, isNull);
        expect(entity.categoryName, isNull);
        expect(entity.status, ReportStatus.unknown);
        expect(entity.createdAt, isNull);
      },
    );
  });

  group('FeedReportsModelMapper.toEntities', () {
    test('maps every row in data', () {
      const model = FeedReportsModel(
        data: [
          FeedReportsDataModel(id: 'a', status: 'reported'),
          FeedReportsDataModel(id: 'b', status: 'resolved'),
        ],
      );

      final entities = model.toEntities();

      expect(entities, hasLength(2));
      expect(entities[0].id, 'a');
      expect(entities[1].id, 'b');
    });

    test('null data yields an empty list', () {
      const model = FeedReportsModel();
      expect(model.toEntities(), isEmpty);
    });
  });
}
