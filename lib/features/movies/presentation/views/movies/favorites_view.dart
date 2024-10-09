import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:cine_world/features/movies/presentation/cubits/storage/storage_movies_cubit.dart';

class FavoritesView extends StatefulWidget {
  static const name = 'favorites-view';
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  Future<void> loadNextPage(BuildContext context) async {
    await context.read<StorageMoviesCubit>().loadNextPage();
  }

  @override
  void initState() {
    super.initState();
    loadNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<StorageMoviesCubit>().getFavoriteMovies;

    if (movies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_sharp,
              color: colors.primary,
              size: 60,
            ),
            Text(
              'Ohhh no!',
              style: TextStyle(fontSize: 30, color: colors.primary),
            ),
            Text(
              "You have no saved movies",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(140, colors.secondary.red,
                      colors.secondary.green, colors.secondary.blue)),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonal(
                onPressed: () => context.go('/'),
                child: const Text("Start searching"))
          ],
        ),
      );
    }

    return Scaffold(
        body: MovieMasonry(
      movies: movies,
      loadNextPage: loadNextPage,
    ));
  }
}
