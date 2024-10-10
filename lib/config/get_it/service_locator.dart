import 'package:cine_world/features/movies/movies.dart';
import 'package:cine_world/features/shared/shared.dart';
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
