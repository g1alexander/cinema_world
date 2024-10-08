import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviePosterLink extends StatelessWidget {
  final Movie movie;
  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/movie/${movie.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(movie.posterPath),
        ),
      ),
    );
  }
}
