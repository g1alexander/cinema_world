import 'package:cine_world/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;
  const MovieRating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          Icons.star_half_rounded,
          color: Colors.yellow.shade800,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          HumanFormats.number(voteAverage, 1),
          style: textTheme.bodyMedium!.copyWith(color: Colors.yellow.shade900),
        )
      ],
    );
  }
}
