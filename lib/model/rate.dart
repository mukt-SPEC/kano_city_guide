// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rate {
  String? uId;
  int? placeId;
  double? rating;

  Rate({this.uId, this.rating, this.placeId});

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      uId: json['uId'],
      placeId: json['placeId'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uId'] = uId;
    data['placeId'] = placeId;
    data['rating'] = rating;
    return data;
  }

  Rate copyWith({String? uId, int? placeId, double? rating}) {
    return Rate(
      uId: uId ?? this.uId,
      placeId: placeId ?? this.placeId,
      rating: rating ?? this.rating,
    );
  }

  @override
  String toString() => 'Rate(uId: $uId, placeId: $placeId, rating: $rating)';
}

class RateArray {
  List<Rate>? ratings;

  RateArray({this.ratings});

  factory RateArray.fromJson(Map<String, dynamic> json) {
    return RateArray(
      ratings: List<Rate>.from(json['ratings'].map((x) => Rate.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ratings'] = ratings!.map((e) => e.toJson()).toList();
    return data;
  }

  @override
  String toString() => 'RateArray(ratings: $ratings)';
}
