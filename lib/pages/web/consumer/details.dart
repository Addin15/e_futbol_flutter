import 'package:e_futbol_flutter/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArenaDetails extends StatefulWidget {
  const ArenaDetails({Key? key}) : super(key: key);

  @override
  State<ArenaDetails> createState() => _ArenaDetailsState();
}

class _ArenaDetailsState extends State<ArenaDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
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
                )),
          ),
        ],
      ),
    );
  }
}
