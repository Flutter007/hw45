import 'package:flutter/material.dart';

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
    final themeColor = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {
          widget.rateMovie(int.parse(widget.rating));
          changeIsChanged();
        },
        style: TextButton.styleFrom(
          backgroundColor:
              isChanged ? themeColor.onSurface : themeColor.onPrimaryContainer,
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
            color: isChanged ? themeColor.surface : themeColor.onSurface,
          ),
        ),
      ),
    );
  }
}
