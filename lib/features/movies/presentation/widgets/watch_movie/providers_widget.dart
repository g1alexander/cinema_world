import 'package:cine_world/features/movies/presentation/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersWidget extends StatelessWidget {
  const ProvidersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final watchProviders = context.watch<MovieInfoCubit>().state.watchProviders;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
              "${watchProviders[1].isoCode} ${watchProviders[1].nameCountry} ${watchProviders[1].streaming[1].logoPath}"),
          Image.network(
            watchProviders[1].streaming[1].logoPath,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
