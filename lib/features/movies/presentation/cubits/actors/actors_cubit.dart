import 'package:cine_world/features/movies/domain/entities/actor.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/actor_repository_impl.dart';
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
}
