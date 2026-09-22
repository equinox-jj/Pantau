import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'create_report_notifier.g.dart';

/// Submits a report. The photos (1-4) ride along as file parts of the same
/// multipart request (see `docs/API_REQUEST.md`), so this is one call and the
/// page derives its progress copy from [AsyncValue.isLoading].
@riverpod
class CreateReport extends _$CreateReport {
  @override
  AsyncValue<ReportDetail?> build() => const AsyncData(null);

  Future<void> submit({
    required List<String> photoPaths,
    required int categoryId,
    required String description,
    required double latitude,
    required double longitude,
  }) async {
    state = const AsyncLoading();

    final result = await ref.read(createReportUsecaseProvider)(
      CreateReportParams(
        categoryId: categoryId,
        description: description,
        photoPaths: photoPaths,
        latitude: latitude,
        longitude: longitude,
      ),
    );
    if (!ref.mounted) return;

    result.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (r) => state = AsyncData(r),
    );
  }
}
