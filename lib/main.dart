//import 'package:kano_city_guide/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/screen/home.dart';
import 'package:kano_city_guide/screen/onboarding.dart';
import 'package:kano_city_guide/service/onboarding_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnboardingSetting.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingSetting.isFirstTime()!
          ? const OnboardingScreen()
          : const HomePage(),
    );
  }
}
