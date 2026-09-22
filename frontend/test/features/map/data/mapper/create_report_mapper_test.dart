import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('CreateReportModelMapper.toEntity', () {
    test('maps the nested data into a ReportDetail entity', () {
      const model = CreateReportModel(
        status: true,
        data: CreateReportDataModel(
          id: 'r1',
          category: CreateReportCategoryModel(id: 2, name: 'Pothole'),
          description: 'Big hole',
          photoUrls: ['https://example.com/p.jpg'],
          latitude: -6.2,
          longitude: 106.8,
          status: 'reported',
          createdAt: '2024-05-01T10:00:00.000Z',
        ),
      );

      final entity = model.toEntity();

      expect(entity.id, 'r1');
      expect(entity.category?.id, 2);
      expect(entity.description, 'Big hole');
      expect(entity.status, ReportStatus.reported);
    });

    test('throws UnknownException when data is null', () {
      const model = CreateReportModel();

      expect(() => model.toEntity(), throwsA(isA<UnknownException>()));
    });
  });

  group('CreateReportDataModelMapper.toEntity', () {
    test('maps every field, including nested category and dates', () {
      const model = CreateReportDataModel(
        id: 'r1',
        category: CreateReportCategoryModel(
          id: 3,
          name: 'Pothole',
          slug: 'pothole',
          isActive: true,
        ),
        description: 'Big hole',
        photoUrls: ['https://example.com/p.jpg'],
        latitude: -6.2,
        longitude: 106.8,
        status: 'in_progress',
        createdAt: '2024-05-01T10:00:00.000Z',
        updatedAt: '2024-05-02T10:00:00.000Z',
      );

      final entity = model.toEntity();

      expect(entity.id, 'r1');
      expect(entity.category, isNotNull);
      expect(entity.category?.name, 'Pothole');
      expect(entity.description, 'Big hole');
      expect(entity.photoUrls, ['https://example.com/p.jpg']);
      expect(entity.latitude, -6.2);
      expect(entity.longitude, 106.8);
      expect(entity.status, ReportStatus.inProgress);
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      expect(entity.updatedAt, DateTime.parse('2024-05-02T10:00:00.000Z'));
    });

    test('null category, unparsable status and dates yield safe defaults', () {
      const model = CreateReportDataModel(id: 'r2', status: 'nonsense');

      final entity = model.toEntity();

      expect(entity.category, isNull);
      expect(entity.status, ReportStatus.unknown);
      expect(entity.createdAt, isNull);
      expect(entity.updatedAt, isNull);
    });
  });

  group('CreateReportCategoryModelMapper.toEntity', () {
    test('maps every field', () {
      const model = CreateReportCategoryModel(
        id: 5,
        name: 'Trash',
        slug: 'trash',
        isActive: false,
      );

      final entity = model.toEntity();

      expect(entity.id, 5);
      expect(entity.name, 'Trash');
      expect(entity.slug, 'trash');
      expect(entity.isActive, isFalse);
    });
  });
}
