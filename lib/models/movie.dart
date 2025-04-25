import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Movie {
  final String id;
  final String title;
  final String image;
  final String year;
  final String description;
  final bool isWatched;
  final int? rating;

  Movie({
    String? id,
    required this.title,
    required this.image,
    required this.year,
    required this.description,
    this.isWatched = false,
    this.rating,
  }) : id = id ?? uuid.v4();

  Movie copyWith({
    String? id,
    String? title,
    String? image,
    String? year,
    String? description,
    bool? isWatched,
    int? rating,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      year: year ?? this.year,
      description: description ?? this.description,
      isWatched: isWatched ?? this.isWatched,
      rating: rating ?? this.rating,
    );
  }
}
