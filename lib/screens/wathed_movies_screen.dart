import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../widgets/movie_card.dart';
import 'movie_info_screen.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
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
    final sortedMovies =
        moviesData.where((element) => element.isWatched == true).toList();
    return SafeArea(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 10,
          mainAxisExtent: 280,
        ),
        itemBuilder:
            (ctx, index) => MovieCard(
              movie: sortedMovies[index],
              onTap: () => goToWatch(moviesData[index].id),
            ),
        itemCount: sortedMovies.length,
      ),
    );
  }
}
