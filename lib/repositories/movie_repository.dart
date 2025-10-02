import 'package:dio/dio.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/data/movie_detail.dart';

const apiUrl = String.fromEnvironment('API_URL');
const apiKey = String.fromEnvironment('API_KEY');

Future<MovieModel> getMovies() async {
  try {
    final response = await Dio().get(
      '${apiUrl}movie/popular',
      queryParameters: {'region': 'MX'},
      options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movies');
    }
  } on DioException {
    throw Exception('Failed to load movies: API error');
  } catch (e) {
    throw Exception('Failed to load movies: $e');
  }
}

Future<MovieModel> searchMovies(String query) async {
  try {
    final response = await Dio().get(
      '${apiUrl}search/movie',
      queryParameters: {'query': query, 'region': 'MX'},
      options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw Exception('Failed to search movies');
    }
  } on DioException {
    throw Exception('Failed to search movies: API error');
  } catch (e) {
    throw Exception('Failed to search movies: $e');
  }
}

Future<MovieDetailModel> getMovieDetails(int movieId) async {
  try {
    final response = await Dio().get(
      '${apiUrl}movie/$movieId',
      options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
    );
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load movie details');
    }
  } on DioException {
    throw Exception('Failed to load movie details: API error');
  } catch (e) {
    throw Exception('Failed to load movie details: $e');
  }
}
