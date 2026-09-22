import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('ReportCategoriesModelMapper.toEntities', () {
    test('maps every row in data', () {
      const model = ReportCategoriesModel(
        data: [
          ReportCategoriesDataModel(id: 1, name: 'Pothole'),
          ReportCategoriesDataModel(id: 2, name: 'Trash'),
        ],
      );

      final entities = model.toEntities();

      expect(entities, hasLength(2));
      expect(entities[0].id, 1);
      expect(entities[1].id, 2);
    });

    test('null data yields an empty list', () {
      const model = ReportCategoriesModel();
      expect(model.toEntities(), isEmpty);
    });
  });

  group('ReportCategoriesDataModelMapper.toEntity', () {
    test('maps every field', () {
      const model = ReportCategoriesDataModel(
        id: 4,
        name: 'Flooding',
        slug: 'flooding',
        isActive: true,
      );

      final entity = model.toEntity();

      expect(entity.id, 4);
      expect(entity.name, 'Flooding');
      expect(entity.slug, 'flooding');
      expect(entity.isActive, isTrue);
    });
  });
}
