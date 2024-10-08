import 'package:cine_world/features/movies/movies.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null && cast.profilePath != 'no-poster'
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://www.uprm.edu/biology/wp-content/uploads/sites/137/2019/03/Photo-Not-Available_MALE.jpg',
        character: cast.character,
      );

  static Actor personToEntity(Person person) => Actor(
        id: person.id,
        name: person.name,
        profilePath: person.profilePath != 'no-poster'
            ? 'https://image.tmdb.org/t/p/w500/${person.profilePath}'
            : 'https://www.uprm.edu/biology/wp-content/uploads/sites/137/2019/03/Photo-Not-Available_MALE.jpg',
        character: '',
        biography: person.biography,
        birthday: person.birthday,
        deathday: person.deathday,
        placeOfBirth: person.placeOfBirth,
      );

  static List<String> imagesToEntity(Images images) => images.profiles
      .map((e) => "https://image.tmdb.org/t/p/w500/${e.filePath}")
      .toList();
}
