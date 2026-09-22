import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/data/datasources/resolver_remote_datasource.dart';
import 'package:pantau/features/resolver/data/model/resolver_model.dart';
import 'package:pantau/features/resolver/data/repository/resolver_repository_impl.dart';

class MockResolverRemoteDataSource extends Mock
    implements ResolverRemoteDataSource {}

void main() {
  late MockResolverRemoteDataSource dataSource;
  late ResolverRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(QueueTab.open);
  });

  setUp(() {
    dataSource = MockResolverRemoteDataSource();
    repository = ResolverRepositoryImpl(resolverRemoteDataSource: dataSource);
  });

  group('getQueue', () {
    test('returns Right of the mapped entity on success', () async {
      when(
        () => dataSource.getQueue(
          tab: any(named: 'tab'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusMeter: any(named: 'radiusMeter'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer(
        (_) async => const QueueModel(
          data: QueueDataModel(
            items: [QueueReportDataModel(id: 'q1', status: 'reported')],
            counts: QueueCountsModel(open: 1),
            meta: QueueMetaModel(hasNext: true),
          ),
        ),
      );

      final result = await repository.getQueue(
        tab: QueueTab.open,
        latitude: -6.2,
        longitude: 106.8,
      );

      expect(result.isRight(), isTrue);
      result.fold((l) => fail('expected Right, got Left($l)'), (r) {
        expect(r.items.single.id, 'q1');
        expect(r.counts.open, 1);
        expect(r.hasNext, isTrue);
      });
    });

    test('forwards every param to the data source', () async {
      when(
        () => dataSource.getQueue(
          tab: any(named: 'tab'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusMeter: any(named: 'radiusMeter'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenAnswer((_) async => const QueueModel());

      await repository.getQueue(
        tab: QueueTab.inProgress,
        latitude: 1,
        longitude: 2,
        radiusMeter: 3000,
        limit: 30,
        offset: 10,
      );

      verify(
        () => dataSource.getQueue(
          tab: QueueTab.inProgress,
          latitude: 1,
          longitude: 2,
          radiusMeter: 3000,
          limit: 30,
          offset: 10,
        ),
      ).called(1);
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(
        () => dataSource.getQueue(
          tab: any(named: 'tab'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusMeter: any(named: 'radiusMeter'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(const NetworkException());

      final result = await repository.getQueue(
        tab: QueueTab.open,
        latitude: 0,
        longitude: 0,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, isA<NetworkFailure>()),
        (r) => fail('expected Left, got Right($r)'),
      );
    });

    test('maps a ServerException into a matching ServerFailure', () async {
      when(
        () => dataSource.getQueue(
          tab: any(named: 'tab'),
          latitude: any(named: 'latitude'),
          longitude: any(named: 'longitude'),
          radiusMeter: any(named: 'radiusMeter'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(const ServerException(500, 'boom'));

      final result = await repository.getQueue(
        tab: QueueTab.open,
        latitude: 0,
        longitude: 0,
      );

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.server(500, 'boom'))),
        (r) => fail('expected Left, got Right($r)'),
      );
    });
  });
}
