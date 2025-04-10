import 'package:flutter/material.dart';
import 'package:hw45/data/movies_data.dart';
import 'package:hw45/screens/going_to_watch_screen.dart';
import 'package:hw45/screens/movie_form.dart';
import 'package:hw45/screens/wathed_movies_screen.dart';

import 'models/movie.dart';

class Hw45 extends StatefulWidget {
  const Hw45({super.key});

  @override
  State<Hw45> createState() => _Hw45State();
}

class _Hw45State extends State<Hw45> {
  void addMovie(Movie newMovie) {
    setState(() {
      moviesData.add(newMovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies App'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie), text: 'Going to watch'),
              Tab(icon: Icon(Icons.next_plan), text: 'Watched'),
              Tab(icon: Icon(Icons.edit), text: 'Add new Film'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GoingToWatchScreen(),
            WatchedMoviesScreen(),
            MovieForm(addMovie: addMovie),
          ],
        ),
      ),
    );
  }
}
