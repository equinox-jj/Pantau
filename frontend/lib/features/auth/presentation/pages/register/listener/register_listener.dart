import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/base/base.dart';
import '../../../../../../core/components/dialog/dialog.dart';
import '../../../../../../core/router/app_routes.dart';
import '../../../../../../core/utils/enums/enums.dart';
import '../../../../di/di.dart';
import '../provider/provider.dart';

class RegisterListener extends ConsumerWidget {
  const RegisterListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerUserProvider, (previous, next) {
      switch (next) {
        case AsyncLoading():
          LoadingDialog.show(context);
          break;
        case AsyncData(value: final result?):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text(result.message ?? '')),
            ),
          );
          unawaited(_goToDashboard(context, ref));
          break;
        case AsyncData():
          break;
        case AsyncError(error: final error):
          LoadingDialog.dismiss(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Center(child: Text(error.toString())),
            ),
          );
          break;
      }
    });

    return child;
  }

  /// The API signs the user in on register (token + role persisted by
  /// `AuthRepositoryImpl.register`), so the cached read here is already
  /// up to date — mirrors `LoginListener._goToDashboard`.
  Future<void> _goToDashboard(BuildContext context, WidgetRef ref) async {
    final roleUsecase = ref.read(getCachedRoleUsecaseProvider);
    final roleResult = await roleUsecase(const NoParams());
    final role = roleResult.fold((_) => UserRole.unknown, (role) => role);
    if (!context.mounted) return;

    context.go(
      role == UserRole.resolver
          ? AppRoutes.resolverDashboard
          : AppRoutes.dashboard,
    );
  }
}
