import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/service/db.dart';
import 'package:kano_city_guide/widget/places.dart';

import '../core/site_list.dart';
import '../widget/bottom_modal.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favorite Places',
          style: kTextStyle(18, textWeight: TextWeight.medium),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FirebaseAuth.instance.currentUser == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city_rounded,
                      size: 48,
                      color: Colors.brown[200],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Sign in to view your favourite places',
                      style: kTextStyle(16,
                          color: const Color(0xff121212),
                          textWeight: TextWeight.medium),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 256,
                      child: ElevatedButton(
                        onPressed: () {
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: kTextStyle(14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : StreamBuilder(
                stream: DataBase()
                    .retrieveUserStream(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.favouritePlaces!.isEmpty) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            size: 48,
                            color: Colors.brown[200],
                          ),
                          Text(
                            'No Favourite Places',
                            style: kTextStyle(16,
                                color: const Color(0xff121212),
                                textWeight: TextWeight.medium),
                          ),
                        ],
                      ));
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ...snapshot.data!.favouritePlaces!.map((index) {
                            return Places(
                              index,
                              sites: places[index],
                            );
                          }),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('An Error Occured'));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
      ),
    );
  }
}
