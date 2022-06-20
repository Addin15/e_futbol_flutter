import 'package:e_futbol_flutter/pages/web/consumer/home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardProvider extends StatefulWidget {
  const DashboardProvider({Key? key}) : super(key: key);

  @override
  State<DashboardProvider> createState() => _DashboardProviderState();
}

class _DashboardProviderState extends State<DashboardProvider> {
  get primary => null;

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
                'MAZLAN',
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
              if (value == MenuItem.history) {
              } else if (value == MenuItem.logout) {
                //authService.logout();
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
            controller: page,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardProvider()),
                  );
                },
                icon: const Icon(Icons.home),
              ),
              SideMenuItem(
                  priority: 1,
                  title: 'Add Arena',
                  onTap: () {
                    page.jumpToPage(1);
                  },
                  icon: const Icon(Icons.note_add_rounded)),
              SideMenuItem(
                priority: 2,
                title: 'List Arena',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.file_copy_rounded),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Order',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(4);
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
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
