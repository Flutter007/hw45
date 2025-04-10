import 'package:flutter/material.dart';
import 'package:hw45/models/movie.dart';
import '../data/movies_data.dart';
import '../widgets/custom_textfield.dart';

class MovieForm extends StatefulWidget {
  const MovieForm({super.key});

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  var movieNameController = TextEditingController();
  var movieYearController = TextEditingController();
  var movieDescriptionController = TextEditingController();
  var movieImageController = TextEditingController();

  void addNewMovie(Movie newMovie) {
    setState(() {
      moviesData.add(newMovie);
    });
  }

  void addMovie() {
    final newMovie = Movie(
      title: movieNameController.text,
      image: movieImageController.text,
      year: movieYearController.text,
      description: movieDescriptionController.text,
    );
    addNewMovie(newMovie);
    movieDescriptionController.clear();
    movieImageController.clear();
    movieNameController.clear();
    movieYearController.clear();
  }

  @override
  Widget build(BuildContext context) {
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
          ElevatedButton(onPressed: addMovie, child: Text('Add Movie')),
        ],
      ),
    );
  }
}
