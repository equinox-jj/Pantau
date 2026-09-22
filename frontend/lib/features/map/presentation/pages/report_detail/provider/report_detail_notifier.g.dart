// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Owns everything the report detail screen for [reportId] shows.
///
/// A family rather than a page-global notifier: the id is fixed for the
/// whole life of one detail-screen visit (never re-parameterised in place),
/// so keying by it here is what auto-disposes the right instance when the
/// screen is popped and gives each visit to a different report a clean
/// slate.

@ProviderFor(ReportDetailNotifier)
final reportDetailProvider = ReportDetailNotifierFamily._();

/// Owns everything the report detail screen for [reportId] shows.
///
/// A family rather than a page-global notifier: the id is fixed for the
/// whole life of one detail-screen visit (never re-parameterised in place),
/// so keying by it here is what auto-disposes the right instance when the
/// screen is popped and gives each visit to a different report a clean
/// slate.
final class ReportDetailNotifierProvider
    extends $NotifierProvider<ReportDetailNotifier, ReportDetailPageState> {
  /// Owns everything the report detail screen for [reportId] shows.
  ///
  /// A family rather than a page-global notifier: the id is fixed for the
  /// whole life of one detail-screen visit (never re-parameterised in place),
  /// so keying by it here is what auto-disposes the right instance when the
  /// screen is popped and gives each visit to a different report a clean
  /// slate.
  ReportDetailNotifierProvider._({
    required ReportDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'reportDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reportDetailNotifierHash();

  @override
  String toString() {
    return r'reportDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReportDetailNotifier create() => ReportDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportDetailPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportDetailPageState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportDetailNotifierHash() =>
    r'86da5964ac68d8640016ca22a43bdee37dd65184';

/// Owns everything the report detail screen for [reportId] shows.
///
/// A family rather than a page-global notifier: the id is fixed for the
/// whole life of one detail-screen visit (never re-parameterised in place),
/// so keying by it here is what auto-disposes the right instance when the
/// screen is popped and gives each visit to a different report a clean
/// slate.

final class ReportDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ReportDetailNotifier,
          ReportDetailPageState,
          ReportDetailPageState,
          ReportDetailPageState,
          String
        > {
  ReportDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'reportDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Owns everything the report detail screen for [reportId] shows.
  ///
  /// A family rather than a page-global notifier: the id is fixed for the
  /// whole life of one detail-screen visit (never re-parameterised in place),
  /// so keying by it here is what auto-disposes the right instance when the
  /// screen is popped and gives each visit to a different report a clean
  /// slate.

  ReportDetailNotifierProvider call(String reportId) =>
      ReportDetailNotifierProvider._(argument: reportId, from: this);

  @override
  String toString() => r'reportDetailProvider';
}

/// Owns everything the report detail screen for [reportId] shows.
///
/// A family rather than a page-global notifier: the id is fixed for the
/// whole life of one detail-screen visit (never re-parameterised in place),
/// so keying by it here is what auto-disposes the right instance when the
/// screen is popped and gives each visit to a different report a clean
/// slate.

abstract class _$ReportDetailNotifier extends $Notifier<ReportDetailPageState> {
  late final _$args = ref.$arg as String;
  String get reportId => _$args;

  ReportDetailPageState build(String reportId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ReportDetailPageState, ReportDetailPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReportDetailPageState, ReportDetailPageState>,
              ReportDetailPageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
