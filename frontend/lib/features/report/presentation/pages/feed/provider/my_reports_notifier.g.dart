// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reports_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The caller's own reports, newest first.
///
/// Shares [FeedItem] with the nearby tab so both feed segments render through
/// the same card. Distance is always null here: the list is not anchored to a
/// position, so measuring against the current fix would be meaningless.

@ProviderFor(MyReports)
final myReportsProvider = MyReportsProvider._();

/// The caller's own reports, newest first.
///
/// Shares [FeedItem] with the nearby tab so both feed segments render through
/// the same card. Distance is always null here: the list is not anchored to a
/// position, so measuring against the current fix would be meaningless.
final class MyReportsProvider
    extends $NotifierProvider<MyReports, AsyncValue<List<FeedItem>>> {
  /// The caller's own reports, newest first.
  ///
  /// Shares [FeedItem] with the nearby tab so both feed segments render through
  /// the same card. Distance is always null here: the list is not anchored to a
  /// position, so measuring against the current fix would be meaningless.
  MyReportsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myReportsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myReportsHash();

  @$internal
  @override
  MyReports create() => MyReports();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<FeedItem>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<FeedItem>>>(value),
    );
  }
}

String _$myReportsHash() => r'79df4803820fdc0ad122d3fdd075f457265d2530';

/// The caller's own reports, newest first.
///
/// Shares [FeedItem] with the nearby tab so both feed segments render through
/// the same card. Distance is always null here: the list is not anchored to a
/// position, so measuring against the current fix would be meaningless.

abstract class _$MyReports extends $Notifier<AsyncValue<List<FeedItem>>> {
  AsyncValue<List<FeedItem>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<FeedItem>>, AsyncValue<List<FeedItem>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FeedItem>>,
                AsyncValue<List<FeedItem>>
              >,
              AsyncValue<List<FeedItem>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
