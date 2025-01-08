import 'package:flutter/material.dart';
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
          child: PageView.builder(
              itemCount: histories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      histories[index].header!,
                      style: kTextStyle(16),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      'assets/images/${histories[index].image}',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      histories[index].description!,
                      style: kTextStyle(14),
                    ),
                  ],
                );
              }),
        ));
  }
}
