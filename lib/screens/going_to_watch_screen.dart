import 'package:flutter/material.dart';
import 'package:hw45/data/movies_data.dart';

import '../widgets/movie_card.dart';
import 'movie_info_screen.dart';

class GoingToWatchScreen extends StatefulWidget {
  const GoingToWatchScreen({super.key});

  @override
  State<GoingToWatchScreen> createState() => _GoingToWatchScreenState();
}

class _GoingToWatchScreenState extends State<GoingToWatchScreen> {
  void goToWatch(String id) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => MovieInfoScreen(movieId: id)),
    );
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    final sortedMovie =
        moviesData.where((element) => element.isWatched == false).toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        mainAxisExtent: 280,
      ),
      itemBuilder:
          (ctx, index) => MovieCard(
            movie: sortedMovie[index],
            onTap: () => goToWatch(sortedMovie[index].id),
          ),
      itemCount: sortedMovie.length,
    );
  }
}
