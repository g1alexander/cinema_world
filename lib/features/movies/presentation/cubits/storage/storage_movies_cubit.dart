import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'storage_movies_state.dart';

class StorageMoviesCubit extends Cubit<StorageMoviesState> {
  final LocalStorageRepositoryImpl _localStorageRepository;

  StorageMoviesCubit(this._localStorageRepository)
      : super(const StorageMoviesState());

  Future<void> toggleFavorite(Movie movie) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));

    await _localStorageRepository.toggleFavorite(movie);

    final bool isMovieInFavorites = state.favoritesMovies[movie.id] != null;

    var moviesTemp = {...state.favoritesMovies};

    if (isMovieInFavorites) {
      moviesTemp.remove(movie.id);
    } else {
      moviesTemp = {...moviesTemp, movie.id: movie};
    }

    emit(state.copyWith(
        isLoading: false,
        isFavorite: !state.isFavorite,
        favoritesMovies: moviesTemp));
  }

  Future<void> isFavorite(int movieId) async {
    emit(state.copyWith(isLoading: true));

    final isFavorite = await _localStorageRepository.isMovieFavorite(movieId);

    emit(state.copyWith(isLoading: false, isFavorite: isFavorite));
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;
    emit(state.copyWith(isLoading: true));

    final movies = await _localStorageRepository.loadMovies(
        offset: state.page * 10, limit: 20);

    final tempMoviesMap = <int, Movie>{};

    for (var movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    emit(state.copyWith(
        isLoading: false,
        favoritesMovies: {...state.favoritesMovies, ...tempMoviesMap},
        page: state.page + 1,
        isLastPage: movies.isEmpty));
  }

  List<Movie> get getFavoriteMovies => state.favoritesMovies.values.toList();
}
