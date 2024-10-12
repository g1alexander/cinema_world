import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

import 'package:cine_world/features/movies/movies.dart';

class ProvidersWidget extends StatefulWidget {
  const ProvidersWidget({super.key});

  @override
  State<ProvidersWidget> createState() => _ProvidersWidgetState();
}

class _ProvidersWidgetState extends State<ProvidersWidget> {
  final focus = FocusNode();
  late MovieInfoCubit movieInfoCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieInfoCubit = context.read<MovieInfoCubit>();
  }

  @override
  void dispose() {
    movieInfoCubit.searchProvider('');
    focus.dispose();
    super.dispose();
  }

  bool _areAllProvidersEmpty(WatchProviders? watchProvider) {
    return watchProvider == null ||
        (watchProvider.buy.isEmpty &&
            watchProvider.rent.isEmpty &&
            watchProvider.streaming.isEmpty &&
            watchProvider.ads.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final movie = context.watch<MovieInfoCubit>();
    final watchProvider = movie.getWatchProvider;

    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchField(
                focusNode: focus,
                suggestions: movie.listSearch
                    .map((nameCountry) => SearchFieldListItem(nameCountry,
                        child: Text(nameCountry)))
                    .toList(),
                onSuggestionTap: (value) {
                  context
                      .read<MovieInfoCubit>()
                      .searchProvider(value.searchKey);

                  focus.unfocus();
                },
              ),
              const SizedBox(height: 40),
              if (_areAllProvidersEmpty(watchProvider))
                Text(movie.state.keySearchProvider.isNotEmpty
                    ? 'No providers available'
                    : 'Choose a country'),
              if (watchProvider?.streaming.isNotEmpty ?? false)
                _ProvidersLogos(
                    providers: watchProvider!.streaming, name: 'Streaming'),
              const SizedBox(height: 10),
              if (watchProvider?.rent.isNotEmpty ?? false)
                _ProvidersLogos(providers: watchProvider!.rent, name: 'Rent'),
              const SizedBox(height: 10),
              if (watchProvider?.buy.isNotEmpty ?? false)
                _ProvidersLogos(providers: watchProvider!.buy, name: 'Buy'),
              const SizedBox(height: 10),
              if (watchProvider?.ads.isNotEmpty ?? false)
                _ProvidersLogos(providers: watchProvider!.ads, name: 'Ads'),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProvidersLogos extends StatelessWidget {
  const _ProvidersLogos({
    required this.providers,
    required this.name,
  });

  final String name;
  final List<Providers> providers;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        name,
        style: textTheme.titleMedium,
      ),
      SizedBox(
        height: 140,
        child: ListView.builder(
            itemCount: providers.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 15),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInRight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          providers[index].logoPath,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                      height: 5,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        providers[index].providerName,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ]);
  }
}
