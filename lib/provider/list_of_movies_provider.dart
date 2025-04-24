import 'package:flutter/material.dart';

import '../models/movie.dart';

class ListOfMoviesProvider extends InheritedWidget {
  final List<Movie> movies;
  final Function(Movie) addMovie;
  final Function(Movie) changeStatusOfMovie;
  final Function(Movie, int newRating) changeRating;

  const ListOfMoviesProvider({
    super.key,
    required super.child,
    required this.movies,
    required this.addMovie,
    required this.changeStatusOfMovie,
    required this.changeRating,
  });
  static ListOfMoviesProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ListOfMoviesProvider>();
  }

  @override
  bool updateShouldNotify(ListOfMoviesProvider oldWidget) {
    return oldWidget.movies != movies;
  }
}
