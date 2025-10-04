import 'package:movie_app/core/providers/custom_dio_controller.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/repositories/movie_repository.dart' as repo;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_controller.g.dart';

@riverpod
class MovieController extends _$MovieController {
  @override
  Future<MovieModel> build() async {
    final dio = ref.read(customDioControllerProvider);
    return await repo.getMovies(dio);
  }

  Future<void> searchMovies(String query) async {
    final dio = ref.read(customDioControllerProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repo.searchMovies(dio, query));
  }
}
