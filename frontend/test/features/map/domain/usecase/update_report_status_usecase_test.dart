import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(ReportStatus.reported);
  });

  late MockMapRepository repository;
  late UpdateReportStatusUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = UpdateReportStatusUsecase(mapRepository: repository);
  });

  test('UpdateReportStatusParams equatable props include every field', () {
    const params = UpdateReportStatusParams(
      id: 'r1',
      toStatus: ReportStatus.acknowledged,
      note: 'note',
    );
    expect(params.props, ['r1', ReportStatus.acknowledged, 'note']);
  });

  test(
    'delegates to repository.updateReportStatus with the params fields',
    () async {
      const detail = ReportDetail(id: 'r1', status: ReportStatus.acknowledged);
      when(
        () => repository.updateReportStatus(
          id: any(named: 'id'),
          toStatus: any(named: 'toStatus'),
          note: any(named: 'note'),
        ),
      ).thenAnswer((_) async => const Right(detail));

      final result = await usecase(
        const UpdateReportStatusParams(
          id: 'r1',
          toStatus: ReportStatus.acknowledged,
          note: 'Looking into it',
        ),
      );

      expect(result, const Right<Failure, ReportDetail>(detail));
      verify(
        () => repository.updateReportStatus(
          id: 'r1',
          toStatus: ReportStatus.acknowledged,
          note: 'Looking into it',
        ),
      ).called(1);
    },
  );

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.updateReportStatus(
        id: any(named: 'id'),
        toStatus: any(named: 'toStatus'),
        note: any(named: 'note'),
      ),
    ).thenAnswer((_) async => const Left(Failure.forbidden()));

    final result = await usecase(
      const UpdateReportStatusParams(
        id: 'r1',
        toStatus: ReportStatus.acknowledged,
      ),
    );

    expect(result, const Left<Failure, ReportDetail>(Failure.forbidden()));
  });
}
