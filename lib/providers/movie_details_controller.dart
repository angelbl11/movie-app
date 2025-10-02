import 'package:movie_app/repositories/movie_repository.dart' as repo;

import 'package:movie_app/data/movie_detail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_controller.g.dart';

@riverpod
class MovieDetailsController extends _$MovieDetailsController {
  @override
  Future<MovieDetailModel> build(int movieId) async {
    return await repo.getMovieDetails(movieId);
  }
}
