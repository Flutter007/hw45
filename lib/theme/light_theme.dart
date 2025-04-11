import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.lime);
final defaultTheme = ThemeData.light();
final lightTheme = defaultTheme.copyWith(
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.inversePrimary,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),
  scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
  iconTheme: IconThemeData(color: lightColorScheme.onPrimaryContainer),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.surface,
    labelStyle: TextStyle(color: lightColorScheme.onSurface),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface),
    ),
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: lightColorScheme.primary,
    labelColor: lightColorScheme.onSurface,
    unselectedLabelColor: Colors.blueGrey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20, color: lightColorScheme.onPrimary),
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
    ),
  ),
);
