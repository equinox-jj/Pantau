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
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
