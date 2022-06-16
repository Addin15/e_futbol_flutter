import 'package:e_futbol_flutter/models/arena.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
        : GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 2.w),
          );
  }
}
