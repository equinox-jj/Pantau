import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/auth/data/mapper/mapper.dart';
import 'package:pantau/features/auth/data/model/model.dart';

void main() {
  group('LoginModelMapper.toEntity', () {
    test('maps token and expiry', () {
      const model = LoginModel(token: 'tok', expiresIn: 3600);

      final entity = model.toEntity();

      expect(entity.token, 'tok');
      expect(entity.expiresIn, 3600);
    });

    test('null fields remain null', () {
      const model = LoginModel();

      final entity = model.toEntity();

      expect(entity.token, isNull);
      expect(entity.user, isNull);
    });
  });

  group('LoginModelMapper.toEntity nested user', () {
    test('maps token, expiresIn, and nested user', () {
      const model = LoginModel(
        token: 'tok',
        expiresIn: 100,
        userResponse: LoginUserModel(id: 'u1', email: 'a@b.com'),
      );

      final entity = model.toEntity();

      expect(entity.token, 'tok');
      expect(entity.expiresIn, 100);
      expect(entity.user?.uuid, 'u1');
      expect(entity.user?.email, 'a@b.com');
    });

    test('null userResponse yields null entity user', () {
      const model = LoginModel(token: 'tok');

      final entity = model.toEntity();

      expect(entity.user, isNull);
    });
  });

  group('LoginUserModelMapper.toEntity', () {
    test('maps every field and parses ISO date strings', () {
      const model = LoginUserModel(
        id: 'u1',
        email: 'a@b.com',
        displayName: 'alice',
        role: 'USER',
        createdAt: '2024-05-01T10:00:00.000Z',
        updatedAt: '2024-06-01T10:00:00.000Z',
      );

      final entity = model.toEntity();

      expect(entity.uuid, 'u1');
      expect(entity.email, 'a@b.com');
      expect(entity.displayName, 'alice');
      expect(entity.role, 'USER');
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      expect(entity.updatedAt, DateTime.parse('2024-06-01T10:00:00.000Z'));
    });

    test(
      'a DateTime value passed through createdAt/updatedAt is kept as-is',
      () {
        final now = DateTime(2024, 1, 1);
        final model = LoginUserModel(id: 'u1', createdAt: now, updatedAt: now);

        final entity = model.toEntity();

        expect(entity.createdAt, now);
        expect(entity.updatedAt, now);
      },
    );

    test('null and unparsable date values yield null', () {
      const nullModel = LoginUserModel(id: 'u1');
      const badModel = LoginUserModel(id: 'u1', createdAt: 'not-a-date');

      expect(nullModel.toEntity().createdAt, isNull);
      expect(badModel.toEntity().createdAt, isNull);
    });
  });
}
