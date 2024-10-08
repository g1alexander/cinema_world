import 'package:cine_world/features/movies/domain/entities/movie.dart';
import 'package:cine_world/features/movies/infrastructure/models/models.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: movieDB.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: movieDB.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : 'https://movienewsletters.net/photos/000000H1.jpg',
      releaseDate:
          movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movie.posterPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
