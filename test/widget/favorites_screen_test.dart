import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/data/movie_detail.dart';
import 'package:movie_app/data/movie_local.dart';
import 'package:movie_app/presentation/details/details_screen.dart';
import 'package:movie_app/presentation/favorites/favorites_screen.dart';
import 'package:movie_app/providers/favorite_movie_controller.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'favorites_screen_test.mocks.dart';

class FakeFavoriteMovieController extends FavoriteMovieController {
  final AsyncValue<List<MovieLocal>> _initialState;
  final List<MovieLocal> toggledMovies = [];

  FakeFavoriteMovieController(this._initialState);

  @override
  Future<List<MovieLocal>> build() async {
    state = _initialState;
    if (_initialState is AsyncData<List<MovieLocal>>) {
      return Future.value(_initialState.value);
    }
    return Completer<List<MovieLocal>>().future;
  }

  @override
  Future<void> toggleFavorite(MovieLocal movie) async {
    toggledMovies.add(movie);
  }
}

@GenerateNiceMocks([MockSpec<NavigatorObserver>()])
void main() {
  final mockMovieLocal = MovieLocal(
    id: 1,
    title: 'Mock Movie Title',
    overview: 'This is a mock overview for the movie.',
    posterPath: '/mock_poster.jpg',
    voteAverage: 8.5,
    releaseDate: DateTime(2025, 10, 02),
    genres: [Genre(id: 28, name: 'Action')],
  );

  group('FavoritesScreen Widget Tests', () {
    testWidgets('should show loading indicator when state is loading', (
      tester,
    ) async {
      // Arrange
      final fakeController = FakeFavoriteMovieController(
        const AsyncValue.loading(),
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            favoriteMovieControllerProvider.overrideWith(() => fakeController),
          ],
          child: const MaterialApp(home: FavoritesScreen()),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CustomLoading), findsOneWidget);
    });

    testWidgets('should show error message when state is error', (
      tester,
    ) async {
      // Arrange
      final fakeController = FakeFavoriteMovieController(
        AsyncValue.error('Error', StackTrace.empty),
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            favoriteMovieControllerProvider.overrideWith(() => fakeController),
          ],
          child: const MaterialApp(home: FavoritesScreen()),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CustomError), findsOneWidget);
    });

    testWidgets('should show empty message when there are no favorites', (
      tester,
    ) async {
      // Arrange
      final fakeController = FakeFavoriteMovieController(
        const AsyncValue.data([]),
      );
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            favoriteMovieControllerProvider.overrideWith(() => fakeController),
          ],
          child: const MaterialApp(home: FavoritesScreen()),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('No favorite movies yet'), findsOneWidget);
    });

    testWidgets(
      'should display a list of favorite movies when data is available',
      (tester) async {
        // Arrange
        final fakeController = FakeFavoriteMovieController(
          AsyncValue.data([mockMovieLocal]),
        );

        // Act
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            ProviderScope(
              overrides: [
                favoriteMovieControllerProvider.overrideWith(
                  () => fakeController,
                ),
              ],
              child: const MaterialApp(home: FavoritesScreen()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Assert
        expect(find.byType(ListView), findsOneWidget);
        expect(find.text('Mock Movie Title'), findsOneWidget);
      },
    );

    testWidgets('should call toggleFavorite when a movie is dismissed', (
      tester,
    ) async {
      // Arrange
      final fakeController = FakeFavoriteMovieController(
        AsyncValue.data([mockMovieLocal]),
      );

      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          ProviderScope(
            overrides: [
              favoriteMovieControllerProvider.overrideWith(
                () => fakeController,
              ),
            ],
            child: const MaterialApp(home: FavoritesScreen()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act
      await tester.drag(find.byType(Dismissible), const Offset(-500.0, 0.0));
      await tester.pumpAndSettle();

      // Assert
      expect(fakeController.toggledMovies.length, 1);
      expect(fakeController.toggledMovies.first.id, mockMovieLocal.id);
    });

    testWidgets('should navigate to details screen on tap', (tester) async {
      // Arrange
      final mockObserver = MockNavigatorObserver();
      final fakeController = FakeFavoriteMovieController(
        AsyncValue.data([mockMovieLocal]),
      );

      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          ProviderScope(
            overrides: [
              favoriteMovieControllerProvider.overrideWith(
                () => fakeController,
              ),
            ],
            child: MaterialApp(
              home: const FavoritesScreen(),
              navigatorObservers: [mockObserver],
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Act
      await tester.tap(find.text('Mock Movie Title'));
      await tester.pumpAndSettle();

      // Assert
      verify(mockObserver.didPush(any, any));
      expect(find.byType(MovieDetailsScreen), findsOneWidget);
    });
  });
}
