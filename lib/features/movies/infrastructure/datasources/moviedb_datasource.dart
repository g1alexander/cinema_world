import 'package:cine_world/config/constants/environment.dart';
import 'package:cine_world/features/movies/domain/datasources/movies_datasource.dart';
import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/infrastructure/mappers/mappers.dart';
import 'package:cine_world/features/movies/infrastructure/models/models.dart';

import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
        .where((movieDB) => movieDB.posterPath != 'no-poster')
        .map((movieDB) => MovieMapper.movieDBToEntity(movieDB))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) {
      throw Exception("Movie with id: $id not found");
    }
    final movieDetails = MovieDetails.fromJson(response.data);

    return MovieMapper.movieDetailsToEntity(movieDetails);
  }

  @override
  Future<List<Movie>> searchMovies(String query, {int page = 1}) async {
    if (query.isEmpty) return [];

    final response = await dio
        .get('/search/movie', queryParameters: {'page': page, 'query': query});

    return _jsonToMovies(response.data);
  }

  @override
  Future<String> getVideoByMovieId(String id) async {
    final response = await dio.get('/movie/$id/videos');

    final videos = VideosResponse.fromJson(response.data);

    return VideoMapper.idVideoToEntity(videos);
  }

  @override
  Future<List<Movie>> getRecommendationsByMovieId(String id) async {
    final response = await dio.get('/movie/$id/similar');

    return _jsonToMovies(response.data);
  }
}
