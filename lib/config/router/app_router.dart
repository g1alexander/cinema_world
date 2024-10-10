import 'package:go_router/go_router.dart';

import 'package:cine_world/features/movies/movies.dart';
import 'package:cine_world/features/shared/shared.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: WelcomeScreen.name,
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final name = state.topRoute?.name ?? '';
          final isBottomNavigationVisible =
              !name.startsWith('id-') ? true : false;

          return HomeScreen(
            currentChild: navigationShell,
            isBottomNavigationVisible: isBottomNavigationVisible,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/',
                name: HomeView.name,
                builder: (context, state) => const HomeView(),
                routes: [
                  GoRoute(
                    path: "movie/:id",
                    name: MovieScreen.name,
                    builder: (context, state) {
                      final movieId = state.pathParameters['id'] ?? 'no-id';
                      return MovieScreen(movieId: movieId);
                    },
                  ),
                  GoRoute(
                    path: 'actor/:id',
                    name: ActorScreen.name,
                    builder: (context, state) {
                      final actorId = state.pathParameters['id'] ?? 'no-id';
                      return ActorScreen(actorId: actorId);
                    },
                  )
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/populars',
              name: PopularsView.name,
              builder: (context, state) => const PopularsView(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/favorites',
              name: FavoritesView.name,
              builder: (context, state) => const FavoritesView(),
            ),
          ])
        ])
  ],
  redirect: (context, state) async {
    final isCompleteWelcome =
        await KeyValueStorageServiceImpl().getValue<bool>('welcome');

    if (isCompleteWelcome != null && isCompleteWelcome) {
      return null;
    }

    return '/welcome';
  },
);
