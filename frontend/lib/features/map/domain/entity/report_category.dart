import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_category.freezed.dart';

@freezed
abstract class ReportCategory with _$ReportCategory {
  const factory ReportCategory({
    int? id,
    String? name,
    String? slug,
    bool? isActive,
  }) = _ReportCategory;
}
