import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../models/movie.dart';

class ListOfMoviesState extends StatefulWidget {
  final Widget child;
  const ListOfMoviesState({super.key, required this.child});

  @override
  State<ListOfMoviesState> createState() => _ListOfMoviesStateState();
}

class _ListOfMoviesStateState extends State<ListOfMoviesState> {
  List<Movie> movies = List.of(moviesData);
  void addMovie(Movie newMovie) {
    setState(() {
      movies = [...movies, newMovie];
    });
  }

  void changeStatusOfMovie(Movie movie) {
    setState(() {
      movies =
          movies.map((m) {
            return m.id == movie.id
                ? movie.copyWith(isWatched: !movie.isWatched)
                : m;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
