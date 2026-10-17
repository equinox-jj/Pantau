import 'package:pantau/core/network/network.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/data/datasources/resolver_remote_datasource.dart';
import 'package:pantau/features/resolver/data/model/resolver_model.dart';

class ResolverRemoteDataSourceImpl extends ResolverRemoteDataSource {
  ResolverRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<ResponseData<QueueModel>> getQueue({
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

    return decodeApiResponse(
      response.data,
      (json) => QueueModel.fromJson(json as Map<String, dynamic>),
    );
  });
}
