import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/widgets/custom_error.dart';
import 'package:movie_app/core/widgets/custom_loading.dart';
import 'package:movie_app/presentation/widgets/search_results_list.dart';
import 'package:movie_app/providers/movie_controller.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final movieAsyncValue = ref.watch(movieControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      searchQuery.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10,
                              ),
                              child: Text(
                                'Search Results for "$searchQuery"',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SearchResultsList(movieModel: movieModel),
                      ),
                    ],
                  );
                },
                error: (error, _) {
                  return CustomError(
                    error: error.toString(),
                    title: 'Error loading movies',
                  );
                },
                loading: () {
                  return CustomLoading(loadingText: 'Loading movies...');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
