import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/features/profile/di/profile_di.dart';
import 'package:pantau/features/profile/domain/usecase/usecase.dart';

part 'change_password_notifier.g.dart';

/// `AsyncData(true)` means the password was changed and the listener may
/// sign the user out so they log in again with the new password.
@riverpod
class ChangePassword extends _$ChangePassword {
  @override
  AsyncValue<bool> build() => const AsyncData(false);

  Future<void> submit({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();

    final usecase = ref.read(changePasswordUsecaseProvider);
    final result = await usecase(
      ChangePasswordParams(
        currentPassword: currentPassword,
        newPassword: newPassword,
      ),
    );

    state = result.fold(
      (failure) => AsyncError(failure, StackTrace.current),
      (_) => const AsyncData(true),
    );
  }
}
