import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      String? error;
      if (e.code == 'user-not-found') {
        error = "User not found";
      } else if (e.code == "wrong-password") {
        error = "Incorrect password";
      } else if (e.code == "network-request-failed") {
        error = "A network error occured, check your internet settings";
      } else {
        error = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error!,
          ),
        ),
      );
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      String? error;
      if (e.code == 'email-already-in-use') {
        error = "email already in use";
      } else if (e.code == "network-request-failed") {
        error = "A network occured, check your internet settings";
      } else {
        error = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error!,
          ),
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }
}
