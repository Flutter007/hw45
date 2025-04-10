import 'package:flutter/material.dart';
import 'package:hw45/data/movies_data.dart';
import '../screens/movie_info_screen.dart';
import 'movie_card.dart';

class GridMovieBuilder extends StatefulWidget {
  const GridMovieBuilder({super.key});

  @override
  State<GridMovieBuilder> createState() => _GridMovieBuilderState();
}

class _GridMovieBuilderState extends State<GridMovieBuilder> {
  void goToWatch(String id) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MovieInfoScreen(movieId: id)),
    );
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    final sortedMovies = moviesData.where((m) => m.isWatched == true).toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        mainAxisExtent: 280,
      ),
      itemBuilder:
          (ctx, index) => MovieCard(
            movie: sortedMovies[index],
            onTap: () => goToWatch(sortedMovies[index].id),
          ),
      itemCount: sortedMovies.length,
    );
  }
}
