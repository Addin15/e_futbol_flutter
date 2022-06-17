import 'dart:developer';

import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/constants/widget.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/pages/web/consumer/compare.dart';
import 'package:e_futbol_flutter/pages/web/consumer/nearby.dart';
import 'package:e_futbol_flutter/pages/web/consumer/search.dart';
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
        body: const HomeContent(),
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

enum HomePage {
  nearby,
  search,
  compare,
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  HomePage selectedPage = HomePage.nearby;

  final PageController _pageController = PageController();

  Arena? prepickArena;

  changePage(HomePage page, Map<String, dynamic> data) {
    setState(() {
      if (page == HomePage.nearby) {
        selectedPage = page;
        _pageController.jumpToPage(0);
      } else if (page == HomePage.search) {
        selectedPage = page;
        _pageController.jumpToPage(1);
      } else {
        if (data['arena'] != null) {
          prepickArena = data['arena'] as Arena;
        }
        selectedPage = page;
        _pageController.jumpToPage(2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: tabBar(),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 75.h,
            child: MultiProvider(
              providers: [
                Provider<Arena?>.value(value: prepickArena),
              ],
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  NearbyArena(),
                  SearchArena(jumpToCompare: changePage),
                  CompareArena(),
                ],
              ),
            ),
          ),
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
              backgroundColor:
                  selectedPage == HomePage.nearby ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = HomePage.nearby;
                _pageController.jumpToPage(0);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 5.sp,
                  color:
                      selectedPage == HomePage.nearby ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Nearby Arenas',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == HomePage.nearby
                        ? Colors.white
                        : primary,
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
              backgroundColor:
                  selectedPage == HomePage.search ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = HomePage.search;
                _pageController.jumpToPage(1);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_outlined,
                  size: 5.sp,
                  color:
                      selectedPage == HomePage.search ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Search Arena',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == HomePage.search
                        ? Colors.white
                        : primary,
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
              backgroundColor:
                  selectedPage == HomePage.compare ? primary : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary),
              ),
            ),
            onPressed: () {
              setState(() {
                selectedPage = HomePage.compare;
                _pageController.jumpToPage(2);
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.compare_outlined,
                  size: 5.sp,
                  color:
                      selectedPage == HomePage.compare ? Colors.white : primary,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Compare Arena',
                  style: TextStyle(
                    fontSize: 3.sp,
                    color: selectedPage == HomePage.compare
                        ? Colors.white
                        : primary,
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
