// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Splash)
final splashProvider = SplashProvider._();

final class SplashProvider extends $AsyncNotifierProvider<Splash, String> {
  SplashProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashHash();

  @$internal
  @override
  Splash create() => Splash();
}

String _$splashHash() => r'63899778f071e0627a316571ee495c3715cd0592';

abstract class _$Splash extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
