import 'package:movie_app/data/movie.dart';
import 'package:movie_app/repositories/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  @override
  Future<MovieModel> build() async {
    return await getMovies();
  }
}
