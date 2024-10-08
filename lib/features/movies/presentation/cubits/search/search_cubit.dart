import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MovieRepositoryImpl _movieRepository;

  SearchCubit(this._movieRepository) : super(const SearchState());

  Future<List<Movie>> setSearchMoviesByQuery(String query) async {
    emit(state.copyWith(isLoading: true));
    final movies = await _movieRepository.searchMovies(query);

    emit(
        state.copyWith(isLoading: false, searchedMovies: movies, query: query));

    return movies;
  }
}
