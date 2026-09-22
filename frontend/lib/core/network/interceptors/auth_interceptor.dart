import 'package:dio/dio.dart';

import '../../local_storage/local_storage.dart';
import '../api_endpoints.dart';
import '../../router/session_manager.dart';

/// Attaches the `x-api-key` header to every request and a
/// `Authorization: Bearer` header unless the request is flagged `noAuth`.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(
    this._tokenStorage,
    this._sessionManager,
    this._userProfileStorage,
  );

  final TokenStorage _tokenStorage;
  final SessionManager _sessionManager;
  final UserProfileStorage _userProfileStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final noAuth = options.extra[ApiEndpoints.kNoAuth] == true;
    if (!noAuth) {
      final token = await _tokenStorage.readAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final noAuth = err.requestOptions.extra[ApiEndpoints.kNoAuth] == true;

    // A 401 here means the stored token is dead: drop it and let the router
    // send the user to login. Excluded on auth endpoints, where a 401 only
    // means wrong credentials.
    if (!noAuth && err.response?.statusCode == 401) {
      await _tokenStorage.clear();
      await _userProfileStorage.clear();
      _sessionManager.notifyExpired();
    }

    handler.next(err);
  }
}
