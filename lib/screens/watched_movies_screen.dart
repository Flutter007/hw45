import 'package:flutter/material.dart';
import '../app_routes.dart';
import '../provider/list_of_movies_provider.dart';
import '../widgets/grid_movie_builder.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  void goToMovieInfo(String id) async {
    await Navigator.of(context).pushNamed(AppRoutes.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ListOfMoviesProvider.of(context)!;
    final movies = provider.movies.where((m) => m.isWatched == true).toList();

    return GridMovieBuilder(movies: movies, goToWatch: goToMovieInfo);
  }
}
