import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../provider/list_of_movies_provider.dart';
import '../widgets/custom_tile.dart';
import '../widgets/rating_system.dart';

class MovieInfoScreen extends StatefulWidget {
  const MovieInfoScreen({super.key});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  late Movie movie;
  int? rating;
  late List<Movie> movies;
  late ListOfMoviesProvider provider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final argument = ModalRoute.of(context)!.settings.arguments as String;
    final movieId = argument;
    provider = ListOfMoviesProvider.of(context)!;
    movies = provider.movies;
    movie = movies.firstWhere((m) => m.id == movieId);
  }

  void changeStatusOfMovie(Movie movie) {
    provider.changeStatusOfMovie(movie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 350,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(movie.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                CustomTile(title: 'Title', subtitle: movie.title),
                CustomTile(title: 'Year of product', subtitle: movie.year),
                CustomTile(title: 'Description', subtitle: movie.description),
                if (movie.isWatched == true)
                  RatingSystem(
                    selectRating: (selectedRating) {
                      setState(() {
                        final provider = ListOfMoviesProvider.of(context)!;

                        provider.changeRating(movie, selectedRating);
                      });
                    },
                  ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.change_circle, size: 36),
                    ElevatedButton(
                      onPressed: () {
                        changeStatusOfMovie(movie);
                        if (movie.isWatched == false) {
                          movie.rating = null;
                        }
                      },
                      child: Text(
                        movie.isWatched ? 'Back to Watch' : 'Watched',
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
