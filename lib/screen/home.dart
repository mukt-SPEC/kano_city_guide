import 'dart:async';

import 'package:kano_city_guide/core/site_list.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/widget/history.dart';
import 'package:kano_city_guide/widget/places.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int placeCount = places.length;
  Category selectedCategory = Category.all;
  late StreamController<String> streamController = StreamController();

  @override
  void initState() {
    super.initState();
    generateImages();
  }

  void generateImages() async {
    while (true) {
      streamController.sink.add("history1.jpg");
      await Future.delayed(const Duration(seconds: 7));
      streamController.sink.add("history2.jpg");
      await Future.delayed(const Duration(seconds: 7));
      streamController.sink.add("history3.jpg");
      await Future.delayed(const Duration(seconds: 7));
      streamController.sink.add("history4.jpg");
      await Future.delayed(const Duration(seconds: 7));
    }
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        //leading: const Icon(Icons.waving_hand_rounded),
        title: Row(
          children: [
            const Text('👋'),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Kano city guide',
              style: kTextStyle(16),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<String>(
                      stream: streamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return HistoryWidget(
                            imagePath: snapshot.data!,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Places to visit',
                        style: kTextStyle(14, textWeight: TextWeight.semiBold),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         'See more',
                      //         style:
                      //             kTextStyle(12, textWeight: TextWeight.medium),
                      //       ),
                      //       const SizedBox(
                      //         width: 4,
                      //       ),
                      //       const Icon(
                      //         Icons.arrow_forward_ios_rounded,
                      //         size: 18,
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...Category.values.map((category) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ChoiceChip(
                                    backgroundColor: const Color(0xfff4f4f4),
                                    side: const BorderSide(
                                        style: BorderStyle.none),
                                    selectedColor: const Color(0xff121212),
                                    showCheckmark: false,
                                    label: Text(
                                      '${category.name} ${selectedCategory == category ? placeCount : ''}',
                                    ),
                                    labelStyle: TextStyle(
                                        color: selectedCategory == category
                                            ? const Color(0xffffffff)
                                            : const Color(0xff4f4f4f)),
                                    selected: selectedCategory == category,
                                    onSelected: (_) {
                                      setState(() {
                                        selectedCategory = category;
                                        placeCount =
                                            selectedCategory == Category.all
                                                ? places.length
                                                : places
                                                    .where((site) =>
                                                        site.category ==
                                                        selectedCategory)
                                                    .length;
                                      });
                                    }),
                              );
                            })
                          ],
                        ),
                      ],
                    ),
                  )
                  //const SizedBox(height: 8),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  if (selectedCategory == Category.all)
                    ...places.map(
                      (site) => Places(
                        places.indexOf(site),
                      ),
                    )
                  else
                    ...places
                        .where((site) => site.category == selectedCategory)
                        .map(
                          (site) => Places(
                            places.indexOf(site),
                          ),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
