import 'package:dio/dio.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/repositories/movie_repository.dart' as repo;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  @override
  Future<MovieModel> build() async {
    return await repo.getMovies(Dio());
  }

  Future<void> searchMovies(String query) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repo.searchMovies(Dio(), query));
  }
}
