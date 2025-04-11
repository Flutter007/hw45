import 'package:flutter/material.dart';
import 'package:hw45/data/movies_data.dart';
import 'package:hw45/widgets/grid_movie_builder.dart';
import 'movie_info_screen.dart';

class GoingToWatchScreen extends StatefulWidget {
  const GoingToWatchScreen({super.key});

  @override
  State<GoingToWatchScreen> createState() => _GoingToWatchScreenState();
}

class _GoingToWatchScreenState extends State<GoingToWatchScreen> {
  void goToWatch(String id) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MovieInfoScreen(movieId: id)),
    );
    setState(() {
      //updated State;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridMovieBuilder(
      goToWatch: goToWatch,
      movies:
          moviesData.where((element) => element.isWatched == false).toList(),
    );
  }
}
