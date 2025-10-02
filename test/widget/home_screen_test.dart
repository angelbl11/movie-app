import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/data/movie.dart';
import 'package:movie_app/presentation/home/home_screen.dart';
import 'package:movie_app/presentation/home/widgets/popular_movies.dart';
import 'package:movie_app/providers/movie_controller.dart';

class FakeMovieController extends MovieController {
  final AsyncValue<MovieModel> _initialState;

  FakeMovieController(this._initialState);

  @override
  Future<MovieModel> build() async {
    state = _initialState;
    if (_initialState is AsyncData<MovieModel>) {
      return Future.value(_initialState.value);
    }
    return Completer<MovieModel>().future;
  }
}

void main() {
  group('HomeScreen Widget Tests', () {
    testWidgets('should show loading indicator when data is loading', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            movieControllerProvider.overrideWith(
              () => FakeMovieController(const AsyncValue.loading()),
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CustomLoading), findsOneWidget);
    });

    testWidgets('should show error message when data fails to load', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            movieControllerProvider.overrideWith(
              () => FakeMovieController(
                AsyncValue.error('Network error', StackTrace.current),
              ),
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CustomError), findsOneWidget);
    });

    testWidgets('should show movies when data is loaded successfully', (
      WidgetTester tester,
    ) async {
      // Arrange
      final mockMovieModel = MovieModel(
        page: 1,
        results: [
          Result(
            id: 1,
            title: 'Test Movie 1',
            overview: 'Overview 1',
            posterPath: '/path1.jpg',
            voteAverage: 8.0,
            adult: false,
            genreIds: [1],
            originalLanguage: 'en',
            originalTitle: 'Original Title 1',
            popularity: 100.0,
            video: false,
            voteCount: 100,
          ),
        ],
        totalPages: 1,
        totalResults: 1,
      );

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            movieControllerProvider.overrideWith(
              () => FakeMovieController(AsyncValue.data(mockMovieModel)),
            ),
          ],
          child: const MaterialApp(home: HomeScreen()),
        ),
      );
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(PopularMovieCarrousel), findsOneWidget);
    });
  });
}
