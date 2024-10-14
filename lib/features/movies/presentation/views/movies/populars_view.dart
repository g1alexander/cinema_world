import 'package:cinema_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_world/features/movies/presentation/cubits/cubits.dart';

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
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
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
