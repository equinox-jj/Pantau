// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The seeded category taxonomy.
///
/// Lives above the pages because two of them need it: the compose form's
/// category selector and the map's filter chips.

@ProviderFor(reportCategories)
final reportCategoriesProvider = ReportCategoriesProvider._();

/// The seeded category taxonomy.
///
/// Lives above the pages because two of them need it: the compose form's
/// category selector and the map's filter chips.

final class ReportCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReportCategory>>,
          List<ReportCategory>,
          FutureOr<List<ReportCategory>>
        >
    with
        $FutureModifier<List<ReportCategory>>,
        $FutureProvider<List<ReportCategory>> {
  /// The seeded category taxonomy.
  ///
  /// Lives above the pages because two of them need it: the compose form's
  /// category selector and the map's filter chips.
  ReportCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportCategoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<ReportCategory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReportCategory>> create(Ref ref) {
    return reportCategories(ref);
  }
}

String _$reportCategoriesHash() => r'08fdeeb9ce02f5a099c3bfd929f59551e89a5c9c';
