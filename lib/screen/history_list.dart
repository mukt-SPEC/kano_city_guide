import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/widget/history.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              HistoryWidget('Emir_of_Kano_c.1910.jpg', '1955'),
              SizedBox(
                height: 12,
              ),
              HistoryWidget('Emir_of_Kano_c.1910.jpg', '1955'),
              SizedBox(
                height: 12,
              ),
              HistoryWidget('Emir_of_Kano_c.1910.jpg', '1955'),
              SizedBox(
                height: 12,
              ),
              HistoryWidget('Emir_of_Kano_c.1910.jpg', '1955'),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
