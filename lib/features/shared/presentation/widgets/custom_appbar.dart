import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/presentation/cubits/search/search_cubit.dart';
import 'package:cine_world/features/shared/presentation/cubit/darkmode_cubit.dart';
import 'package:cine_world/features/shared/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = context.watch<DarkmodeCubit>().state.isDarkMode;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Cinemadia",
                  style: textTheme.titleMedium,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () =>
                        context.read<DarkmodeCubit>().setState(!isDarkMode),
                    icon: Icon(isDarkMode
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined)),
                IconButton(
                    onPressed: () {
                      final searchCubit = context.read<SearchCubit>();

                      showSearch<Movie?>(
                              query: searchCubit.state.query,
                              context: context,
                              delegate: SearchMovieDelegate(
                                  initialMovies:
                                      searchCubit.state.searchedMovies,
                                  searchMovies:
                                      searchCubit.setSearchMoviesByQuery))
                          .then((movie) {
                        if (movie == null || !context.mounted) return;
                        context.push("/movie/${movie.id}");
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
