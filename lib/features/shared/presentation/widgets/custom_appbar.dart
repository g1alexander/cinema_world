import 'package:cine_world/features/movies/movies.dart';
import 'package:cine_world/features/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<DarkmodeCubit>().state.isDarkMode;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/logo_home.svg',
                  width: 115,
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
