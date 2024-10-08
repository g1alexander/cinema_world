import 'package:cine_world/features/movies/domain/entities/actor.dart';
import 'package:cine_world/features/movies/infrastructure/models/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null && cast.profilePath != 'no-poster'
          ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
          : 'https://www.uprm.edu/biology/wp-content/uploads/sites/137/2019/03/Photo-Not-Available_MALE.jpg',
      character: cast.character);
}
