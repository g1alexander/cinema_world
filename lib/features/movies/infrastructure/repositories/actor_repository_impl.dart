import 'package:cinema_world/features/movies/domain/datasources/actors_datasource.dart';
import 'package:cinema_world/features/movies/domain/entities/actor.dart';
import 'package:cinema_world/features/movies/domain/entities/movie.dart';
import 'package:cinema_world/features/movies/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

  @override
  Future<Actor> getActorById(String actorId) {
    return datasource.getActorById(actorId);
  }

  @override
  Future<List<String>> getImagesByActor(String actorId) {
    return datasource.getImagesByActor(actorId);
  }

  @override
  Future<List<Movie>> getMoviesByActor(String actorId) {
    return datasource.getMoviesByActor(actorId);
  }
}
