import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterUser extends _$RegisterUser {
  @override
  AsyncValue<Register?> build() {
    return const AsyncData(null);
  }

  Future<void> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    state = const AsyncLoading();

    final registerUseCase = ref.read(registerUsecaseProvider);
    final params = RegisterParams(
      email: email,
      password: password,
      displayName: displayName,
    );
    final result = await registerUseCase(params);

    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}
