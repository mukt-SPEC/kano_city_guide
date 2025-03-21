import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kano_city_guide/core/site_list.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/screen/favorite.dart';
import 'package:kano_city_guide/screen/history_list.dart';
import 'package:kano_city_guide/screen/profile_page.dart';
import 'package:kano_city_guide/widget/history.dart';
import 'package:kano_city_guide/widget/places.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_modal.dart';

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

  String nameInitials(String name) {
    List<String> nameSplit = name.split(' ');
    return nameSplit[0][0].toUpperCase() + nameSplit[1][0].toUpperCase();
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
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              // initialData: User(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return RichText(
                    text: TextSpan(
                      text: 'Hello, ',
                      style: kTextStyle(14),
                      children: [
                        TextSpan(
                          text: FirebaseAuth.instance.currentUser!.displayName!
                              .split(' ')
                              .first,
                          style: kTextStyle(
                            16,
                            textWeight: TextWeight.semiBold,
                            color: Colors.brown[500]!,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return RichText(
                  text: TextSpan(
                    text: 'Hello, ',
                    style: kTextStyle(14),
                    children: [
                      TextSpan(
                        text: ' Guest',
                        style: kTextStyle(
                          16,
                          textWeight: TextWeight.semiBold,
                          color: Colors.brown[500]!,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.brown,
                  ),
                ),
                StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      child: FirebaseAuth.instance.currentUser == null
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) => const BottomModal(),
                                );

                                // : Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => const ProfilePage(),
                                //     ),
                                //   );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.brown[50],
                                radius: 18,
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.brown,
                                ),
                              ),
                            )
                          : PopupMenuButton(
                              icon: CircleAvatar(
                                backgroundColor: Colors.brown[50],
                                radius: 18,
                                child: Text(
                                  nameInitials(FirebaseAuth
                                      .instance.currentUser!.displayName!),
                                  style: kTextStyle(14,
                                      color: Colors.brown[500]!,
                                      textWeight: TextWeight.medium),
                                ),
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: ListTile(
                                      title: const Text('Sign Out'),
                                      onTap: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ];
                              },
                            ),
                    );
                  },
                ),
              ],
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
                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HistoryList(),
                              ),
                            ),
                            child: HistoryWidget(
                                snapshot.data!, 'History of kano'),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.apartment_rounded,
                        size: 18,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
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
                                    backgroundColor: Colors.brown[50],
                                    side: const BorderSide(
                                        style: BorderStyle.none),
                                    selectedColor: Colors.brown,
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
                        sites: site,
                      ),
                    )
                  else
                    ...places
                        .where((site) => site.category == selectedCategory)
                        .map(
                          (site) => Places(
                            places.indexOf(site),
                            sites: site,
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
