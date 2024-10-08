import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';

class PopularsView extends StatefulWidget {
  static const name = 'populars-view';
  const PopularsView({super.key});

  @override
  State<PopularsView> createState() => _PopularsViewState();
}

class _PopularsViewState extends State<PopularsView> {
  Future<void> loadNextPage(BuildContext context) async {
    await context.read<MoviesCubit>().loadNextPagePopular();
  }

  @override
  void initState() {
    super.initState();
    loadNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MoviesCubit>().state.popularMovies;

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
            const Text(
              "No hay películas populares",
              style: TextStyle(fontSize: 20, color: Colors.black45),
            ),
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
