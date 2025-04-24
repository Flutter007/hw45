import 'package:flutter/material.dart';
import '../app_routes.dart';
import '../models/movie.dart';
import '../provider/list_of_movies_provider.dart';
import '../widgets/grid_movie_builder.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  late List<Movie> movies;
  late ListOfMoviesProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = ListOfMoviesProvider.of(context)!;
    movies = provider.movies.where((m) => m.isWatched == true).toList();
  }

  void goToMovieInfo(String id) async {
    await Navigator.of(context).pushNamed(AppRoutes.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return GridMovieBuilder(movies: movies, goToWatch: goToMovieInfo);
  }
}
