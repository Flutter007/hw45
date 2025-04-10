import 'package:flutter/material.dart';

import '../data/movies_data.dart';
import '../models/movie.dart';
import '../widgets/custom_tile.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Image.network(
                  movie.image,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                CustomTile(title: 'Year of product', subtitle: movie.year),
                CustomTile(title: 'Description', subtitle: movie.description),

                RatingSystem(
                  selectRating: (selectedRating) {
                    setState(() {
                      rating = selectedRating;
                      movie.rating = selectedRating;
                    });
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.change_circle, size: 36),
                    TextButton(
                      onPressed: () {
                        changeStatusOfMovie(movie);
                        if (movie.isWatched == false) {
                          movie.rating = null;
                        }
                      },
                      child: Text(
                        movie.isWatched ? 'Back to Watch' : 'Watched',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
