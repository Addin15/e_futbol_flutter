import 'dart:developer';

import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/models/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class ArenaReview extends StatefulWidget {
  const ArenaReview({required this.arena, Key? key}) : super(key: key);

  final Arena arena;

  @override
  State<ArenaReview> createState() => _ArenaReviewState();
}

class _ArenaReviewState extends State<ArenaReview> {
  bool isGettingData = true;
  List<Review> reviews = [];

  getData() async {
    List<Review> data =
        await ArenaController.getReviews(arenaID: widget.arena.id.toString());
    if (mounted) {
      setState(() {
        reviews = data;
        isGettingData = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(reviews.length.toString());
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 3.sp,
            ),
            label: Text(
              'Back',
              style: TextStyle(fontSize: 3.sp, color: Colors.white),
            ),
          ),
          SizedBox(height: 3.h),
          isGettingData
              ? SpinKitChasingDots(
                  color: primary,
                )
              : Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Review',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        reviews.isEmpty
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'No reviews yet',
                                  style: TextStyle(fontSize: 3.sp),
                                ),
                              )
                            : Container(
                                height: 50.h,
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: reviews.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) {
                                    Review review = reviews[index];
                                    return Container(
                                      height: 10.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.sp),
                                        color: Colors.grey.shade400,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              for (int i = 0;
                                                  i < review.star!;
                                                  i++)
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 3.sp,
                                                )
                                            ],
                                          ),
                                          SizedBox(height: 1.h),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              review.comment!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 3.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
