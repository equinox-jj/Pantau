import '../../domain/entity/entity.dart';
import '../model/model.dart';
import 'feed_reports_mapper.dart';

extension MyReportsModelMapper on MyReportsModel {
  /// Rows only — the paging counts stop at the data layer.
  List<FeedReport> toEntities() =>
      data?.items?.map((e) => e.toEntity()).toList(growable: false) ?? const [];
}
