import 'package:cine_world/features/movies/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
