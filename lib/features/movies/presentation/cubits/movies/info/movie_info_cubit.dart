import 'package:cine_world/features/movies/movies.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_info_state.dart';

class MovieInfoCubit extends Cubit<MovieInfoState> {
  final MovieRepositoryImpl _movieRepository;

  MovieInfoCubit(this._movieRepository) : super(const MovieInfoState());

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
    emit(state.copyWith(isLoading: true));

    final watchProviders =
        await _movieRepository.getWatchProvidersByMovieId(id);

    emit(state.copyWith(isLoading: false, watchProviders: watchProviders));
  }
}
