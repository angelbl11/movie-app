// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieDetailsController)
const movieDetailsControllerProvider = MovieDetailsControllerFamily._();

final class MovieDetailsControllerProvider
    extends $AsyncNotifierProvider<MovieDetailsController, MovieDetailModel> {
  const MovieDetailsControllerProvider._({
    required MovieDetailsControllerFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieDetailsControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieDetailsControllerHash();

  @override
  String toString() {
    return r'movieDetailsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MovieDetailsController create() => MovieDetailsController();

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailsControllerHash() =>
    r'aff5ba580740c3398727e1a0bb3eefe46e630812';

final class MovieDetailsControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieDetailsController,
          AsyncValue<MovieDetailModel>,
          MovieDetailModel,
          FutureOr<MovieDetailModel>,
          int
        > {
  const MovieDetailsControllerFamily._()
    : super(
        retry: null,
        name: r'movieDetailsControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieDetailsControllerProvider call(int movieId) =>
      MovieDetailsControllerProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieDetailsControllerProvider';
}

abstract class _$MovieDetailsController
    extends $AsyncNotifier<MovieDetailModel> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  FutureOr<MovieDetailModel> build(int movieId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<MovieDetailModel>, MovieDetailModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MovieDetailModel>, MovieDetailModel>,
              AsyncValue<MovieDetailModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
