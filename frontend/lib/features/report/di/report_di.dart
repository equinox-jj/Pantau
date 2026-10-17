import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/features/report/data/datasources/report_remote_datasource.dart';
import 'package:pantau/features/report/data/repository/report_repository_impl.dart';
import 'package:pantau/features/report/domain/repository/report_repository.dart';
import 'package:pantau/features/report/domain/usecase/usecase.dart';

part 'report_di.g.dart';

@Riverpod(keepAlive: true)
ReportRemoteDataSource reportRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);

  return ReportRemoteDataSourceImpl(dioClient: dioClient);
}

@Riverpod(keepAlive: true)
ReportRepository reportRepository(Ref ref) {
  final reportRemoteDataSource = ref.watch(reportRemoteDataSourceProvider);

  return ReportRepositoryImpl(reportRemoteDataSource: reportRemoteDataSource);
}

@Riverpod(keepAlive: true)
GetFeedReportsUsecase getFeedReportsUsecase(Ref ref) {
  return GetFeedReportsUsecase(
    reportRepository: ref.watch(reportRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetMyReportsUsecase getMyReportsUsecase(Ref ref) {
  return GetMyReportsUsecase(
    reportRepository: ref.watch(reportRepositoryProvider),
  );
}
