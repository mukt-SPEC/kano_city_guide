import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/model/user.dart';

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
}
