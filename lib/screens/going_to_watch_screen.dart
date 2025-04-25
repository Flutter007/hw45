import 'package:flutter/material.dart';
import 'package:hw45/widgets/grid_movie_builder.dart';
import '../app_routes.dart';
import '../provider/list_of_movies_provider.dart';

class GoingToWatchScreen extends StatefulWidget {
  const GoingToWatchScreen({super.key});

  @override
  State<GoingToWatchScreen> createState() => _GoingToWatchScreenState();
}

class _GoingToWatchScreenState extends State<GoingToWatchScreen> {
  void goToMovieInfo(String id) async {
    await Navigator.of(context).pushNamed(AppRoutes.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ListOfMoviesProvider.of(context)!;
    final movies = provider.movies.where((m) => !m.isWatched).toList();

    return GridMovieBuilder(goToWatch: goToMovieInfo, movies: movies);
  }
}
