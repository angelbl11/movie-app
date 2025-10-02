// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteMovieController)
const favoriteMovieControllerProvider = FavoriteMovieControllerProvider._();

final class FavoriteMovieControllerProvider
    extends $AsyncNotifierProvider<FavoriteMovieController, List<MovieLocal>> {
  const FavoriteMovieControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMovieControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMovieControllerHash();

  @$internal
  @override
  FavoriteMovieController create() => FavoriteMovieController();
}

String _$favoriteMovieControllerHash() =>
    r'b3fbe41f08d7f4e3d144795d6fc92d110672102b';

abstract class _$FavoriteMovieController
    extends $AsyncNotifier<List<MovieLocal>> {
  FutureOr<List<MovieLocal>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<MovieLocal>>, List<MovieLocal>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MovieLocal>>, List<MovieLocal>>,
              AsyncValue<List<MovieLocal>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
