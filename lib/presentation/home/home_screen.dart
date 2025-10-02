import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/theme_toggle_button.dart';
import 'package:movie_app/presentation/widgets/popular_movies.dart';
import 'package:movie_app/presentation/widgets/search_results_list.dart';
import 'package:movie_app/providers/movie_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String searchQuery = '';
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieAsyncValue = ref.watch(movieControllerProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [const ThemeToggleButton(), const SizedBox(width: 8)],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SearchBar(
                controller: searchController,
                hintText: 'Search for a movie...',
                onSubmitted: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                  ref
                      .read(movieControllerProvider.notifier)
                      .searchMovies(value);
                },

                leading: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                ),
                trailing: [
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      searchController.clear();
                      setState(() {
                        searchQuery = '';
                      });
                      ref.invalidate(movieControllerProvider);
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: movieAsyncValue.when(
                data: (movieModel) {
                  if (searchQuery.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Results for '$searchQuery'",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        Expanded(
                          child: SearchResultsList(movieModel: movieModel),
                        ),
                      ],
                    );
                  }

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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                          strokeWidth: 3,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Loading movies...',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
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
