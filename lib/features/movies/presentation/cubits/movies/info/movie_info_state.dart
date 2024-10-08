part of 'movie_info_cubit.dart';

class MovieInfoState extends Equatable {
  final bool isLoading;
  final Map<String, Movie> movieMap;
  final List<Movie> recommendationsMovies;
  final String keyVideo;

  const MovieInfoState(
      {this.isLoading = false,
      this.keyVideo = '',
      this.recommendationsMovies = const [],
      this.movieMap = const {}});

  MovieInfoState copyWith(
          {bool? isLoading,
          String? keyVideo,
          Map<String, Movie>? movieMap,
          List<Movie>? recommendationsMovies}) =>
      MovieInfoState(
          keyVideo: keyVideo ?? this.keyVideo,
          recommendationsMovies:
              recommendationsMovies ?? this.recommendationsMovies,
          isLoading: isLoading ?? this.isLoading,
          movieMap: movieMap ?? this.movieMap);

  @override
  List<Object> get props =>
      [isLoading, movieMap, keyVideo, recommendationsMovies];
}
