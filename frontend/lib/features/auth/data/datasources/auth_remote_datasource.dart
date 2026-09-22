import 'package:dio/dio.dart';
import 'package:pantau/features/auth/data/model/model.dart';

import '../../../../core/base/base.dart';
import '../../../../core/network/network.dart';

abstract class AuthRemoteDataSource with BaseRemoteDataSource {
  Future<RegisterModel> register({
    required String email,
    required String password,
    required String displayName,
  });
  Future<LoginModel> login({required String email, required String password});

  Future<UserProfileModel> getMe();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<LoginModel> login({required String email, required String password}) =>
      safeApiCall(() async {
        final response = await _dioClient.post(
          ApiEndpoints.login,
          data: {'email': email, 'password': password},
          options: Options(extra: {ApiEndpoints.kNoAuth: true}),
        );

        return LoginModel.fromJson(response.data);
      });

  @override
  Future<RegisterModel> register({
    required String email,
    required String password,
    required String displayName,
  }) => safeApiCall(() async {
    final response = await _dioClient.post(
      ApiEndpoints.register,
      data: {'email': email, 'password': password, 'display_name': displayName},
      options: Options(extra: {ApiEndpoints.kNoAuth: true}),
    );

    return RegisterModel.fromJson(response.data);
  });

  @override
  Future<UserProfileModel> getMe() => safeApiCall(() async {
    final response = await _dioClient.get(ApiEndpoints.me);

    return UserProfileModel.fromJson(response.data);
  });
}
