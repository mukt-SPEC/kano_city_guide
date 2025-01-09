import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/service/db.dart';
import 'package:kano_city_guide/widget/places.dart';

import '../core/site_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Places',
          style: kTextStyle(14, textWeight: TextWeight.medium),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: StreamBuilder(
          stream: DataBase()
              .retrieveUserStream(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data!.favouritePlaces!.isEmpty){
                return const Center(child: Text('No Favourite Places'));
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
