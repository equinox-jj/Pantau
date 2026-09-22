import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user.freezed.dart';

/// The signed-in user's identity, cached locally so it survives an app
/// restart — unlike [LoginUser]/[RegisterUser], which only live as long as
/// their own API response.
@freezed
abstract class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    String? uuid,
    String? email,
    String? username,
    String? role,
    DateTime? createdAt,
    String? displayName,
    int? reportsCount,
    int? resolvedCount,
  }) = _CurrentUser;
}
