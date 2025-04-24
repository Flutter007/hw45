import 'package:flutter/material.dart';
import 'package:hw45/models/movie.dart';
import '../data/movies_data.dart';
import '../widgets/custom_text_field.dart';

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
  bool isCorrectFilled = false;

  void addNewMovie(Movie newMovie) {
    setState(() {
      moviesData.add(newMovie);
    });
  }

  void validForm() {
    final isFilled =
        movieNameController.text.isNotEmpty &&
        movieYearController.text.isNotEmpty &&
        movieDescriptionController.text.isNotEmpty &&
        movieImageController.text.isNotEmpty;
    if (isCorrectFilled != isFilled) {
      setState(() {
        isCorrectFilled = isFilled;
      });
    }
  }

  void addMovie() {
    final newMovie = Movie(
      title: movieNameController.text,
      image: movieImageController.text,
      year: movieYearController.text,
      description: movieDescriptionController.text,
    );
    addNewMovie(newMovie);
    isCorrectFilled = false;
    movieDescriptionController.clear();
    movieImageController.clear();
    movieNameController.clear();
    movieYearController.clear();
  }

  @override
  void dispose() {
    movieNameController.dispose();
    movieYearController.dispose();
    movieDescriptionController.dispose();
    movieImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add movie!')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: movieNameController,
              label: 'Movie name',
              onChanged: (value) => validForm(),
            ),
            CustomTextField(
              controller: movieYearController,
              label: 'Year',
              onChanged: (value) => validForm(),
            ),
            CustomTextField(
              controller: movieDescriptionController,
              label: 'Description',
              onChanged: (value) => validForm(),
            ),
            CustomTextField(
              controller: movieImageController,
              label: 'Image',
              onChanged: (value) => validForm(),
            ),
            ElevatedButton(
              onPressed: isCorrectFilled ? addMovie : null,
              child: Text('Add Movie'),
            ),
          ],
        ),
      ),
    );
  }
}
