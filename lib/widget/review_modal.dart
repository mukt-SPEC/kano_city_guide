import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/enums.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/model/review.dart';
import 'package:kano_city_guide/service/db.dart';
import 'package:kano_city_guide/widget/review_item.dart';
import 'package:kano_city_guide/widget/review_loading.dart';

class ReviewModal extends StatefulWidget {
  List<Review>? review;
  int? siteId;
  ReviewModal({this.review, this.siteId, super.key});

  @override
  State<ReviewModal> createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: widget.review!.isEmpty
                      ? Center(
                          child: Text(
                            'No available reviews',
                            style:
                                kTextStyle(14, textWeight: TextWeight.semiBold),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...widget.review!.map((review) {
                                return FutureBuilder(
                                    future: DataBase()
                                        .retrieveUser(context, review.userId!),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ReviewItem(
                                          username: snapshot.data!.name,
                                          review: review.review,
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('');
                                      } else {
                                        return ReviewLoading();
                                      }
                                    });
                              }),
                            ],
                          ),
                        ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Write a review',
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await DataBase().createReview(
                          context,
                          Review(
                              userId: FirebaseAuth.instance.currentUser!.uid,
                              siteId: widget.siteId,
                              review: _commentController.text),
                        );
                        _commentController.clear();
                      },
                      icon: const Icon(Icons.send_rounded),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
