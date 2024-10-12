part of 'movie_info_cubit.dart';

class MovieInfoState extends Equatable {
  final bool isLoading;
  final Map<String, Movie> movieMap;
  final List<Movie> recommendationsMovies;
  final String keyVideo;
  final List<WatchProviders> watchProviders;
  final String keySearchProvider;

  const MovieInfoState({
    this.isLoading = false,
    this.keyVideo = '',
    this.recommendationsMovies = const [],
    this.movieMap = const {},
    this.watchProviders = const [],
    this.keySearchProvider = '',
  });

  MovieInfoState copyWith({
    bool? isLoading,
    String? keyVideo,
    Map<String, Movie>? movieMap,
    List<Movie>? recommendationsMovies,
    List<WatchProviders>? watchProviders,
    String? keySearchProvider,
  }) =>
      MovieInfoState(
        keyVideo: keyVideo ?? this.keyVideo,
        recommendationsMovies:
            recommendationsMovies ?? this.recommendationsMovies,
        isLoading: isLoading ?? this.isLoading,
        movieMap: movieMap ?? this.movieMap,
        watchProviders: watchProviders ?? this.watchProviders,
        keySearchProvider: keySearchProvider ?? this.keySearchProvider,
      );

  @override
  List<Object> get props => [
        isLoading,
        movieMap,
        keyVideo,
        recommendationsMovies,
        watchProviders,
        keySearchProvider,
      ];
}
