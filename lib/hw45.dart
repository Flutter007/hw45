import 'package:flutter/material.dart';
import 'package:hw45/screens/going_to_watch_screen.dart';
import 'package:hw45/screens/movie_form_screen.dart';
import 'package:hw45/screens/watched_movies_screen.dart';

class Hw45 extends StatefulWidget {
  const Hw45({super.key});

  @override
  State<Hw45> createState() => _Hw45State();
}

class _Hw45State extends State<Hw45> {
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
          children: [GoingToWatchScreen(), WatchedMoviesScreen(), MovieForm()],
        ),
      ),
    );
  }
}
