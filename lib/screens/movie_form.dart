import 'package:flutter/material.dart';
import 'package:hw45/models/movie.dart';
import '../widgets/custom_textfield.dart';

class MovieForm extends StatefulWidget {
  final void Function(Movie newMovie) addMovie;
  const MovieForm({super.key, required this.addMovie});

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  var movieNameController = TextEditingController();
  var movieYearController = TextEditingController();
  var movieDescriptionController = TextEditingController();
  var movieImageController = TextEditingController();

  void addMovie() {
    final newMovie = Movie(
      title: movieNameController.text,
      image: movieImageController.text,
      year: movieYearController.text,
      description: movieDescriptionController.text,
    );
    widget.addMovie(newMovie);
    movieDescriptionController.clear();
    movieImageController.clear();
    movieNameController.clear();
    movieYearController.clear();
  }

  @override
  Widget build(BuildContext context) {
    bool isRightCompleted =
        movieNameController.text.isNotEmpty &&
        movieYearController.text.isNotEmpty &&
        movieDescriptionController.text.isNotEmpty &&
        movieImageController.text.isNotEmpty;

    return SafeArea(
      child: Column(
        children: [
          CustomTextField(controller: movieNameController, label: 'Movie name'),
          CustomTextField(controller: movieYearController, label: 'Year'),
          CustomTextField(
            controller: movieDescriptionController,
            label: 'Description',
          ),
          CustomTextField(controller: movieImageController, label: 'Image'),
          ElevatedButton(
            onPressed: isRightCompleted ? addMovie : null,
            child: Text('Add Movie'),
          ),
        ],
      ),
    );
  }
}
