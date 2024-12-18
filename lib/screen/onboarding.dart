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
            padding: const EdgeInsets.fromLTRB(16, 96, 16, 48),
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
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff000000).withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Welcome to Kano',
                            style: kTextStyle(
                              20,
                              textWeight: TextWeight.semiBold,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'You\'ve taken the first step towards an unforgettable exploration. Get ready to discover hidden gems, savor local flavors, and immerse yourself in the vibrant culture of Northern Nigeria. Let\'s find your way around. ',
                            style: kTextStyle(
                              14,
                              textWeight: TextWeight.normal,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                        onPressed: () async {
                          //await OnboardingSetting.passOnboardingScreen();
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
