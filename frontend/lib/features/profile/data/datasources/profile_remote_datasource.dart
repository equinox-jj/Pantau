import 'package:pantau/core/base/base.dart';
import 'package:pantau/features/auth/data/model/model.dart';

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
