import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/model/coordinate.dart';

class Touristsite {
  final int? userReview;
  final Coordinate? coordinate;
  final String? placeName, address, description;
  final Category? category;
  double? rating;
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

  Map<String, dynamic> toJson() {
    return {
      'placeName': placeName,
      'category': category!.index,
      'address': address,
      'description': description,
      'placeImages': placeImages,
      'userReview': userReview,
      'rating': rating,
      'coordinate': coordinate,
    };
  }

  factory Touristsite.fromJson(Map<String, dynamic> data) {
    return Touristsite(
      placeName: data['placeName'],
      category: Category.values[data['category']],
      address: data['address'],
      description: data['description'],
      placeImages: List<String>.from(data['placeImages']),
      userReview: data['userReview'],
      rating: data['rating'],
      coordinate: data['coordinate'],
    );
  }
}
