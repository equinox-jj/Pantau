import 'package:flutter_test/flutter_test.dart';
import 'package:pantau/features/auth/data/mapper/mapper.dart';
import 'package:pantau/features/auth/data/model/model.dart';

void main() {
  group('RegisterModelMapper.toEntity', () {
    test('maps status, message, and nested data', () {
      final model = RegisterModel(
        status: true,
        message: 'created',
        data: const RegisterDataModel(token: 'tok', expiresIn: 3600),
      );

      final entity = model.toEntity();

      expect(entity.status, isTrue);
      expect(entity.message, 'created');
      expect(entity.data?.token, 'tok');
      expect(entity.data?.expiresIn, 3600);
    });

    test('null data yields null entity data', () {
      final model = RegisterModel(status: false);

      final entity = model.toEntity();

      expect(entity.status, isFalse);
      expect(entity.data, isNull);
    });
  });

  group('RegisterDataModelMapper.toEntity', () {
    test('maps token, expiresIn, and nested user', () {
      const model = RegisterDataModel(
        token: 'tok',
        expiresIn: 100,
        userResponse: RegisterUserModel(uuid: 'u1', email: 'new@b.com'),
      );

      final entity = model.toEntity();

      expect(entity.token, 'tok');
      expect(entity.expiresIn, 100);
      expect(entity.user?.uuid, 'u1');
      expect(entity.user?.email, 'new@b.com');
    });

    test('null userResponse yields null entity user', () {
      const model = RegisterDataModel(token: 'tok');

      final entity = model.toEntity();

      expect(entity.user, isNull);
    });
  });

  group('RegisterUserModelMapper.toEntity', () {
    test('maps every field and parses ISO date strings', () {
      const model = RegisterUserModel(
        uuid: 'u1',
        email: 'new@b.com',
        username: 'newbie',
        role: 'USER',
        createdAt: '2024-05-01T10:00:00.000Z',
        updatedAt: '2024-06-01T10:00:00.000Z',
      );

      final entity = model.toEntity();

      expect(entity.uuid, 'u1');
      expect(entity.email, 'new@b.com');
      expect(entity.username, 'newbie');
      expect(entity.role, 'USER');
      expect(entity.createdAt, DateTime.parse('2024-05-01T10:00:00.000Z'));
      expect(entity.updatedAt, DateTime.parse('2024-06-01T10:00:00.000Z'));
    });

    test(
      'a DateTime value passed through createdAt/updatedAt is kept as-is',
      () {
        final now = DateTime(2024, 1, 1);
        final model = RegisterUserModel(
          uuid: 'u1',
          createdAt: now,
          updatedAt: now,
        );

        final entity = model.toEntity();

        expect(entity.createdAt, now);
        expect(entity.updatedAt, now);
      },
    );

    test('null and unparsable date values yield null', () {
      const nullModel = RegisterUserModel(uuid: 'u1');
      const badModel = RegisterUserModel(uuid: 'u1', createdAt: 'not-a-date');

      expect(nullModel.toEntity().createdAt, isNull);
      expect(badModel.toEntity().createdAt, isNull);
    });
  });
}
