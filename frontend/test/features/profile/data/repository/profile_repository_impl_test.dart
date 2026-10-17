import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/data/model/model.dart';
import 'package:pantau/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:pantau/features/profile/data/repository/profile_repository_impl.dart';

class MockProfileRemoteDataSource extends Mock
    implements ProfileRemoteDataSource {}

void main() {
  late MockProfileRemoteDataSource dataSource;
  late ProfileRepositoryImpl repository;

  setUp(() {
    dataSource = MockProfileRemoteDataSource();
    repository = ProfileRepositoryImpl(profileRemoteDataSource: dataSource);
  });

  test('uploadAvatar returns CurrentUser with avatarUrl', () async {
    when(() => dataSource.uploadAvatar('/tmp/a.png')).thenAnswer(
      (_) async =>
          const UserProfileModel(id: 'u1', avatarUrl: 'http://m/a.png'),
    );

    final result = await repository.uploadAvatar('/tmp/a.png');

    result.fold(
      (l) => fail('expected Right, got Left($l)'),
      (r) => expect(r.avatarUrl, 'http://m/a.png'),
    );
  });

  test('changePassword returns Left(Failure) when datasource throws', () async {
    when(
      () => dataSource.changePassword(
        currentPassword: any(named: 'currentPassword'),
        newPassword: any(named: 'newPassword'),
      ),
    ).thenThrow(const BadRequestException('current password is incorrect'));

    final result = await repository.changePassword(
      currentPassword: 'wrongpass',
      newPassword: 'newpass34',
    );

    result.fold((l) => expect(l, isA<Failure>()), (_) => fail('expected Left'));
  });
}
