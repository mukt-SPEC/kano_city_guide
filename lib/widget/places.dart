import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
//import 'package:kano_city_guide/model/tourist_site.dart';
import 'package:kano_city_guide/screen/details_page.dart';
import 'package:flutter/material.dart';

import '../core/site_list.dart';

class Places extends StatelessWidget {
  // final Touristsite sites;
  final int index;

  const Places(this.index, {super.key});

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
                        Text(
                          places[index].rating.toString(),
                          style:
                              kTextStyle(14, textWeight: TextWeight.semiBold),
                        ),
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
                  Text(
                    places[index].placeName!,
                    style: kTextStyle(14, textWeight: TextWeight.medium),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    places[index].address!,
                    style: kTextStyle(12, textWeight: TextWeight.normal),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person),
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
