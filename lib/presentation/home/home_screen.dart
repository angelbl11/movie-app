import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/providers/movie_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsyncValue = ref.watch(movieControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: movieAsyncValue.when(
        data: (movieModel) {
          return ListView.builder(
            itemCount: movieModel.results.length,
            itemBuilder: (context, index) {
              final movie = movieModel.results[index];
              return ListTile(
                leading: movie.posterPath.isNotEmpty
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                      )
                    : const SizedBox.shrink(),
                title: Text(movie.title),
                subtitle: Text(
                  movie.releaseDate.toLocal().toString().split(' ')[0],
                ),
              );
            },
          );
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
        error: (error, stack) {
          return Center(child: Text('Error: $error'));
        },
      ),
    );
  }
}
