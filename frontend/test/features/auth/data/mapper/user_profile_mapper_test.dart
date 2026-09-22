import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/auth/data/mapper/mapper.dart';
import 'package:pantau/features/auth/data/model/model.dart';

void main() {
  group('UserProfileDataModelMapper.toEntity', () {
    test('maps id to uuid and every other field, parsing joinedAt', () {
      const model = UserProfileDataModel(
        id: 'u1',
        displayName: 'Jane',
        joinedAt: '2024-05-01T10:00:00.000Z',
        reportsCount: 3,
        resolvedCount: 1,
      );

      final entity = model.toEntity();

      expect(entity.uuid, 'u1');
      expect(entity.displayName, 'Jane');
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      expect(entity.reportsCount, 3);
      expect(entity.resolvedCount, 1);
    });

    test('a DateTime value passed through joinedAt is kept as-is', () {
      final now = DateTime(2024, 1, 1);
      final model = UserProfileDataModel(id: 'u1', joinedAt: now);

      final entity = model.toEntity();

      expect(entity.createdAt, now);
    });

    test('null and unparsable joinedAt values yield a null createdAt', () {
      const nullModel = UserProfileDataModel(id: 'u1');
      const badModel = UserProfileDataModel(id: 'u1', joinedAt: 'not-a-date');

      expect(nullModel.toEntity().createdAt, isNull);
      expect(badModel.toEntity().createdAt, isNull);
    });

    test('email, username, and role are not carried by this endpoint', () {
      const model = UserProfileDataModel(id: 'u1');

      final entity = model.toEntity();

      expect(entity.email, isNull);
      expect(entity.username, isNull);
      expect(entity.role, isNull);
    });
  });
}
