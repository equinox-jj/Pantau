import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../error/error_mapper.dart';
import '../error/exceptions.dart';

/// Centralizes DioException-to-AppException translation. Data sources wrap
/// each request in [safeApiCall].
mixin BaseRemoteDataSource {
  /// Runs [request], translating any [DioException] into its [AppException].
  /// [AppException]s pass through; anything else becomes [UnknownException].
  Future<T> safeApiCall<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw mapDioException(e);
    } on AppException {
      rethrow;
    } catch (e, stackTrace) {
      // Raw errors aren't user-facing; keep them in the log only.
      debugPrint('safeApiCall: $e\n$stackTrace');
      throw const UnknownException();
    }
  }
}
