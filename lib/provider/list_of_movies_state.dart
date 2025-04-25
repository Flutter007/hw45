import 'package:flutter/material.dart';
import 'package:hw45/provider/list_of_movies_provider.dart';
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

  void changeRating(Movie movie, int? newRating) {
    setState(() {
      movies =
          movies.map((m) {
            return m.id == movie.id ? movie.copyWith(rating: newRating) : m;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListOfMoviesProvider(
      movies: movies,
      addMovie: addMovie,
      changeStatusOfMovie: changeStatusOfMovie,
      changeRating: changeRating,
      child: widget.child,
    );
  }
}
