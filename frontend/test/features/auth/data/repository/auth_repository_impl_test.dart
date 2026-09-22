import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/local_storage/local_storage.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/auth/data/datasources/datasources.dart';
import 'package:pantau/features/auth/data/model/model.dart';
import 'package:pantau/features/auth/data/repository/repository.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockTokenStorage extends Mock implements TokenStorage {}

class MockUserProfileStorage extends Mock implements UserProfileStorage {}

void main() {
  late MockAuthRemoteDataSource dataSource;
  late MockTokenStorage tokenStorage;
  late MockUserProfileStorage userProfileStorage;
  late AuthRepositoryImpl repository;

  setUp(() {
    dataSource = MockAuthRemoteDataSource();
    tokenStorage = MockTokenStorage();
    userProfileStorage = MockUserProfileStorage();
    repository = AuthRepositoryImpl(
      authRemoteDataSource: dataSource,
      tokenStorage: tokenStorage,
      userProfileStorage: userProfileStorage,
    );

    when(() => tokenStorage.saveTokens(accessToken: any(named: 'accessToken')))
        .thenAnswer((_) async {});
    when(() => userProfileStorage.save(any())).thenAnswer((_) async {});
  });

  group('register', () {
    test('returns Right of the mapped entity and persists token and user on success', () async {
      when(
        () => dataSource.register(
          email: any(named: 'email'),
          password: any(named: 'password'),
          displayName: any(named: 'displayName'),
        ),
      ).thenAnswer(
        (_) async => RegisterModel(
          status: true,
          data: const RegisterDataModel(
            token: 'tok',
            userResponse: RegisterUserModel(
              uuid: 'u1',
              email: 'a@b.com',
              username: 'alice',
              role: 'USER',
            ),
          ),
        ),
      );

      final result = await repository.register(
        email: 'a@b.com',
        password: 'secret',
        displayName: 'Alice',
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.data?.user?.uuid, 'u1'),
      );

      verify(() => tokenStorage.saveTokens(accessToken: 'tok')).called(1);
      final captured =
          verify(() => userProfileStorage.save(captureAny())).captured.single
              as Map<String, dynamic>;
      expect(captured['uuid'], 'u1');
      expect(captured['email'], 'a@b.com');
      expect(captured['username'], 'alice');
      expect(captured['role'], 'USER');
    });

    test('does not persist a token when the response carries none', () async {
      when(
        () => dataSource.register(
          email: any(named: 'email'),
          password: any(named: 'password'),
          displayName: any(named: 'displayName'),
        ),
      ).thenAnswer(
        (_) async => RegisterModel(
          status: true,
          data: const RegisterDataModel(
            userResponse: RegisterUserModel(uuid: 'u1'),
          ),
        ),
      );

      await repository.register(
        email: 'a@b.com',
        password: 'secret',
        displayName: 'Alice',
      );

      verifyNever(
        () => tokenStorage.saveTokens(accessToken: any(named: 'accessToken')),
      );
    });

    test(
      'does not persist a user when the response carries no user data',
      () async {
        when(
          () => dataSource.register(
            email: any(named: 'email'),
            password: any(named: 'password'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer(
          (_) async => RegisterModel(
            status: true,
            data: const RegisterDataModel(token: 'tok'),
          ),
        );

        await repository.register(
          email: 'a@b.com',
          password: 'secret',
          displayName: 'Alice',
        );

        verifyNever(() => userProfileStorage.save(any()));
      },
    );

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.register(
          email: any(named: 'email'),
          password: any(named: 'password'),
          displayName: any(named: 'displayName'),
        ),
      ).thenThrow(
        const ValidationException({
          'email': ['already taken'],
        }),
      );

      final result = await repository.register(
        email: 'a@b.com',
        password: 'secret',
        displayName: 'Alice',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<ValidationFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('login', () {
    test('returns Right of the mapped entity and persists token and user on success', () async {
      when(
        () => dataSource.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => LoginModel(
          status: true,
          data: const LoginDataModel(
            token: 'tok',
            userResponse: LoginUserModel(uuid: 'u1', email: 'a@b.com'),
          ),
        ),
      );

      final result = await repository.login(
        email: 'a@b.com',
        password: 'secret',
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (l) => fail('expected Right, got Left($l)'),
        (r) => expect(r.data?.user?.uuid, 'u1'),
      );
      verify(() => tokenStorage.saveTokens(accessToken: 'tok')).called(1);
      verify(() => userProfileStorage.save(any())).called(1);
    });

    test(
      'leaves any previously cached user untouched when the response has none',
      () async {
        when(
          () => dataSource.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer(
          (_) async => LoginModel(
            status: true,
            data: const LoginDataModel(token: 'tok'),
          ),
        );

        await repository.login(email: 'a@b.com', password: 'secret');

        verifyNever(() => userProfileStorage.save(any()));
      },
    );

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(const UnauthorizedException('Invalid credentials'));

      final result = await repository.login(
        email: 'a@b.com',
        password: 'wrong',
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, const Failure.unauthorized('Invalid credentials')),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('logout', () {
    test(
      'clears token and user profile storage and returns Right(null)',
      () async {
        when(() => tokenStorage.clear()).thenAnswer((_) async {});
        when(() => userProfileStorage.clear()).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result.isRight(), isTrue);
        verify(() => tokenStorage.clear()).called(1);
        verify(() => userProfileStorage.clear()).called(1);
      },
    );

    test('returns Left(Failure) when clearing storage throws', () async {
      when(() => tokenStorage.clear()).thenThrow(const CacheException());

      final result = await repository.logout();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<CacheFailure>()),
        (_) => fail('expected Left, got Right'),
      );
    });
  });

  group('getCurrentUser', () {
    test(
      'returns Right(null) without calling getMe when nothing is cached',
      () async {
        when(() => userProfileStorage.read()).thenAnswer((_) async => null);

        final result = await repository.getCurrentUser();

        expect(result.isRight(), isTrue);
        result.fold(
          (l) => fail('expected Right, got Left($l)'),
          (r) => expect(r, isNull),
        );
        verifyNever(() => dataSource.getMe());
      },
    );

    test(
      'returns the cached user unmodified when getMe has no profile data',
      () async {
        when(() => userProfileStorage.read()).thenAnswer(
          (_) async => {
            'uuid': 'u1',
            'email': 'a@b.com',
            'username': 'alice',
            'role': 'USER',
            'created_at': '2024-01-01T00:00:00.000Z',
          },
        );
        when(() => dataSource.getMe())
            .thenAnswer((_) async => UserProfileModel(status: true));

        final result = await repository.getCurrentUser();

        result.fold((l) => fail('expected Right, got Left($l)'), (r) {
          expect(r?.uuid, 'u1');
          expect(r?.email, 'a@b.com');
          expect(r?.username, 'alice');
          expect(r?.role, 'USER');
          expect(r?.displayName, isNull);
        });
      },
    );

    test(
      'merges profile fields from getMe on top of the cached identity',
      () async {
        when(() => userProfileStorage.read()).thenAnswer(
          (_) async => {
            'uuid': 'u1',
            'email': 'a@b.com',
            'username': 'alice',
            'role': 'USER',
            'created_at': '2024-01-01T00:00:00.000Z',
          },
        );
        when(() => dataSource.getMe()).thenAnswer(
          (_) async => UserProfileModel(
            status: true,
            data: const UserProfileDataModel(
              id: 'u1-server',
              displayName: 'Alice',
              joinedAt: '2024-02-01T00:00:00.000Z',
              reportsCount: 5,
              resolvedCount: 2,
            ),
          ),
        );

        final result = await repository.getCurrentUser();

        result.fold((l) => fail('expected Right, got Left($l)'), (r) {
          expect(r?.uuid, 'u1-server');
          expect(r?.createdAt, DateTime.parse('2024-02-01T00:00:00.000Z'));
          expect(r?.displayName, 'Alice');
          expect(r?.reportsCount, 5);
          expect(r?.resolvedCount, 2);
          // Not returned by /users/me, carried over from the cache.
          expect(r?.email, 'a@b.com');
          expect(r?.username, 'alice');
          expect(r?.role, 'USER');
        });
      },
    );

    test(
      'falls back to the cached uuid/createdAt when the profile omits them',
      () async {
        when(() => userProfileStorage.read()).thenAnswer(
          (_) async => {'uuid': 'u1', 'created_at': '2024-01-01T00:00:00.000Z'},
        );
        when(() => dataSource.getMe()).thenAnswer(
          (_) async => UserProfileModel(
            status: true,
            data: const UserProfileDataModel(displayName: 'Alice'),
          ),
        );

        final result = await repository.getCurrentUser();

        result.fold((l) => fail('expected Right, got Left($l)'), (r) {
          expect(r?.uuid, 'u1');
          expect(r?.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
        });
      },
    );

    test('returns Left(Failure) when getMe throws', () async {
      when(() => userProfileStorage.read())
          .thenAnswer((_) async => {'uuid': 'u1'});
      when(() => dataSource.getMe()).thenThrow(const NetworkException());

      final result = await repository.getCurrentUser();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<NetworkFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });

    test('returns Left(Failure) when reading storage throws', () async {
      when(() => userProfileStorage.read()).thenThrow(const CacheException());

      final result = await repository.getCurrentUser();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<CacheFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });

  group('getCachedRole', () {
    test('returns Right(role) parsed from the cached profile', () async {
      when(() => userProfileStorage.read())
          .thenAnswer((_) async => {'role': 'RESOLVER'});

      final result = await repository.getCachedRole();

      expect(result, const Right<Failure, UserRole>(UserRole.resolver));
    });

    test('returns Right(UserRole.unknown) when nothing is cached', () async {
      when(() => userProfileStorage.read()).thenAnswer((_) async => null);

      final result = await repository.getCachedRole();

      expect(result, const Right<Failure, UserRole>(UserRole.unknown));
    });

    test('returns Left(Failure) when reading storage throws', () async {
      when(() => userProfileStorage.read()).thenThrow(const CacheException());

      final result = await repository.getCachedRole();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<CacheFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });
}
