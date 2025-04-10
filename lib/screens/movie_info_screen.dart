import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../models/movie.dart';
import '../widgets/rating_system.dart';

class MovieInfoScreen extends StatefulWidget {
  final String movieId;
  const MovieInfoScreen({super.key, required this.movieId});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  late Movie movie;
  int? rating;
  bool isChanged = false;
  @override
  void initState() {
    super.initState();
    movie = moviesData.firstWhere((element) => element.id == widget.movieId);
  }

  void changeStatusOfMovie(Movie movie) {
    setState(() {
      movie.isWatched = !movie.isWatched;
    });
  }

  void changeRating(Movie movie) {
    setState(() {
      movie.rating = rating;
    });
  }

  void changeIsChanged() {
    setState(() {
      isChanged = !isChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(
                movie.image,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              ListTile(
                title: Text('Year of product'),
                subtitle: Text(movie.year),
              ),
              ListTile(
                title: Text('Description'),
                subtitle: Text(movie.description),
              ),
              ElevatedButton(
                onPressed: () {
                  changeStatusOfMovie(movie);
                  if (movie.isWatched == false) {
                    movie.rating = null;
                  }
                },
                child: Text(movie.isWatched ? 'Going to watch' : 'Watched'),
              ),
              RatingSystem(
                selectRating: (selectedRating) {
                  setState(() {
                    rating = selectedRating;
                    movie.rating = selectedRating;
                    isChanged = true;
                  });
                },
                changeState: changeIsChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
