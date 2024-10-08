import 'package:go_router/go_router.dart';

import 'package:cine_world/features/movies/presentation/screens/screens.dart';
import 'package:cine_world/features/movies/presentation/views/views.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeScreen(currentChild: navigationShell),
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
]);
