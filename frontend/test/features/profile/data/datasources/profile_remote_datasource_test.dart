import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/features/profile/data/datasources/datasources.dart';

class MockDioClient extends Mock implements DioClient {}

RequestOptions _options() => RequestOptions(path: '/x');

Response<dynamic> _response(Object? data, {int statusCode = 200}) =>
    Response(requestOptions: _options(), statusCode: statusCode, data: data);

Map<String, dynamic> _profile({String? avatarUrl}) => {
  'success': true,
  'response': {
    'data': {'id': 'u1', 'display_name': 'Jane', 'avatar_url': avatarUrl},
  },
};

void main() {
  late MockDioClient dioClient;
  late ProfileRemoteDataSourceImpl dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = ProfileRemoteDataSourceImpl(dioClient: dioClient);
  });

  test(
    'changePassword hits PATCH /users/me/password with snake_case body',
    () async {
      when(
        () => dioClient.patch<dynamic>(
          ApiEndpoints.changePassword,
          data: any(named: 'data'),
        ),
      ).thenAnswer((_) async => _response(null, statusCode: 204));

      await dataSource.changePassword(
        currentPassword: 'oldpass12',
        newPassword: 'newpass34',
      );

      final captured = verify(
        () => dioClient.patch<dynamic>(
          ApiEndpoints.changePassword,
          data: captureAny(named: 'data'),
        ),
      ).captured;
      expect(captured.single, {
        'current_password': 'oldpass12',
        'new_password': 'newpass34',
      });
    },
  );

  test('uploadAvatar sends FormData with one avatar file', () async {
    final dir = await Directory.systemTemp.createTemp('avatar_test');
    addTearDown(() => dir.delete(recursive: true));
    final file = File('${dir.path}/face.png')..writeAsBytesSync([1, 2, 3]);

    when(
      () => dioClient.put<dynamic>(
        ApiEndpoints.avatar,
        data: any(named: 'data'),
        options: any(named: 'options'),
      ),
    ).thenAnswer((_) async => _response(_profile(avatarUrl: 'http://m/a.png')));

    final result = await dataSource.uploadAvatar(file.path);

    expect(result.avatarUrl, 'http://m/a.png');
    final captured = verify(
      () => dioClient.put<dynamic>(
        ApiEndpoints.avatar,
        data: captureAny(named: 'data'),
        options: any(named: 'options'),
      ),
    ).captured;
    final formData = captured.single as FormData;
    expect(formData.files.single.key, 'avatar');
    expect(formData.files.single.value.filename, 'face.png');
  });

  test('removeAvatar parses avatar_url null', () async {
    when(
      () => dioClient.delete<dynamic>(ApiEndpoints.avatar),
    ).thenAnswer((_) async => _response(_profile()));

    final result = await dataSource.removeAvatar();

    expect(result.id, 'u1');
    expect(result.avatarUrl, isNull);
  });

  test('a 400 response throws the mapped AppException', () async {
    when(
      () => dioClient.patch<dynamic>(
        ApiEndpoints.changePassword,
        data: any(named: 'data'),
      ),
    ).thenThrow(
      DioException(
        requestOptions: _options(),
        type: DioExceptionType.badResponse,
        response: _response({
          'success': false,
          'errors': [
            {'code': 400, 'message': 'current password is incorrect'},
          ],
        }, statusCode: 400),
      ),
    );

    expect(
      () => dataSource.changePassword(
        currentPassword: 'wrongpass',
        newPassword: 'newpass34',
      ),
      throwsA(
        isA<AppException>().having(
          (e) => e.message,
          'message',
          'current password is incorrect',
        ),
      ),
    );
  });
}
