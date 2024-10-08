part of 'actors_cubit.dart';

class ActorsState extends Equatable {
  final bool isLoading;
  final Map<String, List<Actor>> actorMap;
  final List<String> images;
  final List<Movie> movies;
  final Actor? actor;

  const ActorsState(
      {this.isLoading = false,
      this.actorMap = const {},
      this.actor,
      this.images = const [],
      this.movies = const []});

  ActorsState copyWith({
    bool? isLoading,
    Map<String, List<Actor>>? actorMap,
    Actor? actor,
    List<String>? images,
    List<Movie>? movies,
  }) =>
      ActorsState(
        isLoading: isLoading ?? this.isLoading,
        actorMap: actorMap ?? this.actorMap,
        actor: actor ?? this.actor,
        images: images ?? this.images,
        movies: movies ?? this.movies,
      );

  @override
  List<Object> get props => [isLoading, actorMap, images, movies];
}
