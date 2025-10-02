import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/presentation/details/details_screen.dart';

class SearchResultsList extends StatelessWidget {
  final MovieModel movieModel;
  const SearchResultsList({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    const imageUrl = String.fromEnvironment('IMAGE_URL');

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: movieModel.results.length,
      itemBuilder: (context, index) {
        final movie = movieModel.results[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(movieId: movie.id),
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
                      ? Colors.black.withOpacity(0.1)
                      : Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  gradient: Theme.of(context).brightness == Brightness.dark
                      ? AppTheme.surfaceGradient
                      : AppTheme.lightSurfaceGradient,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 150,
                      child:
                          movie.posterPath != null &&
                              movie.posterPath!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: '$imageUrl${movie.posterPath}',
                              fit: BoxFit.cover,
                              errorWidget: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: AppTheme.surfaceGradient,
                                  ),
                                  child: const Icon(
                                    Icons.movie,
                                    size: 40,
                                    color: Colors.white54,
                                  ),
                                );
                              },
                            )
                          : Container(
                              decoration: BoxDecoration(
                                gradient: AppTheme.surfaceGradient,
                              ),
                              child: const Icon(
                                Icons.movie,
                                size: 40,
                                color: Colors.white54,
                              ),
                            ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: Theme.of(context).textTheme.headlineSmall,
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
                                  movie.voteAverage.toStringAsFixed(1),
                                  style: AppTheme.caption.copyWith(
                                    color: AppTheme.darkAccent.color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  movie.releaseDate != null
                                      ? DateFormat('MMM dd, yyyy').format(
                                          DateTime.parse(movie.releaseDate!),
                                        )
                                      : 'N/A',
                                  style: AppTheme.caption,
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            if (movie.overview.isNotEmpty)
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
        );
      },
    );
  }
}
