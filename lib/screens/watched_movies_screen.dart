import 'package:flutter/material.dart';
import 'package:hw45/data/movies_data.dart';
import '../widgets/grid_movie_builder.dart';
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
      //update State;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridMovieBuilder(
      movies: moviesData.where((element) => element.isWatched == true).toList(),
      goToWatch: goToWatch,
    );
  }
}
