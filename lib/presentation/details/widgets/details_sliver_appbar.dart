import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/core/widgets/theme_toggle_button.dart';
import 'package:movie_app/data/movie_detail.dart';
import 'package:movie_app/data/movie_local.dart';
import 'package:movie_app/providers/favorite_movie_controller.dart';

class DetailsSliverAppBar extends ConsumerWidget {
  const DetailsSliverAppBar({
    super.key,
    required this.favorites,
    required this.imageUrl,
    required this.movie,
  });

  final AsyncValue<List<MovieLocal>> favorites;
  final String imageUrl;
  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      actions: [
        IconButton(
          icon: Icon(
            favorites.when(
              data: (favs) => favs.any((m) => m.id == movie.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              loading: () => Icons.favorite_border,
              error: (_, __) => Icons.favorite_border,
            ),
            color: AppTheme.darkAccent.color,
          ),
          onPressed: () {
            final movieLocal = MovieLocal(
              id: movie.id,
              title: movie.title,
              overview: movie.overview,
              posterPath: movie.posterPath,
              releaseDate: movie.releaseDate,
              voteAverage: movie.voteAverage,
              genres: movie.genres,
            );
            ref
                .read(favoriteMovieControllerProvider.notifier)
                .toggleFavorite(movieLocal);
          },
        ),
        ThemeToggleButton(),
      ],
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
                color: Colors.black.withValues(alpha: 0.5),
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
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withValues(alpha: 0.7)
                        : Colors.white.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
