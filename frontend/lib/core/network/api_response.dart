/// Generic envelope for a single-object API response.
///
/// Decoupled from json_serializable so the generic `T` can be deserialized
/// through a caller-supplied [fromJsonT] converter.
class ApiResponse<T> {
  const ApiResponse({this.data, this.message, this.statusCode});

  /// Parses [json], decoding the `data` field with [fromJsonT].
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final rawData = json['data'];
    return ApiResponse<T>(
      data: rawData == null ? null : fromJsonT(rawData),
      message: json['message'] as String?,
      statusCode: json['status_code'] as int? ?? json['statusCode'] as int?,
    );
  }

  /// Null when the body carried no `data`.
  final T? data;

  final String? message;
  final int? statusCode;
}

/// Generic envelope for a paginated list response (reqres.in shape).
class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.items,
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });

  /// Parses [json], decoding each element of `data` with [fromJsonT].
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    final rawList = (json['data'] as List<dynamic>? ?? <dynamic>[]);
    return PaginatedResponse<T>(
      items: rawList.map(fromJsonT).toList(),
      page: json['page'] as int? ?? 1,
      perPage: json['per_page'] as int? ?? rawList.length,
      total: json['total'] as int? ?? rawList.length,
      totalPages: json['total_pages'] as int? ?? 1,
    );
  }

  final List<T> items;

  /// 1-based.
  final int page;

  final int perPage;

  /// Across all pages.
  final int total;

  final int totalPages;

  bool get hasNextPage => page < totalPages;
}
