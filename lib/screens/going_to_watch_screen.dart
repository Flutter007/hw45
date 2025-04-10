import 'package:flutter/material.dart';

import 'package:hw45/widgets/grid_movie_builder.dart';

class GoingToWatchScreen extends StatefulWidget {
  const GoingToWatchScreen({super.key});

  @override
  State<GoingToWatchScreen> createState() => _GoingToWatchScreenState();
}

class _GoingToWatchScreenState extends State<GoingToWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return GridMovieBuilder();
  }
}
