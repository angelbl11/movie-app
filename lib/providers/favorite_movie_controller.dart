import 'dart:convert';
import 'package:movie_app/data/movie_detail.dart';
import 'package:movie_app/data/movie_local.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_movie_controller.g.dart';

@riverpod
class FavoriteMovieController extends _$FavoriteMovieController {
  final String _storageKey = 'favorite_movies';
  late final SharedPreferences _prefs;

  @override
  Future<List<MovieLocal>> build() async {
    _prefs = await SharedPreferences.getInstance();
    return _loadFavorites();
  }

  Future<List<MovieLocal>> _loadFavorites() async {
    final String? moviesJson = _prefs.getString(_storageKey);
    if (moviesJson == null) return [];

    final List<dynamic> decoded = jsonDecode(moviesJson);
    return decoded.map((json) => _movieFromJson(json)).toList();
  }

  Future<void> toggleFavorite(MovieLocal movie) async {
    state = const AsyncValue.loading();
    try {
      final currentFavorites = await _loadFavorites();
      final isAlreadyFavorite = currentFavorites.any((m) => m.id == movie.id);

      List<MovieLocal> updatedFavorites;
      if (isAlreadyFavorite) {
        updatedFavorites = currentFavorites
            .where((m) => m.id != movie.id)
            .toList();
      } else {
        updatedFavorites = [...currentFavorites, movie];
      }

      final encodedMovies = jsonEncode(
        updatedFavorites.map((movie) => _movieToJson(movie)).toList(),
      );

      await _prefs.setString(_storageKey, encodedMovies);
      state = AsyncValue.data(updatedFavorites);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  bool isFavorite(int movieId) {
    return state.value?.any((movie) => movie.id == movieId) ?? false;
  }

  Map<String, dynamic> _movieToJson(MovieLocal movie) {
    return {
      'id': movie.id,
      'title': movie.title,
      'overview': movie.overview,
      'posterPath': movie.posterPath,
      'releaseDate': movie.releaseDate.toIso8601String(),
      'voteAverage': movie.voteAverage,
      'genres': movie.genres.map((genre) => genre.toJson()).toList(),
    };
  }

  MovieLocal _movieFromJson(Map<String, dynamic> json) {
    return MovieLocal(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['posterPath'],
      releaseDate: DateTime.parse(json['releaseDate']),
      voteAverage: json['voteAverage'],
      genres: (json['genres'] as List)
          .map((genreJson) => Genre.fromJson(genreJson))
          .toList(),
    );
  }
}
