import '../../../../core/base/base.dart';
import '../../../../core/network/network.dart';
import '../model/model.dart';

abstract class ReportRemoteDataSource with BaseRemoteDataSource {
  /// Reports within [radiusInMeters] of the point, nearest first.
  Future<FeedReportsModel> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });

  /// The caller's own reports, newest first. Paged, so the rows arrive under
  /// `data.items` rather than as `data` itself.
  Future<MyReportsModel> getMyReports({int limit, int offset});
}

class ReportRemoteDataSourceImpl extends ReportRemoteDataSource {
  ReportRemoteDataSourceImpl({required this._dioClient});

  final DioClient _dioClient;

  @override
  Future<FeedReportsModel> getFeedReports({
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

    return FeedReportsModel.fromJson(response.data);
  });

  @override
  Future<MyReportsModel> getMyReports({int limit = 50, int offset = 0}) =>
      safeApiCall(() async {
        final response = await _dioClient.get(
          ApiEndpoints.myReports,
          queryParameters: {'limit': limit, 'offset': offset},
        );

        return MyReportsModel.fromJson(response.data);
      });
}
