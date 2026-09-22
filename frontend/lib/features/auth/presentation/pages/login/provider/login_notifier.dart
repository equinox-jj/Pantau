import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginUser extends _$LoginUser {
  @override
  AsyncValue<Login?> build() => const AsyncData(null);

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    final loginUseCase = ref.read(loginUsecaseProvider);
    final params = LoginParams(email: email, password: password);
    final result = await loginUseCase(params);

    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}
