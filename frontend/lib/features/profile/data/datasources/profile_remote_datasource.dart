import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;

import '../../../../core/base/base.dart';
import '../../../../core/network/network.dart';
import '../../../auth/data/model/model.dart';

abstract class ProfileRemoteDataSource with BaseRemoteDataSource {
  /// Succeeds with no body (204). A wrong [currentPassword] is a 400.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Adds or replaces the profile picture; returns the updated profile.
  Future<UserProfileModel> uploadAvatar(String filePath);

  /// Clears the profile picture; returns the updated profile.
  Future<UserProfileModel> removeAvatar();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => safeApiCall(() async {
    await _dioClient.patch(
      ApiEndpoints.changePassword,
      data: {'current_password': currentPassword, 'new_password': newPassword},
    );
  });

  @override
  Future<UserProfileModel> uploadAvatar(String filePath) =>
      safeApiCall(() async {
        final formData = FormData();
        formData.files.add(
          MapEntry(
            'avatar',
            await MultipartFile.fromFile(
              filePath,
              filename: p.basename(filePath),
            ),
          ),
        );

        final response = await _dioClient.put(
          ApiEndpoints.avatar,
          data: formData,
          // Same per-request budget as report photos: the global 10s
          // default is too tight for an image on a weak uplink.
          options: Options(
            contentType: 'multipart/form-data',
            sendTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
          ),
        );

        return decodeApiResponse(
          response.data,
          (json) => UserProfileModel.fromJson(json as Map<String, dynamic>),
        ).requireData();
      });

  @override
  Future<UserProfileModel> removeAvatar() => safeApiCall(() async {
    final response = await _dioClient.delete(ApiEndpoints.avatar);

    return decodeApiResponse(
      response.data,
      (json) => UserProfileModel.fromJson(json as Map<String, dynamic>),
    ).requireData();
  });
}
