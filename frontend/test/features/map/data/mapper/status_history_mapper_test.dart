import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/data/mapper/mapper.dart';
import 'package:pantau/features/map/data/model/model.dart';

void main() {
  group('StatusHistoryModelMapper.toEntities', () {
    test('sorts entries oldest first regardless of input order', () {
      const model = StatusHistoryModel(
        data: [
          StatusHistoryEntryModel(
            id: 'c',
            createdAt: '2024-05-03T00:00:00.000Z',
          ),
          StatusHistoryEntryModel(
            id: 'a',
            createdAt: '2024-05-01T00:00:00.000Z',
          ),
          StatusHistoryEntryModel(
            id: 'b',
            createdAt: '2024-05-02T00:00:00.000Z',
          ),
        ],
      );

      final entities = model.toEntities();

      expect(entities.map((e) => e.id), ['a', 'b', 'c']);
    });

    test('entries with a null createdAt sort to the end', () {
      const model = StatusHistoryModel(
        data: [
          StatusHistoryEntryModel(id: 'null1'),
          StatusHistoryEntryModel(
            id: 'dated',
            createdAt: '2024-05-01T00:00:00.000Z',
          ),
          StatusHistoryEntryModel(id: 'null2'),
        ],
      );

      final entities = model.toEntities();

      expect(entities.first.id, 'dated');
      expect(
        entities.skip(1).map((e) => e.id),
        containsAll(['null1', 'null2']),
      );
    });

    test('null data yields an empty list', () {
      const model = StatusHistoryModel();
      expect(model.toEntities(), isEmpty);
    });
  });

  group('StatusHistoryEntryModelMapper.toEntity', () {
    test('maps every field, parsing from/to status and date', () {
      const model = StatusHistoryEntryModel(
        id: 's1',
        fromStatus: 'reported',
        toStatus: 'acknowledged',
        note: 'On it',
        actorRole: 'RESOLVER',
        createdAt: '2024-05-01T10:00:00.000Z',
      );

      final entity = model.toEntity();

      expect(entity.id, 's1');
      expect(entity.fromStatus, ReportStatus.reported);
      expect(entity.toStatus, ReportStatus.acknowledged);
      expect(entity.note, 'On it');
      expect(entity.actorRole, 'RESOLVER');
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
    });

    test('null fromStatus stays null; missing toStatus becomes unknown', () {
      const model = StatusHistoryEntryModel(id: 's2');

      final entity = model.toEntity();

      expect(entity.fromStatus, isNull);
      expect(entity.toStatus, ReportStatus.unknown);
    });
  });
}
