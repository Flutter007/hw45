import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'movie_card.dart';

class GridMovieBuilder extends StatefulWidget {
  final List<Movie> movies;
  final void Function(String id) goToWatch;
  const GridMovieBuilder({
    super.key,
    required this.goToWatch,
    required this.movies,
  });

  @override
  State<GridMovieBuilder> createState() => _GridMovieBuilderState();
}

class _GridMovieBuilderState extends State<GridMovieBuilder> {
  @override
  Widget build(BuildContext context) {
    final movie = widget.movies;
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        mainAxisExtent: 315,
      ),
      itemBuilder:
          (ctx, index) => MovieCard(
            movie: movie[index],
            onTap: () => widget.goToWatch(movie[index].id),
          ),
      itemCount: movie.length,
    );
  }
}
