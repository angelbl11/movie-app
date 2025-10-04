// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_dio_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomDioController)
const customDioControllerProvider = CustomDioControllerProvider._();

final class CustomDioControllerProvider
    extends $NotifierProvider<CustomDioController, Dio> {
  const CustomDioControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customDioControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customDioControllerHash();

  @$internal
  @override
  CustomDioController create() => CustomDioController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$customDioControllerHash() =>
    r'5883e09fcc29da76cd702be673a2b73a69e09b31';

abstract class _$CustomDioController extends $Notifier<Dio> {
  Dio build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Dio, Dio>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Dio, Dio>,
              Dio,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
