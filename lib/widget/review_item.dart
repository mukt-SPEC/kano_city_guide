import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/model/review.dart';

class ReviewItem extends StatelessWidget {
  String? username, review;
  ReviewItem({this.username, this.review, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            username!,
            style: kTextStyle(12, textWeight: TextWeight.medium),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            review!,
            style: kTextStyle(16),
          )
        ],
      ),
    );
  }
}
