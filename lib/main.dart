import 'package:cine_world/config/get_it/service_locator.dart';
import 'package:cine_world/config/helpers/human_formats.dart';
import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:cine_world/features/movies/presentation/cubits/storage/storage_movies_cubit.dart';
import 'package:cine_world/features/shared/presentation/cubit/darkmode_cubit.dart';
import 'package:flutter/material.dart';

import 'package:cine_world/config/theme/app_theme.dart';
import 'package:cine_world/config/router/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await HumanFormats.initialize();

  await dotenv.load(fileName: '.env');

  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => getIt<MoviesCubit>()),
      BlocProvider(create: (context) => getIt<MovieInfoCubit>()),
      BlocProvider(create: (context) => getIt<ActorsCubit>()),
      BlocProvider(create: (context) => getIt<SearchCubit>()),
      BlocProvider(
        create: (context) => getIt<StorageMoviesCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<DarkmodeCubit>(),
      )
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<DarkmodeCubit>().state.isDarkMode;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(isDarkMode),
      routerConfig: appRouter,
    );
  }
}
