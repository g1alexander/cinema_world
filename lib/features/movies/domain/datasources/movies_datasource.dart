import 'package:cinema_world/features/movies/domain/domain.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovies(String query, {int page = 1});

  Future<String> getVideoByMovieId(String id);

  Future<List<Movie>> getRecommendationsByMovieId(String id);

  Future<List<WatchProviders>> getWatchProvidersByMovieId(String id);
}
