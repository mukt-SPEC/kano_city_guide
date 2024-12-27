import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingAlert extends StatefulWidget {
  const RatingAlert({super.key});

  @override
  State<RatingAlert> createState() => _RatingAlertState();
}

class _RatingAlertState extends State<RatingAlert> {
  double? _rating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: 0.0,
        minRating: 1,
        direction: Axis.horizontal,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (rating) {
          setState(() {
            _rating = rating;
          });
        });
  }
}
