import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/report/data/mapper/mapper.dart';
import 'package:pantau/features/report/data/model/model.dart';

void main() {
  group('FeedReportsModelMapper.toEntities for my reports', () {
    test('maps every row', () {
      const model = <FeedReportsDataModel>[
        FeedReportsDataModel(id: 'a', status: 'reported'),
        FeedReportsDataModel(id: 'b', status: 'closed'),
      ];

      final entities = model.toEntities();

      expect(entities, hasLength(2));
      expect(entities[0].id, 'a');
      expect(entities[1].id, 'b');
    });

    test('empty list yields an empty list', () {
      const model = <FeedReportsDataModel>[];
      expect(model.toEntities(), isEmpty);
    });
  });
}
