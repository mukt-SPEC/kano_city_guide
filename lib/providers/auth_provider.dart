import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:kano_city_guide/model/user.dart';
import 'package:kano_city_guide/service/auth_service.dart';
import 'package:kano_city_guide/service/db.dart';

class AuthProvider extends ChangeNotifier {
  bool? isloading;
  DataBase? dataBase;
  // bool? isSignedIn;
  AuthService? authService;

  AuthProvider() {
    authService = AuthService();
    isloading = false;
    dataBase = DataBase();
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    isloading = true;
    notifyListeners();
    await authService!
        .signIn(context: context, email: email, password: password);
    isloading = false;
    notifyListeners();
  }

  Future<void> signUp(
      BuildContext context, String name, String email, String password) async {
    try {
      isloading = true;
      notifyListeners();
      await authService!.signUp(
          context: context, name: name, email: email, password: password);
      await dataBase!.createUser(
        context,
        User(
          id: FirebaseAuth.instance.currentUser!.uid,
          name: name,
          email: email,
          favouritePlaces: [],
        ),
      );
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      isloading = true;
      notifyListeners();
      await authService!.signOut(
        context,
      );
      isloading = false;
    } catch (e) {
      isloading = false;
      notifyListeners();
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
