import 'package:flutter/material.dart';
import 'package:hw45/hw45.dart';
import 'package:hw45/screens/movie_form_screen.dart';
import 'package:hw45/theme/light_theme.dart';

import 'app_routes.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => Hw45(),
        AppRoutes.movieForm: (ctx) => MovieForm(),
      },
    ),
  );
}
