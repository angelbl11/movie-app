import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/data/movie_detail.dart';
import 'package:movie_app/repositories/movie_repository.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
  });

  group('getMovies', () {
    test('returns a MovieModel on successful API call (200)', () async {
      // Arrange
      final mockResponseData = {
        'results': [],
        'page': 1,
        'total_pages': 1,
        'total_results': 0,
      };
      when(
        mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: mockResponseData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act
      final result = await getMovies(mockDio);
      // Assert
      expect(result, isA<MovieModel>());
    });

    test('throws an Exception on API call failure', () async {
      // Arrange
      when(
        mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
        ),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      // Act & Assert
      expect(() => getMovies(mockDio), throwsA(isA<Exception>()));
    });
  });

  group('searchMovies', () {
    test('returns a MovieModel on successful search', () async {
      // Arrange
      final mockResponseData = {
        'results': [],
        'page': 1,
        'total_pages': 1,
        'total_results': 0,
      };
      when(
        mockDio.get(
          any,
          queryParameters: anyNamed('queryParameters'),
          options: anyNamed('options'),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: mockResponseData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act
      final result = await searchMovies(mockDio, 'Inception');

      // Assert
      expect(result, isA<MovieModel>());
    });
  });

  group('getMovieDetails', () {
    test('returns a MovieDetailModel on successful fetch', () async {
      // Arrange
      final mockResponseData = {
        'adult': false,
        'backdrop_path': '/mock_backdrop.jpg',
        'belongs_to_collection': null,
        'budget': 1000000,
        'genres': [
          {'id': 28, 'name': 'Action'},
        ],
        'homepage': 'https://www.themoviedb.org/movie/1',
        'id': 1,
        'imdb_id': 'tt1234567',
        'origin_country': ['US'],
        'original_language': 'en',
        'original_title': 'Mock Movie Original Title',
        'overview': 'This is a complete mock overview for the movie.',
        'popularity': 123.45,
        'poster_path': '/mock_poster.jpg',
        'production_companies': [
          {
            'id': 1,
            'logo_path': '/logo.png',
            'name': 'Mock Studios',
            'origin_country': 'US',
          },
        ],
        'production_countries': [
          {'iso_3166_1': 'US', 'name': 'United States of America'},
        ],
        'release_date': '2025-10-02',
        'revenue': 5000000,
        'runtime': 120,
        'spoken_languages': [
          {'english_name': 'English', 'iso_639_1': 'en', 'name': 'English'},
        ],
        'status': 'Released',
        'tagline': 'A mock tagline for a mock movie.',
        'title': 'Mock Movie Title',
        'video': false,
        'vote_average': 8.8,
        'vote_count': 1500,
      };

      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: mockResponseData,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      // Act
      final result = await getMovieDetails(mockDio, 1);

      // Assert
      expect(result, isA<MovieDetailModel>());
      expect(result.id, 1);
      expect(result.title, 'Mock Movie Title');
    });
  });
}
