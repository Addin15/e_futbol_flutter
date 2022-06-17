import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/constants/widget.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/pages/web/consumer/book.dart';
import 'package:e_futbol_flutter/pages/web/consumer/details.dart';
import 'package:e_futbol_flutter/pages/web/consumer/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class SearchArena extends StatefulWidget {
  const SearchArena({this.jumpToCompare, Key? key}) : super(key: key);

  final Function(HomePage, Map<String, dynamic>)? jumpToCompare;

  @override
  State<SearchArena> createState() => _SearchArenaState();
}

class _SearchArenaState extends State<SearchArena> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  List<Arena> searchedArenas = [];
  bool searchingState = false;
  bool isSearching = false;
  bool isGettingData = true;

  List<Arena> arenas = [];

  getData() async {
    List<Arena> data = await ArenaController.get50s();

    if (mounted) {
      setState(() {
        arenas = data;
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
    return Navigator(onGenerateRoute: (settings) {
      return MaterialPageRoute(builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: isGettingData
              ? Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: SpinKitChasingDots(color: primary),
                )
              : ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: customTextFormField(
                              controller: _searchController,
                              focusNode: _searchFocus,
                              hintText: 'Search Arena...',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                size: 3.sp,
                              ),
                              onChange: (input) async {
                                if (input.isEmpty) {
                                  setState(() {
                                    searchingState = false;
                                  });
                                } else {
                                  setState(() {
                                    searchingState = true;
                                    isSearching = true;
                                  });

                                  List<Arena> arenas =
                                      await ArenaController.search(
                                          query: input);

                                  setState(() {
                                    searchedArenas = arenas;
                                    isSearching = false;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 3.w),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.sort_rounded,
                              size: 6.sp,
                              color: primary,
                            ),
                          )
                        ],
                      ),
                    ),
                    !searchingState
                        ? arenas.isNotEmpty
                            ? GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 2.w,
                                ),
                                itemCount: arenas.length,
                                itemBuilder: (context, index) {
                                  Arena arena = arenas[index];
                                  return Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.sp),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 2.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.sp),
                                            child: Image.asset(
                                              'dummy/dummy.jpg',
                                              fit: BoxFit.cover,
                                              height: 40.h,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            arena.arenaName!,
                                            style: TextStyle(
                                              fontSize: 4.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w,
                                                      vertical: 2.h),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp),
                                                    side: BorderSide(
                                                        color: primary),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              ArenaDetails(
                                                                arena: arena,
                                                                jumpToCompare:
                                                                    widget
                                                                        .jumpToCompare,
                                                              )));
                                                },
                                                child: Text(
                                                  'Details',
                                                  style: TextStyle(
                                                    fontSize: 3.sp,
                                                    color: primary,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 1.w),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.w,
                                                      vertical: 2.h),
                                                  backgroundColor: primary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp),
                                                    side: BorderSide(
                                                        color: primary),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              ArenaBook()));
                                                },
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                height: 75.h,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'icons/notfound.png',
                                      width: 30.sp,
                                      height: 30.sp,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      'No arenas available right now',
                                      style: TextStyle(
                                        fontSize: 4.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                        : isSearching
                            ? Container(
                                height: 75.h,
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: SpinKitChasingDots(
                                  color: primary,
                                ),
                              )
                            : searchedArenas.isEmpty
                                ? Container(
                                    height: 75.h,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'icons/notfound.png',
                                          width: 30.sp,
                                          height: 30.sp,
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          'No matched arena found',
                                          style: TextStyle(
                                            fontSize: 4.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 2.w,
                                    ),
                                    itemCount: searchedArenas.length,
                                    itemBuilder: (context, index) {
                                      Arena arena = searchedArenas[index];
                                      return Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.sp),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical: 2.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4.sp),
                                                child: Image.asset(
                                                  'dummy/dummy.jpg',
                                                  fit: BoxFit.cover,
                                                  height: 40.h,
                                                ),
                                              ),
                                              SizedBox(height: 2.h),
                                              Text(
                                                arena.arenaName!,
                                                style: TextStyle(
                                                  fontSize: 4.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 2.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w,
                                                              vertical: 2.h),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.sp),
                                                        side: BorderSide(
                                                            color: primary),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          CupertinoPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      ArenaDetails(
                                                                        arena:
                                                                            arena,
                                                                        jumpToCompare:
                                                                            widget.jumpToCompare,
                                                                      )));
                                                    },
                                                    child: Text(
                                                      'Details',
                                                      style: TextStyle(
                                                        fontSize: 3.sp,
                                                        color: primary,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 1.w),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 2.w,
                                                              vertical: 2.h),
                                                      backgroundColor: primary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.sp),
                                                        side: BorderSide(
                                                            color: primary),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      widget.jumpToCompare!(
                                                          HomePage.compare, {
                                                        'arena': arena,
                                                      });
                                                      // Navigator.push(
                                                      //     context,
                                                      //     CupertinoPageRoute(
                                                      //         builder: (context) =>
                                                      //             ArenaBook()));
                                                    },
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
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                  ],
                ),
        );
      });
    });
  }
}
