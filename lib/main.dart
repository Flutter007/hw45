import 'package:flutter/material.dart';
import 'package:hw45/hw45.dart';
import 'package:hw45/provider/list_of_movies_state.dart';
import 'package:hw45/screens/movie_form_screen.dart';
import 'package:hw45/screens/movie_info_screen.dart';
import 'package:hw45/theme/light_theme.dart';

import 'app_routes.dart';

void main() {
  runApp(
    ListOfMoviesState(
      child: MaterialApp(
        theme: lightTheme,
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (ctx) => Hw45(),
          AppRoutes.movieForm: (ctx) => MovieForm(),
          AppRoutes.movieInfo: (ctx) => MovieInfoScreen(),
        },
      ),
    ),
  );
}
