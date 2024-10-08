import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/movie_repository_impl.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MovieState> {
  final MovieRepositoryImpl _movieRepository;
  MoviesCubit(this._movieRepository) : super(const MovieState());

  Future<void> loadNextPageNowPlaying() async {
    if (state.isLoading) return;

    emit(state.copyWith(
        currentPages: {'nowPlaying': state.currentPages['nowPlaying']! + 1},
        isLoading: true));

    final List<Movie> movies = await _movieRepository.getNowPlaying(
        page: state.currentPages['nowPlaying']!);

    emit(state.copyWith(
        nowPlayingMovies: [...state.nowPlayingMovies, ...movies],
        isLoading: false));
  }

  Future<void> loadNextPagePopular() async {
    if (state.isLoading) return;

    emit(state.copyWith(
        currentPages: {'popular': state.currentPages['popular']! + 1},
        isLoading: true));

    final List<Movie> movies =
        await _movieRepository.getPopular(page: state.currentPages['popular']!);

    emit(state.copyWith(
        popularMovies: [...state.popularMovies, ...movies], isLoading: false));
  }

  Future<void> loadNextPageTopRated() async {
    if (state.isLoading) return;

    emit(state.copyWith(
        currentPages: {'topRated': state.currentPages['topRated']! + 1},
        isLoading: true));

    final List<Movie> movies = await _movieRepository.getTopRated(
        page: state.currentPages['topRated']!);

    emit(state.copyWith(
        topRatedMovies: [...state.topRatedMovies, ...movies],
        isLoading: false));
  }

  Future<void> loadNextPageUpcoming() async {
    if (state.isLoading) return;

    emit(state.copyWith(
        currentPages: {'upcoming': state.currentPages['upcoming']! + 1},
        isLoading: true));

    final List<Movie> movies = await _movieRepository.getUpcoming(
        page: state.currentPages['upcoming']!);

    emit(state.copyWith(
        upcomingMovies: [...state.upcomingMovies, ...movies],
        isLoading: false));
  }

  bool getIsEmpty(String key) => state.getMoviesList(key).isEmpty;

  List<Movie> get getMoviesSlideshow => state.nowPlayingMovies.isNotEmpty
      ? state.nowPlayingMovies.sublist(0, 6)
      : [];
}
