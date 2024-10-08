import 'package:animate_do/animate_do.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/presentation/cubits/storage/storage_movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomSliverAppbarByMovie extends StatefulWidget {
  final Movie movie;
  const CustomSliverAppbarByMovie({super.key, required this.movie});

  @override
  State<CustomSliverAppbarByMovie> createState() =>
      CustomSliverAppbarByMovieState();
}

class CustomSliverAppbarByMovieState extends State<CustomSliverAppbarByMovie> {
  Future<void> isFavorite(BuildContext context, int movieId) async {
    await context.read<StorageMoviesCubit>().isFavorite(movieId);
  }

  @override
  void initState() {
    super.initState();
    isFavorite(context, widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isFavorite = context.watch<StorageMoviesCubit>().state.isFavorite;

    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.7,
      actions: [
        IconButton(
          onPressed: () async {
            await context
                .read<StorageMoviesCubit>()
                .toggleFavorite(widget.movie);
          },
          icon: isFavorite
              ? const Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                widget.movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) return const SizedBox();
                  return FadeIn(child: child);
                },
              ),
            ),
            const _CustomGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.0, .2]),
            const _CustomGradient(
              colors: [Colors.transparent, Colors.black54],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.8, 1.0],
            ),
            const _CustomGradient(
              colors: [
                Colors.black54,
                Colors.transparent,
              ],
              begin: Alignment.topLeft,
              stops: [0.0, 0.3],
            )
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient(
      {this.end = Alignment.centerRight,
      required this.begin,
      required this.stops,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: colors, begin: begin, end: end, stops: stops))),
    );
  }
}
