import 'package:dio/dio.dart';
import 'package:movie_app/data/movie.dart';

const apiUrl = String.fromEnvironment('API_URL', defaultValue: '');
const apiKey = String.fromEnvironment('API_KEY', defaultValue: '');

Future<MovieModel> getMovies() async {
  final res = await Dio().get(
    '${apiUrl}movie/popular',
    queryParameters: {'region': 'MX'},
    options: Options(headers: {'Authorization': 'Bearer $apiKey'}),
  );
  if (res.statusCode == 200) {
    return MovieModel.fromJson(res.data);
  } else {
    throw Exception('Failed to load movies');
  }
}
