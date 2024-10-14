import 'package:animate_do/animate_do.dart';
import 'package:cinema_world/features/movies/presentation/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieActors extends StatelessWidget {
  final String movieId;

  const MovieActors({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final actorsByMovie = context.watch<ActorsCubit>().state.actorMap;

    if (actorsByMovie[movieId] == null) {
      return const CircularProgressIndicator();
    }

    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: actors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final actor = actors[index];

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 135,
              child: GestureDetector(
                onTap: () => context.push('/actor/${actor.id}'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInRight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          actor.profilePath,
                          height: 180,
                          width: 135,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      actor.name,
                      maxLines: 2,
                    ),
                    Text(
                      actor.character ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
