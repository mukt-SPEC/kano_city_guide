//import 'package:kano_city_guide/screen/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/providers/auth_provider.dart';
import 'package:kano_city_guide/screen/home.dart';
import 'package:kano_city_guide/screen/onboarding.dart';
import 'package:kano_city_guide/service/onboarding_setting.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await OnboardingSetting.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingSetting.isFirstTime()!
            ? const OnboardingScreen()
            : const HomePage(),
      ),
    );
  }
}
