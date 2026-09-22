import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/base.dart';
import '../../di/di.dart';
import '../../domain/entity/entity.dart';

part 'report_categories_provider.g.dart';

/// The seeded category taxonomy.
///
/// Lives above the pages because two of them need it: the compose form's
/// category selector and the map's filter chips.
@riverpod
Future<List<ReportCategory>> reportCategories(Ref ref) async {
  final usecase = ref.watch(getReportCategoriesUsecaseProvider);
  final result = await usecase(const NoParams());

  return result.fold((failure) => throw failure, (categories) => categories);
}
