import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/domain/entity/resolver_entity.dart';
import 'package:pantau/features/resolver/domain/repository/resolver_repository.dart';
import 'package:pantau/features/resolver/domain/usecase/resolver_usecase.dart';

class MockResolverRepository extends Mock implements ResolverRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(QueueTab.open);
  });

  late MockResolverRepository repository;
  late GetQueueUsecase usecase;

  setUp(() {
    repository = MockResolverRepository();
    usecase = GetQueueUsecase(resolverRepository: repository);
  });

  test(
    'GetQueueParams defaults radiusMeter to 5000, limit to 20 and offset to 0',
    () {
      const params = GetQueueParams(
        tab: QueueTab.open,
        latitude: 1,
        longitude: 2,
      );

      expect(params.radiusMeter, 5000);
      expect(params.limit, 20);
      expect(params.offset, 0);
      expect(params.props, [QueueTab.open, 1.0, 2.0, 5000, 20, 0]);
    },
  );

  test('delegates to repository.getQueue with every params field', () async {
    const result = QueueResult(
      items: [QueueReport(id: 'q1')],
      counts: QueueCounts(open: 1),
      hasNext: true,
    );
    when(
      () => repository.getQueue(
        tab: any(named: 'tab'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
        radiusMeter: any(named: 'radiusMeter'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => const Right(result));

    const params = GetQueueParams(
      tab: QueueTab.inProgress,
      latitude: -6.2,
      longitude: 106.8,
      radiusMeter: 1000,
      limit: 30,
      offset: 10,
    );
    final actual = await usecase(params);

    expect(actual, const Right<Failure, QueueResult>(result));
    verify(
      () => repository.getQueue(
        tab: QueueTab.inProgress,
        latitude: -6.2,
        longitude: 106.8,
        radiusMeter: 1000,
        limit: 30,
        offset: 10,
      ),
    ).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.getQueue(
        tab: any(named: 'tab'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
        radiusMeter: any(named: 'radiusMeter'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => const Left(Failure.server(500, 'boom')));

    final result = await usecase(
      const GetQueueParams(tab: QueueTab.open, latitude: 0, longitude: 0),
    );

    expect(
      result,
      const Left<Failure, QueueResult>(Failure.server(500, 'boom')),
    );
  });
}
