import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final bool isLoading;
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final Map<String, int> currentPages;

  const MovieState(
      {this.isLoading = false,
      this.nowPlayingMovies = const [],
      this.popularMovies = const [],
      this.topRatedMovies = const [],
      this.upcomingMovies = const [],
      this.currentPages = const {
        'nowPlaying': 0,
        'popular': 0,
        'topRated': 0,
        'upcoming': 0
      }});

  MovieState copyWith(
      {bool? isLoading,
      List<Movie>? nowPlayingMovies,
      List<Movie>? popularMovies,
      List<Movie>? topRatedMovies,
      List<Movie>? upcomingMovies,
      Map<String, int>? currentPages}) {
    return MovieState(
        isLoading: isLoading ?? this.isLoading,
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        popularMovies: popularMovies ?? this.popularMovies,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies,
        currentPages: {...this.currentPages, ...?currentPages});
  }

  List<Movie> getMoviesList(String key) {
    switch (key) {
      case 'nowPlayingMovies':
        return nowPlayingMovies;
      case 'popularMovies':
        return popularMovies;
      case 'topRatedMovies':
        return topRatedMovies;
      case 'upcomingMovies':
        return upcomingMovies;
      default:
        return [];
    }
  }

  @override
  List<Object> get props => [
        isLoading,
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        upcomingMovies,
        currentPages
      ];
}
