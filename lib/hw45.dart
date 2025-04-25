import 'package:flutter/material.dart';
import 'package:hw45/app_routes.dart';
import 'package:hw45/provider/list_of_movies_state.dart';
import 'package:hw45/screens/movie_form_screen.dart';
import 'package:hw45/screens/movie_info_screen.dart';
import 'package:hw45/screens/start_screen.dart';
import 'package:hw45/theme/light_theme.dart';

class Hw45 extends StatefulWidget {
  const Hw45({super.key});

  @override
  State<Hw45> createState() => _Hw45State();
}

class _Hw45State extends State<Hw45> {
  @override
  Widget build(BuildContext context) {
    return ListOfMoviesState(
      child: MaterialApp(
        theme: lightTheme,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (ctx) => StartScreen(),
          AppRoutes.movieForm: (ctx) => MovieForm(),
          AppRoutes.movieInfo: (ctx) => MovieInfoScreen(),
        },
      ),
    );
  }
}
