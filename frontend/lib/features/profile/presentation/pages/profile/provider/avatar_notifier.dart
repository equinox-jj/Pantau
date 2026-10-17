import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/features/auth/di/auth_di.dart';
import 'package:pantau/features/profile/di/profile_di.dart';

part 'avatar_notifier.g.dart';

/// The change a finished avatar request made, so the UI can confirm it.
enum AvatarChange { uploaded, removed }

/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.
@riverpod
class Avatar extends _$Avatar {
  @override
  AsyncValue<AvatarChange?> build() => const AsyncData(null);

  /// [filePath] is null when the picker was cancelled: nothing happens.
  Future<void> upload(String? filePath) async {
    if (filePath == null) return;

    state = const AsyncLoading();
    final result = await ref.read(uploadAvatarUsecaseProvider)(filePath);

    state = result.fold((l) => AsyncError(l, StackTrace.current), (_) {
      ref.invalidate(currentUserProvider);
      return const AsyncData(AvatarChange.uploaded);
    });
  }

  Future<void> remove() async {
    state = const AsyncLoading();
    final result = await ref.read(removeAvatarUsecaseProvider)(
      const NoParams(),
    );

    state = result.fold((l) => AsyncError(l, StackTrace.current), (_) {
      ref.invalidate(currentUserProvider);
      return const AsyncData(AvatarChange.removed);
    });
  }
}
