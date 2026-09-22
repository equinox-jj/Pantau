import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local_storage/local_storage.dart';
import '../network/interceptors/interceptors.dart';
import '../network/network.dart';
import '../router/router.dart';
import '../service/service.dart';

part 'core_di.g.dart';

@Riverpod(keepAlive: true)
SessionManager sessionManager(Ref ref) {
  return SessionManager();
}

@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref) {
  final authInterceptor = ref.watch(authInterceptorProvider);

  return DioClient(authInterceptor: authInterceptor);
}

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final sessionManager = ref.watch(sessionManagerProvider);
  final userProfileStorage = ref.watch(userProfileStorageProvider);

  return AuthInterceptor(tokenStorage, sessionManager, userProfileStorage);
}

@Riverpod(keepAlive: true)
TokenStorage tokenStorage(Ref ref) {
  final secureStorage = ref.watch(secureStorageProvider);

  return SecureTokenStorageImpl(secureStorage);
}

@Riverpod(keepAlive: true)
UserProfileStorage userProfileStorage(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return LocalUserProfileStorage(prefs);
}

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError(
    'sharedPreferencesProvider must be overridden in main() with a real '
    'SharedPreferences instance.',
  );
}

@Riverpod(keepAlive: true)
LocalPref localPref(Ref ref) {
  final prefs = ref.watch(sharedPreferencesProvider);

  return LocalPref(prefs);
}

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) {
  return const GeolocatorLocationService();
}
