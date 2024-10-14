import 'package:cinema_world/features/movies/movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'actors_state.dart';

class ActorsCubit extends Cubit<ActorsState> {
  final ActorRepositoryImpl _actorRepository;

  ActorsCubit(this._actorRepository) : super(const ActorsState());

  Future<void> loadActors(String movieId) async {
    if (state.actorMap[movieId] != null || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final actors = await _actorRepository.getActorsByMovie(movieId);

    emit(state.copyWith(
        isLoading: false, actorMap: {...state.actorMap, movieId: actors}));
  }

  Future<void> loadActor(String actorId) async {
    if (state.actorMap[actorId] != null || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final [actor as Actor, images as List<String>, movies as List<Movie>] =
        await Future.wait([
      _actorRepository.getActorById(actorId),
      _actorRepository.getImagesByActor(actorId),
      _actorRepository.getMoviesByActor(actorId),
    ]);

    // final actor = await _actorRepository.getActorById(actorId);
    // final images = await _actorRepository.getImagesByActor(actorId);
    // final movies = await _actorRepository.getMoviesByActor(actorId);

    emit(state.copyWith(
      isLoading: false,
      actor: actor,
      images: images,
      movies: movies,
    ));
  }
}
