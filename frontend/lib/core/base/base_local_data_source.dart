import 'package:flutter/foundation.dart';

import '../error/exceptions.dart';

/// Centralizes cache-error translation for local data sources.
mixin BaseLocalDataSource {
  /// Runs [op]; any throw becomes a [CacheException], and an existing one
  /// passes through unchanged.
  Future<T> safeCacheCall<T>(Future<T> Function() op) async {
    try {
      return await op();
    } on CacheException {
      rethrow;
    } catch (e, stackTrace) {
      // Raw errors aren't user-facing; keep them in the log only.
      debugPrint('safeCacheCall: $e\n$stackTrace');
      throw const CacheException();
    }
  }
}
