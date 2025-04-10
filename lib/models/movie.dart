import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Movie {
  final String id;
  final String title;
  final String image;
  final String year;
  final String description;
  bool isWatched;

  Movie({
    String? id,
    required this.title,
    required this.image,
    required this.year,
    required this.description,
    this.isWatched = false,
  }) : id = id ?? uuid.v4();
}
