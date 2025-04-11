import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class FilmRating extends StatelessWidget {
  final String rating;
  const FilmRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        Text(
          rating,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: lightColorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
