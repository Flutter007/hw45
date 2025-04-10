import 'package:flutter/material.dart';
import '../widgets/grid_movie_builder.dart';

class WatchedMoviesScreen extends StatefulWidget {
  const WatchedMoviesScreen({super.key});

  @override
  State<WatchedMoviesScreen> createState() => _WatchedMoviesScreenState();
}

class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridMovieBuilder();
  }
}
