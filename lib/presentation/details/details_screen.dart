import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/theme_toggle_button.dart';
import 'package:movie_app/providers/movie_details_controller.dart';
import 'package:movie_app/core/theme/theme.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailsControllerProvider(movieId));
    const imageUrl = String.fromEnvironment('IMAGE_URL');

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: movieDetails.when(
        data: (movie) => Container(
          decoration: BoxDecoration(gradient: AppTheme.surfaceGradient),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [ThemeToggleButton()],
                backgroundColor: Colors.transparent,
                expandedHeight: 400,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    movie.title,
                    style: AppTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      movie.posterPath.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: '$imageUrl${movie.posterPath}',
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Container(
                                decoration: BoxDecoration(
                                  gradient: AppTheme.surfaceGradient,
                                ),
                                child: const Icon(
                                  Icons.movie,
                                  size: 50,
                                  color: Colors.white54,
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                gradient: AppTheme.surfaceGradient,
                              ),
                              child: const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.white54,
                              ),
                            ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.darkAccent.color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppTheme.darkAccent.color,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  movie.voteAverage.toStringAsFixed(1),
                                  style: AppTheme.caption.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text('Release', style: AppTheme.caption),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: movie.genres
                            .map(
                              (genre) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.darkAccent.color.withOpacity(
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppTheme.darkAccent.color,
                                  ),
                                ),
                                child: Text(
                                  genre.name,
                                  style: AppTheme.caption.copyWith(
                                    color: AppTheme.darkAccent.color,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Synopsis',
                        style: AppTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.overview,
                        style: AppTheme.caption.copyWith(
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(color: AppTheme.darkAccent.color),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Error loading movie details: ${error.toString()}',
              style: AppTheme.caption.copyWith(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
