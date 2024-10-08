import 'package:cine_world/features/movies/domain/entities/actor.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
  Future<Actor> getActorById(String actorId);
  Future<List<String>> getImagesByActor(String actorId);
  Future<List<Movie>> getMoviesByActor(String actorId);
}
