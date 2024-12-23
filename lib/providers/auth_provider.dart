import 'package:flutter/material.dart';
import 'package:kano_city_guide/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool? isloading;
  // bool? isSignedIn;
  AuthService? authService;

  AuthProvider() {
    authService = AuthService();
    isloading = false;
  }

  void signIn(BuildContext context, String email, String password) async {
    isloading = true;
    notifyListeners();
    await authService!
        .signIn(context: context, email: email, password: password);
    isloading = false;
    notifyListeners();
  }

  void signUp(
      BuildContext context, String name, String email, String password) async {
    isloading = true;
    notifyListeners();
    await authService!
        .signUp(context: context, name: name, email: email, password: password);
    isloading = false;
    notifyListeners();
  }

  void signOut(BuildContext context) async {
    isloading = true;
    notifyListeners();
    await authService!.signOut(
      context,
    );
    isloading = false;
    notifyListeners();
  }
}
