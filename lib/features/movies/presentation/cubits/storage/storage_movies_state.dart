part of 'storage_movies_cubit.dart';

class StorageMoviesState extends Equatable {
  final bool isLoading;
  final bool isFavorite;

  final Map<int, Movie> favoritesMovies;
  final int page;
  final bool isLastPage;

  const StorageMoviesState(
      {this.isFavorite = false,
      this.isLoading = false,
      this.favoritesMovies = const {},
      this.page = 0,
      this.isLastPage = false});

  StorageMoviesState copyWith(
          {bool? isLoading,
          bool? isFavorite,
          Map<int, Movie>? favoritesMovies,
          int? page,
          bool? isLastPage}) =>
      StorageMoviesState(
          isLastPage: isLastPage ?? this.isLastPage,
          page: page ?? this.page,
          favoritesMovies: favoritesMovies ?? this.favoritesMovies,
          isLoading: isLoading ?? this.isLoading,
          isFavorite: isFavorite ?? this.isFavorite);

  @override
  List<Object> get props =>
      [isLoading, isFavorite, favoritesMovies, page, isLastPage];
}
