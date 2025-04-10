import 'package:flutter/material.dart';
import 'package:hw45/widgets/rating_button.dart';

class RatingSystem extends StatelessWidget {
  final Function(int) selectRating;
  final void Function() changeState;

  const RatingSystem({
    super.key,
    required this.selectRating,
    required this.changeState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Rate Movie:', style: Theme.of(context).textTheme.titleLarge!),
          SizedBox(height: 10),
          Row(
            children: [
              RatingButton(rateMovie: selectRating, rating: '1'),
              RatingButton(rateMovie: selectRating, rating: '2'),
              RatingButton(rateMovie: selectRating, rating: '3'),
              RatingButton(rateMovie: selectRating, rating: '4'),
              RatingButton(rateMovie: selectRating, rating: '5'),
            ],
          ),
        ],
      ),
    );
  }
}
