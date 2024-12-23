import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/model/tourist_site.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/widget/bottom_modal.dart';

class DetailsPage extends StatefulWidget {
  final Touristsite site;
  const DetailsPage({required this.site, super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
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
                        onTap: () => showModalBottomSheet(
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
                            Text(
                              site.rating.toString(),
                              style: kTextStyle(14,
                                  textWeight: TextWeight.semiBold),
                            ),
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
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Rate this place',
                          style:
                              kTextStyle(18, textWeight: TextWeight.semiBold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Tell others about this place',
                          style:
                              kTextStyle(18, textWeight: TextWeight.semiBold),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                             IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                             IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                             IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
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
