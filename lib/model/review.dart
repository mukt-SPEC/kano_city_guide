class Review {
  String? userId, review;
  int? siteId;

  Review({this.userId, this.review, this.siteId});

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'siteId': siteId,
      'review': review,
    };
  }

  factory Review.fromJson(Map<String, dynamic> data) {
    return Review(
      userId: data['userId'],
      siteId: data['siteId'],
      review: data['review'],
    );
  }
}
