import 'package:pantau/core/base/base.dart';
import 'package:pantau/features/auth/data/model/model.dart';

abstract class AuthRemoteDataSource with BaseRemoteDataSource {
  Future<RegisterModel> register({
    required String email,
    required String password,
    required String displayName,
  });
  Future<LoginModel> login({required String email, required String password});

  Future<UserProfileModel> getMe();
}
