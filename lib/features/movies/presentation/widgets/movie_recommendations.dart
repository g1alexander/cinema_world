import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MovieRecommendations extends StatefulWidget {
  final String movieId;

  const MovieRecommendations({super.key, required this.movieId});

  @override
  State<MovieRecommendations> createState() => _MovieRecommendationsState();
}

class _MovieRecommendationsState extends State<MovieRecommendations> {
  @override
  void initState() {
    _loadRecommendations(context);
    super.initState();
  }

  Future<void> _loadRecommendations(BuildContext context) async {
    await context.read<MovieInfoCubit>().loadRecommendations(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final movieInfo = context.watch<MovieInfoCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recomendaciones", style: textTheme.titleLarge),
          const SizedBox(
            height: 5,
          ),
          !movieInfo.isLoading
              ? MovieHorizontalListview(movies: movieInfo.recommendationsMovies)
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
