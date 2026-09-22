import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/core_di.dart';
import '../data/datasources/datasources.dart';
import '../data/repository/repository.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/usecase.dart';

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
    reportRepository: ref.read(reportRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetMyReportsUsecase getMyReportsUsecase(Ref ref) {
  return GetMyReportsUsecase(
    reportRepository: ref.read(reportRepositoryProvider),
  );
}
