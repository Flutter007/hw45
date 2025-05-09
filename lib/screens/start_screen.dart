import 'package:flutter/material.dart';
import 'package:hw45/app_routes.dart';
import 'package:hw45/screens/going_to_watch_screen.dart';
import 'package:hw45/screens/watched_movies_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void addMovieForm() async {
    await Navigator.of(context).pushNamed(AppRoutes.movieForm);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies App'),
          actions: [
            IconButton(onPressed: addMovieForm, icon: Icon(Icons.edit)),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie), text: 'Going to watch'),
              Tab(icon: Icon(Icons.next_plan), text: 'Watched'),
            ],
          ),
        ),
        body: TabBarView(
          children: [GoingToWatchScreen(), WatchedMoviesScreen()],
        ),
      ),
    );
  }
}
