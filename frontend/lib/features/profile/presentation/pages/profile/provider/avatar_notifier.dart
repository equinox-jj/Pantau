import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/base/base.dart';
import '../../../../../auth/di/di.dart';
import '../../../../di/di.dart';

part 'avatar_notifier.g.dart';

/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.
@riverpod
class Avatar extends _$Avatar {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// [filePath] is null when the picker was cancelled: nothing happens.
  Future<void> upload(String? filePath) async {
    if (filePath == null) return;

    state = const AsyncLoading();
    final result = await ref.read(uploadAvatarUsecaseProvider)(filePath);

    state = result.fold((l) => AsyncError(l, StackTrace.current), (_) {
      ref.invalidate(currentUserProvider);
      return const AsyncData(null);
    });
  }

  Future<void> remove() async {
    state = const AsyncLoading();
    final result = await ref.read(removeAvatarUsecaseProvider)(
      const NoParams(),
    );

    state = result.fold((l) => AsyncError(l, StackTrace.current), (_) {
      ref.invalidate(currentUserProvider);
      return const AsyncData(null);
    });
  }
}
