part of 'search_cubit.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final String query;
  final List<Movie> searchedMovies;

  const SearchState(
      {this.isLoading = false,
      this.query = '',
      this.searchedMovies = const []});

  SearchState copyWith(
          {bool? isLoading, String? query, List<Movie>? searchedMovies}) =>
      SearchState(
          isLoading: isLoading ?? this.isLoading,
          query: query ?? this.query,
          searchedMovies: searchedMovies ?? this.searchedMovies);

  @override
  List<Object> get props => [isLoading, query, searchedMovies];
}
