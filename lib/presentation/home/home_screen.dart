import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/presentation/widgets/popular_movies.dart';
import 'package:movie_app/providers/movie_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(movieControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: movieAsyncValue.when(
                data: (movieModel) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Discover your next favorite movie',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Popular Movies',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        const SizedBox(height: 20),
                        PopularMovieCarrousel(movieModel: movieModel),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
                loading: () {
                  return CustomLoading(loadingText: 'Loading movies...');
                },
                error: (error, stack) {
                  return CustomError(
                    error: error.toString(),
                    title: 'Error loading movies',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
