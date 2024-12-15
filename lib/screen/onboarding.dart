import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Container(
                      height: 320,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Kano City App",
                  style: kTextStyle(16,
                      textWeight: TextWeight.semiBold, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Immerse yourself in the beauty of Kano',
                  style: kTextStyle(18,
                      textWeight: TextWeight.normal, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Explore Kano',
                  style: kTextStyle(16,
                      textWeight: TextWeight.semiBold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
