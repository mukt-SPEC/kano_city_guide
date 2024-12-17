import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/service/onboarding_setting.dart';

import 'home.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
            image: const AssetImage(
              'assets/images/onboarding.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.overlay),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(72.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(14)),
                ),
                Column(
                  children: [
                    Text(
                      'lore ipsssg gsfggfgefftefdfefgfefdgffdg',
                      style: kTextStyle(
                        14,
                        color: const Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async{
                          await OnboardingSetting.passOnboardingScreen();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'Explore Kano',
                          style: kTextStyle(18,
                              textWeight: TextWeight.semiBold,
                              color: const Color(0xffffffff)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
