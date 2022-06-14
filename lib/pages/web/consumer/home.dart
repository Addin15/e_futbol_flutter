import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      return Scaffold(
        appBar: navBar(context, authService),
        body: Center(child: Text('Home')),
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
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.5.h),
          child: TextButton.icon(
            icon: Icon(
              Icons.login_outlined,
              size: 3.sp,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 1.5.w,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary, width: 1),
              ),
            ),
            onPressed: () {
              setState(() {
                authService.logout();
              });
            },
            label: Text(
              'Logout',
              style: TextStyle(
                color: primary,
                fontSize: 3.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w),
      ],
    );
  }
}
