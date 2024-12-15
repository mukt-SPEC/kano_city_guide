import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';

import '../core/textstyle.dart';

class HistoryWidget extends StatelessWidget {
  final String imagePath;
  const HistoryWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.7,
          fit: BoxFit.fill,
          image: AssetImage('assets/images/$imagePath'),
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7), BlendMode.overlay),
        ),
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: const Color(0xFFF1F1F1),
      ),
      width: double.infinity,
      height: 104,
      child: Center(
        child: Text(
          'History of kano',
          style: kTextStyle(
            18,
            textWeight: TextWeight.semiBold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
