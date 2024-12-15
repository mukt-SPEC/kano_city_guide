import 'package:kano_city_guide/core/enums.dart';
import 'package:flutter/material.dart';

TextStyle kTextStyle(double size,
    {TextWeight textWeight = TextWeight.normal, Color color = Colors.black}) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontFamily: "Poppins",
      fontWeight: switch (textWeight) {
        TextWeight.normal => FontWeight.normal,
        TextWeight.medium => FontWeight.w300,
        TextWeight.semiBold => FontWeight.w500,
        TextWeight.bold => FontWeight.bold,
      });
}
