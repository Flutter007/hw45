import 'package:flutter/material.dart';
import 'package:hw45/models/movie.dart';
import 'package:hw45/widgets/film_rating.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final void Function() onTap;
  const MovieCard({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 6,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(movie.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (movie.rating != null && movie.isWatched == true)
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: FilmRating(rating: movie.rating.toString()),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: theme.textTheme.titleMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
