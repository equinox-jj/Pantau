import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

class MockMapRepository extends Mock implements MapRepository {}

void main() {
  late MockMapRepository repository;
  late GetReportHistoryUsecase usecase;

  setUp(() {
    repository = MockMapRepository();
    usecase = GetReportHistoryUsecase(mapRepository: repository);
  });

  test('GetReportHistoryParams equatable props include id', () {
    const params = GetReportHistoryParams(id: 'r1');
    expect(params.props, ['r1']);
  });

  test('delegates to repository.getReportHistory with the id', () async {
    const history = [StatusHistoryEntry(id: 's1')];
    when(() => repository.getReportHistory('r1'))
        .thenAnswer((_) async => const Right(history));

    final result = await usecase(const GetReportHistoryParams(id: 'r1'));

    expect(result, const Right<Failure, List<StatusHistoryEntry>>(history));
    verify(() => repository.getReportHistory('r1')).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.getReportHistory('r1'))
        .thenAnswer((_) async => const Left(Failure.unknown('boom')));

    final result = await usecase(const GetReportHistoryParams(id: 'r1'));

    expect(
      result,
      const Left<Failure, List<StatusHistoryEntry>>(Failure.unknown('boom')),
    );
  });
}
