import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/pages/web/auth/sign_in.dart';
import 'package:e_futbol_flutter/pages/web/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  selectedPage() {
    if (_selectedPage == 0) {
      return LandingContent(changePage: changePage);
    } else if (_selectedPage == 1) {
      return SignUp(changePage: changePage);
    } else {
      return SignIn(changePage: changePage);
    }
  }

  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context),
      body: selectedPage(),
    );
  }

  AppBar navBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          setState(() {
            _selectedPage = 0;
          });
        },
        icon: Image.asset(
          'assets/icons/efutbol_logo.png',
          height: 14.sp,
          width: 14.sp,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            'E-Futbol for Business',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 3.sp,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1.5.h),
          child: TextButton(
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
                _selectedPage = 1;
              });
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: primary,
                fontSize: 3.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 1.w),
        Container(
          margin: EdgeInsets.only(
            top: 1.5.h,
            bottom: 1.5.h,
            right: 1.w,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: 1.5.w,
              ),
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.sp),
                side: BorderSide(color: primary, width: 1.5),
              ),
            ),
            onPressed: () {
              setState(() {
                _selectedPage = 2;
              });
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 3.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LandingContent extends StatelessWidget {
  const LandingContent({this.changePage, Key? key}) : super(key: key);

  final Function(int)? changePage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        getStarted(context),
        showcase(),
        footer(),
      ],
    );
  }

  Container footer() {
    return Container(
      height: 40.h,
    );
  }

  Container showcase() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 3.h,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Live Availability',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Show live availability of the arena. Easy for booking',
                      style: TextStyle(
                        fontSize: 4.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/availability.png',
                    width: 18.w,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Image.asset(
                    'assets/icons/compare.png',
                    width: 18.w,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Compare',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Compare between the arenas. Easy to make decision',
                      style: TextStyle(
                        fontSize: 4.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Online Payment',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Pay for the booking process cashlessly. Easy process',
                      style: TextStyle(
                        fontSize: 4.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/payment.png',
                    width: 18.w,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container getStarted(BuildContext context) {
    return Container(
      height: 95.h,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.dstATop,
          ),
          image: const AssetImage('assets/images/stadium.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to E-Futbol',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 3.h,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp),
                ),
              ),
              onPressed: () {
                changePage!(2);
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 3.sp,
                  color: primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
