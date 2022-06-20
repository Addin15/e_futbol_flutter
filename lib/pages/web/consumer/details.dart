import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/pages/web/consumer/book.dart';
import 'package:e_futbol_flutter/pages/web/consumer/home.dart';
import 'package:e_futbol_flutter/pages/web/consumer/location.dart';
import 'package:e_futbol_flutter/pages/web/consumer/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArenaDetails extends StatefulWidget {
  const ArenaDetails({this.jumpToCompare, this.arena, Key? key})
      : super(key: key);

  final Arena? arena;
  final Function(HomePage, Map<String, dynamic>)? jumpToCompare;

  @override
  State<ArenaDetails> createState() => _ArenaDetailsState();
}

class _ArenaDetailsState extends State<ArenaDetails> {
  Arena? arena;

  @override
  void initState() {
    arena = widget.arena;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        physics: const ScrollPhysics(),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 10.h,
            child: TextButton.icon(
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
          ),
          SizedBox(height: 2.h),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.sp),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                children: [
                  SizedBox(
                    width: 50.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.sp),
                      child: CarouselSlider(
                        items: [
                          Image.asset(
                            'dummy/dummy.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'dummy/dummy.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'dummy/dummy.jpg',
                            fit: BoxFit.cover,
                          ),
                        ],
                        options: CarouselOptions(
                          height: 70.h,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    arena!.arenaName!,
                    style: TextStyle(
                      fontSize: 4.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Provider Name',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.providerName!,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Grass Type',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.grassType!,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Number of field',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.numberField.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Number of light',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.numberLight.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Day Price',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'RM${arena!.dayPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Night Price',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              'RM${arena!.nightPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Refferee',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.refferee == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Substitutions Bench',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.subsBench == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Spectators Seat',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.spectatorsSeat == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 4.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            Expanded(
                                child: Text(
                              arena!.address!,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp),
                            ),
                            backgroundColor: primary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.5.w, vertical: 2.h)),
                        child: Text(
                          'View Availability',
                          style: TextStyle(
                            fontSize: 3.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ArenaBook(
                                      arena: arena!,
                                    ))),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.sp),
                            ),
                            backgroundColor: primary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.5.w, vertical: 2.h)),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 3.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 45.w,
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, crossAxisSpacing: 3.w),
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ArenaReview())),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.5.w),
                                      child: Image.asset(
                                        'icons/review.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Review',
                                    style: TextStyle(
                                        fontSize: 3.sp, color: primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => ArenaLocation(
                                        latitude1: arena!.latitude!,
                                        longitude1: arena!.longitude!,
                                      ))),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.5.w),
                                      child: Image.asset(
                                        'icons/location.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Location',
                                    style: TextStyle(
                                        fontSize: 3.sp, color: primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            widget.jumpToCompare!(HomePage.compare, {
                              'arena': arena,
                            });
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.5.w),
                                      child: Image.asset(
                                        'icons/scale.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Compare',
                                    style: TextStyle(
                                        fontSize: 3.sp, color: primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
