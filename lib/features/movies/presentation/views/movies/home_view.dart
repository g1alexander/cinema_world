import 'package:cine_world/config/helpers/human_formats.dart';
import 'package:cine_world/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:cine_world/features/movies/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const name = 'home-view';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> _loadNextPage(BuildContext context) async {
    await context.read<MoviesCubit>().loadNextPageNowPlaying();
    if (!context.mounted) return;
    await context.read<MoviesCubit>().loadNextPageUpcoming();
    if (!context.mounted) return;
    await context.read<MoviesCubit>().loadNextPageTopRated();
  }

  @override
  void initState() {
    super.initState();
    _loadNextPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final moviesCubit = context.watch<MoviesCubit>();

    final step1 = moviesCubit.getIsEmpty('nowPlayingMovies');
    final step2 = moviesCubit.getIsEmpty('upcomingMovies');
    final step3 = moviesCubit.getIsEmpty('topRatedMovies');

    final isLoading = step1 || step2 || step3;

    if (isLoading) return const FullScreenLoader();

    final nowPlayingMovies = moviesCubit.state.nowPlayingMovies;
    final getMoviesSlideshow = context.read<MoviesCubit>().getMoviesSlideshow;

    final upcomingMovies = moviesCubit.state.upcomingMovies;
    final topRatedMovies = moviesCubit.state.topRatedMovies;

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(horizontal: 10),
            title: CustomAppbar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(movies: getMoviesSlideshow),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: "In theaters",
                subTitle: HumanFormats.dateFormat(date: DateTime.now()),
                loadNextPage: () =>
                    context.read<MoviesCubit>().loadNextPageNowPlaying(),
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: "Upcoming",
                subTitle: 'This month',
                loadNextPage: () =>
                    context.read<MoviesCubit>().loadNextPageUpcoming(),
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: "Top rated",
                subTitle: 'from always',
                loadNextPage: () =>
                    context.read<MoviesCubit>().loadNextPageTopRated(),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
