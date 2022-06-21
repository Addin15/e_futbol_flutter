import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/pages/web/provider/addarena.dart';
import 'package:e_futbol_flutter/pages/web/provider/book.dart';
import 'package:e_futbol_flutter/pages/web/provider/dashboard.dart';
import 'package:e_futbol_flutter/pages/web/provider/listarena.dart';
import 'package:e_futbol_flutter/pages/web/provider/setting.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:e_futbol_flutter/constants/color.dart';

class HomeProvider extends StatefulWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  State<HomeProvider> createState() => _HomeState();
}

enum MenuItem {
  logout,
}
enum HomePage {
  dashboard,
  addarena,
  listarena,
  order,
  setting,
}

class _HomeState extends State<HomeProvider> {
  HomePage selectedPage = HomePage.dashboard;
  final PageController _pageController = PageController();

  changePage(HomePage page) {
    setState(() {
      if (page == HomePage.dashboard) {
        selectedPage = page;
        _pageController.jumpToPage(0);
      } else if (page == HomePage.addarena) {
        selectedPage = page;
        _pageController.jumpToPage(1);
      } else if (page == HomePage.addarena) {
        selectedPage = page;
        _pageController.jumpToPage(2);
      } else if (page == HomePage.addarena) {
        selectedPage = page;
        _pageController.jumpToPage(3);
      } else {
        selectedPage = page;
        _pageController.jumpToPage(4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'Hakim',
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp)),
            offset: Offset(0, 8.h),
            onSelected: (value) {
              if (value == MenuItem.logout) {
                AuthService auth =
                    Provider.of<AuthService>(context, listen: false);
                auth.logout();
              }
            },
            itemBuilder: (context) => [
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
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: _pageController,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/icons/efutbol_logo.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'E-Futball SDN BHD',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  _pageController.jumpToPage(0);
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                  priority: 1,
                  title: 'Add Field',
                  onTap: () {
                    _pageController.jumpToPage(1);
                  },
                  icon: const Icon(Icons.note_add_rounded)),
              SideMenuItem(
                priority: 2,
                title: 'List Field',
                onTap: () {
                  _pageController.jumpToPage(2);
                },
                icon: const Icon(Icons.file_copy_rounded),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Order',
                onTap: () {
                  _pageController.jumpToPage(3);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Settings',
                onTap: () {
                  _pageController.jumpToPage(4);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Exit',
                onTap: () async {},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                Dashboard(),
                AddArena(),
                ListArena(),
                Book(),
                Setting(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
