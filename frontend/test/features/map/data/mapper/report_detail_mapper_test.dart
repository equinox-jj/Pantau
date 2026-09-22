import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('ReportDetailModelMapper.toEntity', () {
    test('maps the nested data into a ReportDetail entity', () {
      const model = ReportDetailModel(
        status: true,
        data: ReportDetailDataModel(id: 'r1', status: 'resolved'),
      );

      final entity = model.toEntity();

      expect(entity.id, 'r1');
      expect(entity.status, ReportStatus.resolved);
    });

    test('throws NotFoundException when data is null', () {
      const model = ReportDetailModel();

      expect(() => model.toEntity(), throwsA(isA<NotFoundException>()));
    });
  });

  group('ReportDetailDataModelMapper.toEntity', () {
    test('maps every field, including nested category and dates', () {
      const model = ReportDetailDataModel(
        id: 'r1',
        category: ReportDetailCategoryModel(
          id: 3,
          name: 'Pothole',
          slug: 'pothole',
          isActive: true,
        ),
        description: 'Big hole',
        photoUrls: ['https://example.com/p.jpg'],
        latitude: -6.2,
        longitude: 106.8,
        status: 'closed',
        createdAt: '2024-05-01T10:00:00.000Z',
        updatedAt: '2024-05-02T10:00:00.000Z',
      );

      final entity = model.toEntity();

      expect(entity.id, 'r1');
      expect(entity.category?.name, 'Pothole');
      expect(entity.description, 'Big hole');
      expect(entity.photoUrls, ['https://example.com/p.jpg']);
      expect(entity.latitude, -6.2);
      expect(entity.longitude, 106.8);
      expect(entity.status, ReportStatus.closed);
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      expect(entity.updatedAt, DateTime.parse('2024-05-02T10:00:00.000Z'));
    });

    test('null category, unparsable status and dates yield safe defaults', () {
      const model = ReportDetailDataModel(id: 'r2', status: 'bogus');

      final entity = model.toEntity();

      expect(entity.category, isNull);
      expect(entity.status, ReportStatus.unknown);
      expect(entity.createdAt, isNull);
      expect(entity.updatedAt, isNull);
    });
  });

  group('ReportDetailCategoryModelMapper.toEntity', () {
    test('maps every field', () {
      const model = ReportDetailCategoryModel(
        id: 7,
        name: 'Streetlight',
        slug: 'streetlight',
        isActive: false,
      );

      final entity = model.toEntity();

      expect(entity.id, 7);
      expect(entity.name, 'Streetlight');
      expect(entity.slug, 'streetlight');
      expect(entity.isActive, isFalse);
    });
  });
}
