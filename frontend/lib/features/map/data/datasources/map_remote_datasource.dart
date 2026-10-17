import 'package:pantau/core/base/base.dart';
import 'package:pantau/features/map/data/model/model.dart';

abstract class MapRemoteDataSource with BaseRemoteDataSource {
  Future<List<NearbyReportsDataModel>> getNearbyReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });
  Future<List<ReportCategoriesDataModel>> getReportCategories();
  Future<ReportDetailModel> getReportDetail(String id);
  Future<List<StatusHistoryEntryModel>> getReportHistory(String id);

  /// Advances a report's status. `toStatus` is the wire value (matches
  /// [ReportStatus.slug] — resolver-only server-side).
  Future<ReportDetailModel> updateReportStatus({
    required String id,
    required String toStatus,
    String? note,
  });

  /// Creates a report. The photos at [photoPaths] (1-4 images) are uploaded
  /// in the same multipart request — the API has no separate upload
  /// endpoint.
  Future<CreateReportModel> createReport({
    required int categoryId,
    required String description,
    required List<String> photoPaths,
    required double latitude,
    required double longitude,
  });

  /// Forward-geocodes [query] through OpenStreetMap Nominatim. [viewBox] is a
  /// pre-formatted `minLon,minLat,maxLon,maxLat` rectangle biasing results.
  Future<List<PlaceModel>> searchPlaces({
    required String query,
    String? viewBox,
    int limit,
  });

  /// Reverse-geocodes a coordinate through OpenStreetMap Nominatim. Returns
  /// null when the point has no addressable feature (open sea, unmapped area).
  Future<PlaceModel?> reverseGeocode({
    required double latitude,
    required double longitude,
  });
}
