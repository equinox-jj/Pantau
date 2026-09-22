import '../../../../core/base/base.dart';
import '../../../../core/network/network.dart';
import '../../../../core/utils/enums/enums.dart';
import '../model/resolver_model.dart';

abstract class ResolverRemoteDataSource with BaseRemoteDataSource {
  /// Reports waiting on the resolver within [radiusMeter] of the point,
  /// filtered to [tab] and nearest first.
  Future<QueueModel> getQueue({
    required QueueTab tab,
    required double latitude,
    required double longitude,
    int radiusMeter,
    int limit,
    int offset,
  });
}

class ResolverRemoteDataSourceImpl extends ResolverRemoteDataSource {
  ResolverRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<QueueModel> getQueue({
    required QueueTab tab,
    required double latitude,
    required double longitude,
    int radiusMeter = 5000,
    int limit = 20,
    int offset = 0,
  }) => safeApiCall(() async {
    final response = await _dioClient.get(
      ApiEndpoints.queue,
      queryParameters: {
        'tab': tab.slug,
        'latitude': latitude,
        'longitude': longitude,
        'radius_meter': radiusMeter,
        'limit': limit,
        'offset': offset,
      },
    );

    return QueueModel.fromJson(response.data);
  });
}
