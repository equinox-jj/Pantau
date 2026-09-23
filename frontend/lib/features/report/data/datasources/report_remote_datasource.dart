import '../../../../core/base/base.dart';
import '../../../../core/network/network.dart';
import '../model/model.dart';

abstract class ReportRemoteDataSource with BaseRemoteDataSource {
  /// Reports within [radiusInMeters] of the point, nearest first.
  Future<List<FeedReportsDataModel>> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });

  /// The caller's own reports, newest first.
  Future<List<FeedReportsDataModel>> getMyReports({int limit, int offset});
}

class ReportRemoteDataSourceImpl extends ReportRemoteDataSource {
  ReportRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<List<FeedReportsDataModel>> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit = 50,
  }) => safeApiCall(() async {
    final response = await _dioClient.get(
      ApiEndpoints.nearbyReports,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'radius_meter': radiusInMeters,
        'limit': limit,
      },
    );

    return decodeApiResponse(
          response.data,
          (json) => (json as List<dynamic>)
              .map(
                (item) =>
                    FeedReportsDataModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(growable: false),
        ).data ??
        const [];
  });

  @override
  Future<List<FeedReportsDataModel>> getMyReports({
    int limit = 50,
    int offset = 0,
  }) => safeApiCall(() async {
    final response = await _dioClient.get(
      ApiEndpoints.myReports,
      queryParameters: {'limit': limit, 'offset': offset},
    );

    return decodeApiResponse(
          response.data,
          (json) => (json as List<dynamic>)
              .map(
                (item) =>
                    FeedReportsDataModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(growable: false),
        ).data ??
        const [];
  });
}
