import 'package:flutter/material.dart';

class ReviewLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xffe0e0e0),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  color: const Color(0xffe0e0e0),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 282,
                  height: 10,
                  color: const Color(0xffe0e0e0),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
