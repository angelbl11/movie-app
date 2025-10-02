// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieController)
const movieControllerProvider = MovieControllerProvider._();

final class MovieControllerProvider
    extends $AsyncNotifierProvider<MovieController, MovieModel> {
  const MovieControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'movieControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$movieControllerHash();

  @$internal
  @override
  MovieController create() => MovieController();
}

String _$movieControllerHash() => r'fe9512de5b26f16e13ff0a350c27731407870c82';

abstract class _$MovieController extends $AsyncNotifier<MovieModel> {
  FutureOr<MovieModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<MovieModel>, MovieModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieModel>, MovieModel>,
              AsyncValue<MovieModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
