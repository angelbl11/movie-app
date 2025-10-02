import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/presentation/details/widgets/details_movie_info_sliver_adapter.dart';
import 'package:movie_app/presentation/details/widgets/details_sliver_appbar.dart';
import 'package:movie_app/providers/movie_details_controller.dart';
import 'package:movie_app/providers/favorite_movie_controller.dart';
import 'package:movie_app/core/theme/theme.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailsControllerProvider(movieId));
    final favorites = ref.watch(favoriteMovieControllerProvider);
    const imageUrl = String.fromEnvironment('IMAGE_URL');

    return Scaffold(
      body: movieDetails.when(
        data: (movie) => Container(
          decoration: BoxDecoration(
            gradient: Theme.of(context).brightness == Brightness.dark
                ? AppTheme.surfaceGradient
                : AppTheme.lightSurfaceGradient,
          ),
          child: CustomScrollView(
            slivers: [
              DetailsSliverAppBar(
                favorites: favorites,
                imageUrl: imageUrl,
                movie: movie,
              ),
              DetailsMovieInfoSliverAdapter(movie: movie),
            ],
          ),
        ),
        loading: () => CustomLoading(loadingText: 'Loading movie details...'),
        error: (error, _) => CustomError(
          error: error.toString(),
          title: 'Error loading movie details',
        ),
      ),
    );
  }
}
