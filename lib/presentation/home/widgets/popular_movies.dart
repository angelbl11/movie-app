import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/core/theme/theme.dart';
import 'package:movie_app/presentation/details/details_screen.dart';

class PopularMovieCarrousel extends StatelessWidget {
  final MovieModel movieModel;
  const PopularMovieCarrousel({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    const imageUrl = String.fromEnvironment('IMAGE_URL');
    return CarouselSlider.builder(
      itemCount: movieModel.results.length,
      options: CarouselOptions(
        height: 500,
        aspectRatio: 16 / 9,
        viewportFraction: 0.85,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (context, index, realIndex) {
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
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  movie.posterPath != null && movie.posterPath!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: '$imageUrl${movie.posterPath}',
                          fit: BoxFit.contain,
                          errorWidget: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: AppTheme.surfaceGradient,
                              ),
                              child: const Icon(
                                Icons.movie,
                                size: 50,
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
                            size: 50,
                            color: Colors.white54,
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.9),
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            movie.title,
                            style: AppTheme.subtitle1,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
