import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:kano_city_guide/core/enums.dart';

import 'package:kano_city_guide/core/textstyle.dart';
//import 'package:kano_city_guide/model/tourist_site.dart';
import 'package:kano_city_guide/screen/details_page.dart';
import 'package:flutter/material.dart';

import '../core/site_list.dart';
import '../model/tourist_site.dart';
import '../model/user.dart';
import '../service/db.dart';

class Places extends StatelessWidget {
  final Touristsite? sites;
  final int index;

  const Places(this.index, {this.sites, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsPage(site: places[index]),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.9,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.low,
                    image: AssetImage(
                        "assets/images/${places[index].placeImages[0]}"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.overlay),
                  ),
                  color: const Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: FirebaseAuth.instance.currentUser == null
                    ? const SizedBox()
                    // ? Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       color: const Color.fromARGB(255, 143, 142, 142)
                    //           .withOpacity(0.5),
                    //     ),
                    //     child: const Padding(
                    //       padding: EdgeInsets.all(8.0),
                    //       child: Icon(
                    //         Icons.bookmark_border,
                    //         size: 18,
                    //       ),
                    //     ),
                    //   )
                    : StreamBuilder(
                        stream: DataBase().retrieveUserStream(
                            FirebaseAuth.instance.currentUser!.uid),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return const Text('No user data available');
                          } else {
                            User user = snapshot.data!;
                            return InkWell(
                              onTap: () => user.favouritePlaces!.contains(index)
                                  ? DataBase().removeFavoritePlace(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      index,
                                    )
                                  : DataBase().addFavoritePlace(
                                      FirebaseAuth.instance.currentUser!.uid,
                                      index,
                                    ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:
                                      const Color.fromARGB(255, 143, 142, 142)
                                          .withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: user.favouritePlaces!.contains(index)
                                      ? const Icon(
                                          Icons.bookmark,
                                          size: 18,
                                          color: Colors.brown,
                                        )
                                      : const Icon(
                                          Icons.bookmark_border,
                                          size: 18,
                                          color:
                                              Color.fromARGB(255, 99, 66, 54),
                                        ),
                                ),
                              ),
                            );
                          }
                        }),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 143, 142, 142)
                        .withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
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
                                DataBase().getRating(places.indexOf(sites!)),
                            initialData: 0.0,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data.toString() ?? '0.0',
                                  style: kTextStyle(14,
                                      textWeight: TextWeight.semiBold),
                                );
                              } else if (snapshot.hasError) {
                                return const Text('0.0');
                              } else {
                                return const Text('0.0');
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                  Row(
                    children: [
                      Icon(
                        Icons.local_attraction_rounded,
                        color: Colors.brown[300],
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        places[index].placeName!,
                        style: kTextStyle(14, textWeight: TextWeight.medium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.brown[300],
                        size: 16,
                      ),
                      Text(
                        places[index].address!,
                        style: kTextStyle(12, textWeight: TextWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.chat_bubble,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    places[index].userReview.toString(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
