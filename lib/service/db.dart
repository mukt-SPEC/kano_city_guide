import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/model/review.dart';
import 'package:kano_city_guide/model/user.dart';
import 'package:kano_city_guide/screen/favorite.dart';

class DataBase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> createUser(BuildContext context, User user) async {
    try {
      await firestore.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<User?> retrieveUser(BuildContext context, String id) async {
    try {
      final doc = await firestore.collection('Users').doc(id).get();
      return User.fromJson(doc.data()!);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<void> createReview(BuildContext context, Review review) async {
    try {
      await firestore.collection('Reviews').doc().set(review.toJson());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Stream<List<Review>>? retreiveReview(BuildContext context, int id) {
    try {
      return firestore
          .collection('Reviews')
          .where('siteId', isEqualTo: id)
          .snapshots()
          .map((e) => e.docs.map((e) => Review.fromJson(e.data())).toList());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
      return null;
    }
  }

  Future<void> createRating(double rating, int placeId) async {
    await firestore.collection('Ratings').doc('place$placeId').set({
      'ratings': FieldValue.arrayUnion([rating])
    });
  }

  Future<double?> getRating(int placeId) async {
    final doc =
        await firestore.collection('Ratings').doc('place$placeId').get();
        log(doc.data().toString());
    final ratings = List.from(doc.data()!['ratings']);
    return ratings.reduce((a, b) => a + b) / ratings.length ?? 0.0;
  
  }

  Future<void> addFavoritePlace(String userId, int placeId) async {
    await firestore.collection('Users').doc(userId).update({
      'favouritePlaces': FieldValue.arrayUnion([placeId])
    });
  }

  Future<void> removeFavoritePlace(String userId, int placeId) async {
    await firestore.collection('Users').doc(userId).update({
      'favouritePlaces': FieldValue.arrayRemove([placeId])
    });
  }

  Stream<User> retrieveUserStream(String id) {
    return firestore.collection('Users').doc(id).snapshots().map((e) {
      return User.fromJson(e.data()!);
    });
  }
}
