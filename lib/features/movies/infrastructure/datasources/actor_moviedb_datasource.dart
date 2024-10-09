import 'package:cine_world/config/constants/environment.dart';
import 'package:cine_world/features/movies/movies.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'en-US'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = creditsResponse.cast
        .map((actor) => ActorMapper.castToEntity(actor))
        .toList();

    return actors;
  }

  @override
  Future<Actor> getActorById(String actorId) async {
    final response = await dio.get('/person/$actorId');

    final actorResponse = Person.fromJson(response.data);

    return ActorMapper.personToEntity(actorResponse);
  }

  @override
  Future<List<String>> getImagesByActor(String actorId) async {
    final response = await dio.get('/person/$actorId/images');

    final imagesResponse = Images.fromJson(response.data);

    return ActorMapper.imagesToEntity(imagesResponse);
  }

  @override
  Future<List<Movie>> getMoviesByActor(String actorId) async {
    final response = await dio.get('/person/$actorId/movie_credits');

    final movieCreditsResponse = CreditsByActorResponse.fromJson(response.data);

    final List<Movie> movies = movieCreditsResponse.cast
        .map((movie) => MovieMapper.moviesByActorToEntity(movie))
        .toList();

    return movies;
  }
}
