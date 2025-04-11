import 'package:flutter/material.dart';
import 'package:hw45/theme/light_theme.dart';

class RatingButton extends StatefulWidget {
  final Function(int) rateMovie;
  final String rating;
  const RatingButton({
    super.key,
    required this.rateMovie,
    required this.rating,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  bool isChanged = false;
  void changeIsChanged() {
    setState(() {
      isChanged = !isChanged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          widget.rateMovie(int.parse(widget.rating));
          changeIsChanged();
        },
        style: TextButton.styleFrom(
          backgroundColor:
              isChanged ? lightColorScheme.onSurface : lightColorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                isChanged
                    ? BorderRadius.circular(25)
                    : BorderRadius.circular(35),
          ),
        ),
        child: Text(
          widget.rating,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:
                isChanged
                    ? lightColorScheme.surface
                    : lightColorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
