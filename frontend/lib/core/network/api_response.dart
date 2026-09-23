import '../error/exceptions.dart';

ResponseData<T> decodeApiResponse<T>(
  Object? json,
  T Function(Object?) fromJsonT,
) {
  if (json is! Map<String, dynamic>) {
    throw const UnknownException('Malformed response');
  }
  return ApiResponse<T>.fromJson(json, fromJsonT).response;
}

/// The envelope returned by Pantau endpoints.
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.response,
    required this.errors,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final errors = (json['errors'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .map(ErrorDetail.fromJson)
        .toList(growable: false);
    if (json['success'] != true) {
      throw UnknownException(
        errors.isEmpty ? 'Request failed' : errors.first.message,
      );
    }

    final body = json['response'];
    if (body is! Map<String, dynamic>) {
      throw const UnknownException('Malformed response');
    }
    return ApiResponse<T>(
      success: true,
      response: ResponseData<T>.fromJson(body, fromJsonT),
      errors: errors,
    );
  }

  final bool success;
  final ResponseData<T> response;
  final List<ErrorDetail> errors;
}

class ResponseData<T> {
  const ResponseData({this.data, this.pagination});

  factory ResponseData.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final rawPagination = json['pagination'];
    return ResponseData<T>(
      data: json['data'] == null ? null : fromJsonT(json['data']),
      pagination: rawPagination is Map<String, dynamic>
          ? Pagination.fromJson(rawPagination)
          : null,
    );
  }

  final T? data;
  final Pagination? pagination;

  T requireData() {
    final value = data;
    if (value == null) throw const UnknownException('Missing response data');
    return value;
  }
}

class Pagination {
  const Pagination({
    required this.page,
    required this.limit,
    required this.offset,
    required this.total,
    required this.totalPages,
    required this.hasNext,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json['page'] as int? ?? 0,
    limit: json['limit'] as int? ?? 0,
    offset: json['offset'] as int? ?? 0,
    total: json['total'] as int? ?? 0,
    totalPages: json['total_pages'] as int? ?? 0,
    hasNext: json['has_next'] as bool? ?? false,
  );

  final int page;
  final int limit;
  final int offset;
  final int total;
  final int totalPages;
  final bool hasNext;
}

class ErrorDetail {
  const ErrorDetail({this.code, this.field, required this.message});

  factory ErrorDetail.fromJson(Map<String, dynamic> json) => ErrorDetail(
    code: json['code'] as int?,
    field: json['field'] as String?,
    message: json['message'] as String? ?? 'Request failed',
  );

  final int? code;
  final String? field;
  final String message;
}
