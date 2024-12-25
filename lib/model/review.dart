class Review {
  String?  userId,  review;
  int? siteId;
  double? rating;

  Review({this.userId, this.rating, this.review, this.siteId});

  Map<String, dynamic> toJson() {
    return {

      'userId': userId,
      'siteId': siteId,
      'review': review,
      'rating': rating,
    };
  }
  factory Review.fromJson(Map<String, dynamic> data) {
    return Review(
      userId: data['userId'],
      siteId: data['siteId'],
      review: data['review'],
      rating: data['rating'],
    );
  }
}
