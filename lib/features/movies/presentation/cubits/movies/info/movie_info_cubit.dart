import 'package:cine_world/features/movies/movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_info_state.dart';

class MovieInfoCubit extends Cubit<MovieInfoState> {
  final MovieRepositoryImpl _movieRepository;

  MovieInfoCubit(this._movieRepository) : super(const MovieInfoState());

  void setState({
    bool? isLoading,
    String? keyVideo,
    Map<String, Movie>? movieMap,
    List<Movie>? recommendationsMovies,
    List<WatchProviders>? watchProviders,
    String? keySearchProvider,
  }) {
    emit(state.copyWith(
      isLoading: isLoading,
      keyVideo: keyVideo,
      movieMap: movieMap,
      recommendationsMovies: recommendationsMovies,
      watchProviders: watchProviders,
      keySearchProvider: keySearchProvider,
    ));
  }

  Future<void> loadMovie(String movieId) async {
    if (state.movieMap[movieId] != null || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final movie = await _movieRepository.getMovieById(movieId);

    emit(state.copyWith(
        isLoading: false, movieMap: {...state.movieMap, movieId: movie}));
  }

  Future<String> getVideoByMovieId(String id) async {
    if (state.isLoading) return '';

    emit(state.copyWith(isLoading: true));

    final keyVideo = await _movieRepository.getVideoByMovieId(id);

    emit(state.copyWith(isLoading: false, keyVideo: keyVideo));

    return keyVideo;
  }

  Future<void> loadRecommendations(String id) async {
    emit(state.copyWith(isLoading: true));

    final recommendations =
        await _movieRepository.getRecommendationsByMovieId(id);

    emit(state.copyWith(
        isLoading: false, recommendationsMovies: recommendations));
  }

  Future<void> loadWatchProviders(String id) async {
    if (state.watchProviders.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));

    final watchProviders =
        await _movieRepository.getWatchProvidersByMovieId(id);

    emit(state.copyWith(isLoading: false, watchProviders: watchProviders));
  }

  void searchProvider(String searchKey) {
    emit(state.copyWith(keySearchProvider: searchKey));
  }

  WatchProviders? get getWatchProvider {
    if (state.watchProviders.isEmpty || state.watchProviders.isEmpty) {
      return null;
    }

    final watchProvider = state.watchProviders
        .firstWhere((element) => element.nameCountry == state.keySearchProvider,
            orElse: () => WatchProviders(
                  isoCode: '',
                  nameCountry: '',
                  streaming: [],
                  rent: [],
                  buy: [],
                  ads: [],
                ));

    return watchProvider;
  }

  List<String> get listSearch {
    if (state.watchProviders.isEmpty) return [];

    final listFiltered =
        state.watchProviders.map((e) => e.nameCountry).toList();

    return listFiltered;
  }
}
