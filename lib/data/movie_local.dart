import 'package:movie_app/data/movie_detail.dart';

class MovieLocal {
  MovieLocal({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
  });

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final double voteAverage;
  final List<Genre> genres;
}
