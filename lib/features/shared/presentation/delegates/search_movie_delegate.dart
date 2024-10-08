import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

  final SearchMovieCallback searchMovies;
  List<Movie> initialMovies;

  StreamController<bool> isLoadingStream = StreamController.broadcast();
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debounceTimer;

  void clearStreams() {
    debouncedMovies.close();
    isLoadingStream.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        final movies = await searchMovies(query);
        initialMovies = movies;
        if (!debouncedMovies.isClosed) {
          debouncedMovies.add(movies);
        }
        if (!isLoadingStream.isClosed) {
          isLoadingStream.add(false);
        }
      },
    );
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      stream: debouncedMovies.stream,
      initialData: initialMovies,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            onMovieSelected: (context, movie) {
              clearStreams();
              close(context, movie);
            },
          ),
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;

          return isLoading
              ? SpinPerfect(
                  infinite: true,
                  child: IconButton(
                      onPressed: () => query = '',
                      icon: const Icon(Icons.refresh_rounded)))
              : FadeIn(
                  animate: query.isNotEmpty,
                  child: IconButton(
                      onPressed: () => query = '',
                      icon: const Icon(Icons.clear)));
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => {clearStreams(), close(context, null)},
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({
    required this.movie,
    required this.onMovieSelected,
  });

  final Movie movie;
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.titleMedium,
                  ),
                  movie.overview.length > 100
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  MovieRating(
                    voteAverage: movie.voteAverage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
