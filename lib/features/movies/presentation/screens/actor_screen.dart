import 'package:cine_world/features/movies/movies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ActorScreen extends StatefulWidget {
  final String actorId;

  static const name = 'id-actor-screen';

  const ActorScreen({super.key, required this.actorId});

  @override
  State<ActorScreen> createState() => _ActorScreenState();
}

class _ActorScreenState extends State<ActorScreen> {
  @override
  void initState() {
    _getActor(context);
    super.initState();
  }

  void _getActor(BuildContext context) {
    context.read<ActorsCubit>().loadActor(widget.actorId);
  }

  @override
  Widget build(BuildContext context) {
    final actor = context.watch<ActorsCubit>().state;

    if (actor.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Actor Screen ${actor.actor?.name}'),
            Text('Actor Screen ${actor.images.toString()}'),
            Text('Actor Screen ${actor.movies[0].title}'),
          ],
        ),
      ),
    );
  }
}
