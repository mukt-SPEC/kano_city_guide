import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/site_list.dart';

import '../core/textstyle.dart';

import 'package:kano_city_guide/main.dart';
import 'package:kano_city_guide/model/tourist_site.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/service/db.dart';
import 'package:kano_city_guide/widget/bottom_modal.dart';
import 'package:kano_city_guide/widget/review_modal.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Touristsite site;
  const DetailsPage({required this.site, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? _rating;
    int reviewCount = 0;
    final site = widget.site;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: Text(
          site.placeName!,
          style: kTextStyle(20, textWeight: TextWeight.semiBold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xfff2f2f2),
                    ),
                    child: CarouselView(itemExtent: double.infinity, children: [
                      ...site.placeImages.map((image) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              opacity: 0.9,
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/$image'),
                            ),
                          ),
                        );
                      })
                    ]),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            site.address!,
                            style:
                                kTextStyle(14, textWeight: TextWeight.normal),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => FirebaseAuth.instance.currentUser != null
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: RatingBar.builder(
                                      initialRating: 0.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          _rating = rating;
                                        });
                                      }),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        await DataBase().createRating(
                                          _rating!,
                                          places.indexOf(site),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Rate Now'),
                                    )
                                  ],
                                ),
                              )
                            : showModalBottomSheet(
                                isScrollControlled: true,
                                showDragHandle: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                ),
                                context: context,
                                builder: (context) => const BottomModal(),
                              ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 168, 152, 10),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            FutureBuilder(
                                future:
                                    DataBase().getRating(places.indexOf(site)),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.toString() ?? '0.0',
                                      style: kTextStyle(14,
                                          textWeight: TextWeight.semiBold),
                                    );
                                  } else if (snapshot.hasError) {
                                    log(snapshot.error.toString());
                                    return  const Text('0.0');
                                  } else {
                                    return const Text('0.0');
                                  }
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Description',
                    style: kTextStyle(16, textWeight: TextWeight.semiBold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    site.description!,
                    style: kTextStyle(12),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Location',
                    style: kTextStyle(16, textWeight: TextWeight.semiBold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reviews'),
                          Text(
                            reviewCount.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FirebaseAuth.instance.currentUser != null
                          ? StreamBuilder(
                              stream: DataBase().retreiveReview(
                                  context, places.indexOf(site)),
                              builder: (ctx, snapshot) {
                                if (snapshot.hasData) {
                                  //reviewCount = snapshot.data!.length;
                                  log(snapshot.data.toString());
                                  final reviews = snapshot.data;
                                  return InkWell(
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
                                          builder: (ctx) {
                                            return ReviewModal(
                                              review: snapshot.data,
                                              siteId: places.indexOf(site),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        // height: 104,
                                        padding: const EdgeInsets.all(18),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffe6e6e6),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            reviews!.isEmpty
                                                ? Text("No reviews yet")
                                                : Column(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          FutureBuilder(
                                                            future: DataBase()
                                                                .retrieveUser(
                                                                    context,
                                                                    reviews[0]
                                                                        .userId!),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                  .hasData) {
                                                                final user =
                                                                    snapshot
                                                                        .data;
                                                                return Text(
                                                                  user!.name!,
                                                                  style: kTextStyle(
                                                                      12,
                                                                      textWeight:
                                                                          TextWeight
                                                                              .semiBold),
                                                                );
                                                              } else if (snapshot
                                                                  .hasError) {
                                                                return Text(
                                                                    "A error occured");
                                                              }
                                                              return Text('');
                                                            },
                                                          ),
                                                          Text(
                                                            reviews[0].review!,
                                                            style:
                                                                kTextStyle(16),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                          ],
                                        ),
                                      ));
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              })
                          : InkWell(
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
                              },
                              child: Text('Sign in to see reviews'))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 1.5,
                        color: const Color(0xff121212),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
