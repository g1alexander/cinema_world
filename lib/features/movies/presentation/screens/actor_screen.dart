import 'package:animate_do/animate_do.dart';
import 'package:cinema_world/features/movies/movies.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Actor Screen ${actor.actor?.name}'),
              // Text('Actor Screen ${actor.images.toString()}'),
              // Text('Actor Screen ${actor.movies[0].title}'),
              _Information(actor: actor.actor!),

              _Images(actor: actor),

              _Movies(actor: actor),
            ],
          ),
        ),
      ),
    );
  }
}

class _Movies extends StatelessWidget {
  const _Movies({
    required this.actor,
  });

  final ActorsState actor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Text('Most Successful Movies', style: textTheme.bodyLarge),
        MovieHorizontalListview(movies: actor.movies),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Images extends StatelessWidget {
  const _Images({
    required this.actor,
  });

  final ActorsState actor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Photos',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 220,
          child: ListView.builder(
            itemCount: actor.images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final image = actor.images[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      image,
                      height: 180,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _Information extends StatelessWidget {
  const _Information({
    required this.actor,
  });

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.network(
            actor.profilePath,
            width: 165,
            height: 175,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                actor.name,
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              const Text('Actor'),
              const SizedBox(height: 10),
              Text(
                actor.biography ?? '',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              const SizedBox(height: 15),
              _ShowBiography(actor: actor)
            ],
          ),
        )
      ],
    );
  }
}

class _ShowBiography extends StatelessWidget {
  const _ShowBiography({
    required this.actor,
  });

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (BuildContext context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      actor.biography ?? '',
                      style: textTheme.bodyLarge,
                    ),
                    // Otros widgets...
                  ],
                ),
              ),
            ),
          );
        },
        child: Text(
          'Read more',
          style: TextStyle(color: colors.primary),
        ));
  }
}
