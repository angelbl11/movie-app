import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/providers/favorite_movie_controller.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/presentation/details/details_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMovieControllerProvider);
    const imageUrl = String.fromEnvironment('IMAGE_URL');

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: Container(
        decoration: BoxDecoration(
          gradient: Theme.of(context).brightness == Brightness.dark
              ? AppTheme.surfaceGradient
              : AppTheme.lightSurfaceGradient,
        ),
        child: favorites.when(
          data: (movies) {
            if (movies.isEmpty) {
              return const Center(child: Text('No favorite movies yet'));
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(movieId: movie.id),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black.withValues(alpha: 0.1)
                              : Colors.grey.withValues(alpha: 0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Dismissible(
                      key: Key(movie.id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) {
                        ref
                            .read(favoriteMovieControllerProvider.notifier)
                            .toggleFavorite(movie);
                      },
                      background: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient:
                                Theme.of(context).brightness == Brightness.dark
                                ? AppTheme.surfaceGradient
                                : AppTheme.lightSurfaceGradient,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 150,
                                child: movie.posterPath.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            '$imageUrl${movie.posterPath}',
                                        fit: BoxFit.cover,
                                        errorWidget:
                                            (context, error, stackTrace) =>
                                                _buildErrorContainer(),
                                      )
                                    : _buildErrorContainer(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppTheme.darkAccent.color,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            movie.voteAverage.toStringAsFixed(
                                              1,
                                            ),
                                            style: AppTheme.caption.copyWith(
                                              color: AppTheme.darkAccent.color,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            DateFormat(
                                              'MMM dd, yyyy',
                                            ).format(movie.releaseDate),
                                            style: AppTheme.caption,
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: Icon(
                                              Icons.favorite,
                                              color: AppTheme.darkAccent.color,
                                            ),
                                            onPressed: () {
                                              ref
                                                  .read(
                                                    favoriteMovieControllerProvider
                                                        .notifier,
                                                  )
                                                  .toggleFavorite(movie);
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        movie.overview,
                                        style: AppTheme.caption.copyWith(
                                          color:
                                              Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white70
                                              : Colors.black87,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          loading: () =>
              const CustomLoading(loadingText: 'Loading favorites...'),
          error: (error, _) => CustomError(
            error: error.toString(),
            title: 'Error loading favorites',
          ),
        ),
      ),
    );
  }

  Widget _buildErrorContainer() {
    return Container(
      decoration: BoxDecoration(gradient: AppTheme.surfaceGradient),
      child: const Icon(Icons.movie, size: 40, color: Colors.white54),
    );
  }
}
