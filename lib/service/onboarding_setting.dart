import 'package:shared_preferences/shared_preferences.dart';

class OnboardingSetting {
  static SharedPreferences? _preferences;
  static String onboardKey = 'oKey';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> passOnboardingScreen() async {
    await _preferences!.setBool(onboardKey, false);
  }

  static bool? isFirstTime() {
    return _preferences?.getBool(onboardKey) ?? true;
  }
}
