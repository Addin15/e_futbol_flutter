import 'dart:developer';

import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/constants/widget.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

enum MenuItem {
  history,
  logout,
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      return Scaffold(
        appBar: navBar(context, authService),
        body: HomeContent(),
      );
    });
  }

  AppBar navBar(BuildContext context, AuthService authService) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Image.asset(
          'assets/icons/efutbol_logo.png',
          height: 14.sp,
          width: 14.sp,
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome, ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 3.sp,
              ),
            ),
            Text(
              '${authService.user.username}!',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 3.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: 2.w),
        PopupMenuButton(
          icon: Icon(
            Icons.person,
            color: primary,
          ),
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
          offset: Offset(0, 8.h),
          onSelected: (value) {
            if (value == MenuItem.history) {
            } else if (value == MenuItem.logout) {
              authService.logout();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: MenuItem.history,
              child: Row(
                children: [
                  Icon(
                    Icons.history_outlined,
                    size: 3.sp,
                    color: primary,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    'Booking History',
                    style: TextStyle(color: primary, fontSize: 3.sp),
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: MenuItem.logout,
              child: Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 3.sp,
                    color: primary,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    'Logout',
                    style: TextStyle(color: primary, fontSize: 3.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 3.h,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          tabBar(),
          SizedBox(height: 2.h),
          [
            // Nearby page
            NearbyArena(),
            // Search page
            SearchArena(),
            // Compare page
            CompareArena(),
          ][selectedPage],
        ],
      ),
    );
  }

  Row tabBar() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              backgroundColor: selectedPage == 0 ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = 0;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 5.sp,
                  color: selectedPage == 0 ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Nearby Arenas',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == 0 ? Colors.white : primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              backgroundColor: selectedPage == 1 ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = 1;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_outlined,
                  size: 5.sp,
                  color: selectedPage == 1 ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Search Arena',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == 1 ? Colors.white : primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              backgroundColor: selectedPage == 2 ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = 2;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.compare_outlined,
                  size: 5.sp,
                  color: selectedPage == 2 ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Compare Arena',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == 2 ? Colors.white : primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NearbyArena extends StatefulWidget {
  const NearbyArena({Key? key}) : super(key: key);

  @override
  State<NearbyArena> createState() => _NearbyArenaState();
}

class _NearbyArenaState extends State<NearbyArena> {
  List<Arena> arenas = [];

  @override
  Widget build(BuildContext context) {
    return arenas.isEmpty
        ? Container(
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
                  'No nearby arena found',
                  style: TextStyle(
                    fontSize: 4.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}

class SearchArena extends StatefulWidget {
  const SearchArena({Key? key}) : super(key: key);

  @override
  State<SearchArena> createState() => _SearchArenaState();
}

class _SearchArenaState extends State<SearchArena> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  List<Arena> searchedArenas = [];
  bool searchingState = false;
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  isSearch: true,
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
                          await ArenaController.search(query: input);

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
            ? Container(
                height: 75.h,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'icons/find.png',
                      width: 30.sp,
                      height: 30.sp,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      'Find and book your preferred arena now!',
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.w,
                        ),
                        itemCount: searchedArenas.length,
                        itemBuilder: (context, index) {
                          Arena arena = searchedArenas[index];
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.sp),
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(4.sp),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w, vertical: 2.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                            side: BorderSide(color: primary),
                                          ),
                                        ),
                                        onPressed: () {},
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
                                              horizontal: 2.w, vertical: 2.h),
                                          backgroundColor: primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                            side: BorderSide(color: primary),
                                          ),
                                        ),
                                        onPressed: () {},
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
    );
  }
}

class CompareArena extends StatefulWidget {
  const CompareArena({Key? key}) : super(key: key);

  @override
  State<CompareArena> createState() => _CompareArenaState();
}

class _CompareArenaState extends State<CompareArena> {
  Arena? firstArena;
  Arena? secondArena;

  bool isHoverFirst = false;
  bool isHoverSecond = false;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  selectArena(int index) {
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp)),
              title: Text(
                'Select Arena',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 3.sp,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 3.w,
                vertical: 2.h,
              ),
              children: [
                SizedBox(
                  width: 40.w,
                  child: customTextFormField(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    hintText: 'Search Arena',
                    isSearch: true,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.5.w, vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                          side: BorderSide(color: primary),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontSize: 3.sp),
                      ),
                    ),
                    SizedBox(width: 1.w),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.5.w, vertical: 2.h),
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.sp),
                          side: BorderSide(color: primary),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Select',
                        style: TextStyle(fontSize: 3.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ));
    if (index == 0) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: firstArena == null
                  ? Container(
                      height: 50.h,
                      padding: EdgeInsets.only(top: 18.h),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.sp),
                        child: IconButton(
                          onPressed: () {
                            selectArena(0);
                          },
                          iconSize: 15.sp,
                          icon: Image.asset(
                            'icons/add.png',
                            height: 100.h,
                            width: 100.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  : Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 10.h),
                        child: Column(
                          children: [
                            MouseRegion(
                              onEnter: (_) => setState(() {
                                isHoverFirst = true;
                              }),
                              onExit: (_) => setState(() {
                                isHoverFirst = false;
                              }),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    child: Image.asset(
                                      'dummy/dummy.jpg',
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  !isHoverFirst
                                      ? const SizedBox.shrink()
                                      : Container(
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black87.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                          ),
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                  vertical: 2.h),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1.sp),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Change Arena',
                                              style: TextStyle(
                                                fontSize: 3.sp,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Testtetstststststtstststststtststststststtss',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // provider name
                            Text(
                              'Test',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number field
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // grass type
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number light
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // day price
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // night price
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // refferee
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // subs bench
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // specs seat
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // address
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.sp),
                        child: Image.asset(
                          'icons/compare_icon.png',
                          height: 10.h,
                          width: 10.h,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      's',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // provider name
                    Text(
                      'Provider',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // number field
                    Text(
                      'Number of field',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // grass type
                    Text(
                      'Grass Type',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // number light
                    Text(
                      'Number of light',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // day price
                    Text(
                      'Day price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // night price
                    Text(
                      'Night price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // refferee
                    Text(
                      'Refferee Service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // subs bench
                    Text(
                      'Substitutions bench',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // specs seat
                    Text(
                      'Spectators seat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    // address
                    Text(
                      'Address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 4.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: secondArena == null
                  ? Container(
                      height: 50.h,
                      padding: EdgeInsets.only(top: 18.h),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.sp),
                        child: IconButton(
                          onPressed: () {
                            selectArena(1);
                          },
                          iconSize: 15.sp,
                          icon: Image.asset(
                            'icons/add.png',
                            height: 100.h,
                            width: 100.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                  : Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 10.h),
                        child: Column(
                          children: [
                            MouseRegion(
                              onEnter: (_) => setState(() {
                                isHoverSecond = true;
                              }),
                              onExit: (_) => setState(() {
                                isHoverSecond = false;
                              }),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(2.sp),
                                    child: Image.asset(
                                      'dummy/dummy.jpg',
                                      height: 50.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  !isHoverSecond
                                      ? const SizedBox.shrink()
                                      : Container(
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black87.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                          ),
                                          alignment: Alignment.center,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                  vertical: 2.h),
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(1.sp),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Change Arena',
                                              style: TextStyle(
                                                fontSize: 3.sp,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Testtetstststststtstststststtststststststtss',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // provider name
                            Text(
                              'Test',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number field
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // grass type
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number light
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // day price
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // night price
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // refferee
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // subs bench
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // specs seat
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // address
                            Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        )
      ],
    );
  }
}
