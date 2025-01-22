import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/widget/history.dart';

import '../core/histories.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History of Kano',
          style: kTextStyle(16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kano City',
                  style: kTextStyle(14, textWeight: TextWeight.semiBold),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/20241210_113130.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                    'Kano is a city in northern Nigeria with a rich and fascinating history dating back centuries. The city has been a center of trade, culture, and learning for much of its existence, and it continues to play an important role in Nigerian society today.',
                    style: kTextStyle(
                      18,
                    ),
                    textAlign: TextAlign.justify),
                const SizedBox(height: 16),
                Text(
                  'Early History',
                  style: kTextStyle(
                    14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/lossy-page1-2560px-ETH-BIB-Die_beiden_Emire_von_Kano_und_Kadsena_nach_ihrem_ersten_Fluge-Tschadseeflug_1930-31-LBS_MH02-08-0732.tif.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'The exact origins of Kano are unknown, but it is believed to have been founded in the 10th century by the Habe people. The city grew rapidly in the 15th and 16th centuries, becoming a major center of the trans-Saharan trade. Kano was also a center of Islamic learning, and many famous scholars and religious leaders lived there.',
                  style: kTextStyle(18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Text(
                  'Early History',
                  style: kTextStyle(14),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/20241210_111407.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),

                const SizedBox(height: 16),
                Text(
                  'In the 19th century, Kano was conquered by the Fulani Empire. The Fulani were a Muslim people who had migrated to West Africa from the Sahel region. The Fulani established a powerful and prosperous empire in northern Nigeria, with Kano as one of its most important cities',
                  style: kTextStyle(18),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Text(
                  'The British Colonial Period',
                  style: kTextStyle(14),
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/20241210_103834.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'In 1903, Kano was conquered by the British Empire. The British established a colonial administration in Kano, and the city became an important center of British rule in northern Nigeria.',
                  style: kTextStyle(18),
                  textAlign: TextAlign.justify,
                ),
                //const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
