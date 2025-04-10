import 'package:flutter/material.dart';
import 'package:hw45/screens/movie_info_screen.dart';
import 'package:hw45/widgets/movie_card.dart';
import '../data/movies_data.dart';

class GoingToWatchScreen extends StatefulWidget {
  const GoingToWatchScreen({super.key});

  @override
  State<GoingToWatchScreen> createState() => _GoingToWatchScreenState();
}

void goToWatch(BuildContext context, String id) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => MovieInfoScreen()),
  );
}

class _GoingToWatchScreenState extends State<GoingToWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 10,
        mainAxisExtent: 250,
      ),
      itemBuilder:
          (ctx, index) => MovieCard(
            movie: moviesData[index],
            onTap: () => goToWatch(context, moviesData[index].id),
          ),
      itemCount: moviesData.length,
    );
  }
}
