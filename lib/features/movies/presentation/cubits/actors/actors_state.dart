part of 'actors_cubit.dart';

class ActorsState extends Equatable {
  final bool isLoading;
  final Map<String, List<Actor>> actorMap;

  const ActorsState({this.isLoading = false, this.actorMap = const {}});

  ActorsState copyWith({bool? isLoading, Map<String, List<Actor>>? actorMap}) =>
      ActorsState(
          isLoading: isLoading ?? this.isLoading,
          actorMap: actorMap ?? this.actorMap);

  @override
  List<Object> get props => [isLoading, actorMap];
}
