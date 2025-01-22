import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/site_list.dart';
import 'package:kano_city_guide/widget/attribution.dart';
import 'package:latlong2/latlong.dart';

import '../core/textstyle.dart';

import 'package:kano_city_guide/main.dart';
import 'package:kano_city_guide/model/tourist_site.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/service/db.dart';
import 'package:kano_city_guide/widget/bottom_modal.dart';
import 'package:kano_city_guide/widget/review_modal.dart';
import 'package:provider/provider.dart';

import '../model/rate.dart';

class DetailsPage extends StatefulWidget {
  final Touristsite site;
  const DetailsPage({required this.site, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double? ratingX = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
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
                      borderRadius: BorderRadius.circular(0),
                      //color: const Color(0xfff2f2f2),
                    ),
                    child: CarouselView(
                        itemExtent: 340,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        children: [
                          ...site.placeImages.map((image) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
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
                          SizedBox(
                            width: 300,
                            child: Text(
                              site.address!,
                              style:
                                  kTextStyle(14, textWeight: TextWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => FirebaseAuth.instance.currentUser != null
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          ratingX = rating;
                                        });
                                      }),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final rate = Rate(
                                            uId: FirebaseAuth
                                                .instance.currentUser!.uid,
                                            rating: ratingX!,
                                            placeId: places.indexOf(site));
                                        log(rate.toString());
                                        await DataBase().createRating(
                                          rate,
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Rate Now'),
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
                            StreamBuilder(
                                stream:
                                    DataBase().getRating(places.indexOf(site)),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data!.toStringAsFixed(1),
                                      style: kTextStyle(14,
                                          textWeight: TextWeight.semiBold),
                                    );
                                  } else if (snapshot.hasError) {
                                    log(snapshot.error.toString(),
                                        stackTrace: snapshot.stackTrace);
                                    return const Text('0.0');
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
                  Row(
                    children: [
                      const Icon(
                        Icons.info_rounded,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Description',
                        style: kTextStyle(16, textWeight: TextWeight.semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      site.description!,
                      style: kTextStyle(14),
                    ),
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
                          Row(
                            children: [
                              const Icon(
                                Icons.rate_review_rounded,
                                color: Colors.brown,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Reviews',
                                style: kTextStyle(16,
                                    textWeight: TextWeight.semiBold),
                              ),
                            ],
                          ),
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
                                            color: Colors.brown[50],
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            reviews!.isEmpty
                                                ? const Text("No reviews yet")
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
                                                                return const Text(
                                                                    "A error occured");
                                                              }
                                                              return const Text(
                                                                  '');
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
                                return const Center(
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
                              child: const Text('Sign in to see reviews'))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.map_rounded,
                        color: Colors.brown,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Map',
                        style: kTextStyle(16, textWeight: TextWeight.semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: const BoxDecoration(
                            color: Color(0xfff2f2f2),
                          ),
                          child: FlutterMap(
                              options: MapOptions(
                                initialCenter: LatLng(
                                    site.coordinate!.latitude!,
                                    site.coordinate!.longitude!),
                                initialZoom: 16,
                                maxZoom: 19,
                                minZoom: 3,
                              ),
                              children: [
                                TileLayer(
                                    urlTemplate:
                                        'https://api.mapbox.com/styles/v1/nanafirdaus/cm5nudaqf00d901rz67s03j1c/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmFuYWZpcmRhdXMiLCJhIjoiY201bWg0OHVtMDA0cTJoczhuZ29iamg5ayJ9.tLHLFHtZUjKGBzT-C6LMQg',
                                    userAgentPackageName:
                                        'com.example.kano_city_guide',
                                    additionalOptions: const {
                                      'accessToken':
                                          'pk.eyJ1IjoibmFuYWZpcmRhdXMiLCJhIjoiY201bWg0OHVtMDA0cTJoczhuZ29iamg5ayJ9.tLHLFHtZUjKGBzT-C6LMQg',
                                      'id':
                                          'mapbox://styles/nanafirdaus/cm5nudaqf00d901rz67s03j1c'
                                    }),
                                MarkerLayer(markers: [
                                  Marker(
                                      width: 80.0,
                                      height: 80.0,
                                      point: LatLng(site.coordinate!.latitude!,
                                          site.coordinate!.longitude!),
                                      child: Container(
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ))
                                ])
                              ]),
                        ),
                        const AttributionWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
