import 'package:cine_world/features/movies/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cine_world/features/movies/infrastructure/datasources/isar_datasource.dart';
import 'package:cine_world/features/movies/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/actor_repository_impl.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:cine_world/features/movies/infrastructure/repositories/movie_repository_impl.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:cine_world/features/movies/presentation/cubits/storage/storage_movies_cubit.dart';
import 'package:cine_world/features/shared/presentation/cubit/darkmode_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt
      .registerSingleton(MoviesCubit(MovieRepositoryImpl(MoviedbDatasource())));
  getIt.registerSingleton(
      MovieInfoCubit(MovieRepositoryImpl(MoviedbDatasource())));
  getIt.registerSingleton(
      ActorsCubit(ActorRepositoryImpl(ActorMoviedbDatasource())));
  getIt
      .registerSingleton(SearchCubit(MovieRepositoryImpl(MoviedbDatasource())));
  getIt.registerSingleton(
      StorageMoviesCubit(LocalStorageRepositoryImpl(IsarDatasource())));

  getIt.registerSingleton(DarkmodeCubit());
}
