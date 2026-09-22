import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/report/data/mapper/mapper.dart';
import 'package:pantau/features/report/data/model/model.dart';

void main() {
  group('MyReportsModelMapper.toEntities', () {
    test('maps the rows nested under data.items', () {
      const model = MyReportsModel(
        data: MyReportsDataModel(
          items: [
            FeedReportsDataModel(id: 'a', status: 'reported'),
            FeedReportsDataModel(id: 'b', status: 'closed'),
          ],
          meta: MyReportsMetaModel(
            limit: 50,
            offset: 0,
            total: 2,
            hasNext: false,
          ),
        ),
      );

      final entities = model.toEntities();

      expect(entities, hasLength(2));
      expect(entities[0].id, 'a');
      expect(entities[1].id, 'b');
    });

    test('null data yields an empty list', () {
      const model = MyReportsModel();
      expect(model.toEntities(), isEmpty);
    });

    test('null items with non-null data yields an empty list', () {
      const model = MyReportsModel(data: MyReportsDataModel());
      expect(model.toEntities(), isEmpty);
    });
  });
}
