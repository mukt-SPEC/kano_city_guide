import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/model/coordinate.dart';

class Touristsite {
  final int?  userReview;
  final Coordinate? coordinate;
  final String? placeName, address, description;
  final Category? category;
  final double? rating;
  List<String> placeImages;

  Touristsite(
      {this.coordinate,
      this.placeName,
      this.category,
      this.address,
      this.description,
      required this.placeImages,
      this.userReview,
      this.rating});
}
