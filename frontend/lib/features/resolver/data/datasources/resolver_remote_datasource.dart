import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/network/network.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/resolver/data/model/resolver_model.dart';

abstract class ResolverRemoteDataSource with BaseRemoteDataSource {
  /// Reports waiting on the resolver within [radiusMeter] of the point,
  /// filtered to [tab] and nearest first.
  Future<ResponseData<QueueModel>> getQueue({
    required QueueTab tab,
    required double latitude,
    required double longitude,
    int radiusMeter,
    int limit,
    int offset,
  });
}
