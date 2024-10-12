import 'package:animate_do/animate_do.dart';
import 'package:cine_world/config/helpers/human_formats.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  static const name = 'id-movie-screen';

  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late MovieInfoCubit movieInfoCubit;

  Future<void> _loadMovie(BuildContext context) async {
    await context.read<MovieInfoCubit>().loadMovie(widget.movieId);
  }

  Future<void> _loadActors(BuildContext context) async {
    await context.read<ActorsCubit>().loadActors(widget.movieId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieInfoCubit = context.read<MovieInfoCubit>();
  }

  @override
  void initState() {
    super.initState();
    _loadMovie(context);
    _loadActors(context);
  }

  @override
  void dispose() {
    movieInfoCubit.setState(watchProviders: [], keySearchProvider: '');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie =
        context.watch<MovieInfoCubit>().state.movieMap[widget.movieId];
    final isLoading = context.watch<MovieInfoCubit>().state.isLoading;

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }

    return Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            CustomSliverAppbarByMovie(
              movie: movie,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => _MovieDetails(
                          movie: movie,
                        ),
                    childCount: 1))
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await context
                .read<MovieInfoCubit>()
                .loadWatchProviders("${movie.id}");
            if (!context.mounted) return;

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (BuildContext context) => const ProvidersWidget(),
            );
          },
          label: const Text('Watch movie'),
          icon: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : const Icon(Icons.ondemand_video_outlined),
        ));
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.37,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: textTheme.titleLarge,
                    ),
                    Text(movie.overview),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MovieRating(
                          voteAverage: movie.voteAverage,
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.access_time_filled_outlined),
                        const SizedBox(width: 5),
                        Text('${movie.runtime} '),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("Release:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(HumanFormats.dateFormat(
                            date: movie.releaseDate, format: 'EEE, d MMM yyyy'))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                        label: Text(gender),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ))
            ],
          ),
        ),
        MovieActors(
          movieId: '${movie.id}',
        ),
        const SizedBox(
          height: 20,
        ),
        MovieVideoTrailer(
          movieId: '${movie.id}',
        ),
        const SizedBox(
          height: 20,
        ),
        MovieRecommendations(
          movieId: '${movie.id}',
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
