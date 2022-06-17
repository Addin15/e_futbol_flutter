import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ArenaBook extends StatefulWidget {
  const ArenaBook({Key? key}) : super(key: key);

  @override
  State<ArenaBook> createState() => _ArenaBookState();
}

class _ArenaBookState extends State<ArenaBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        children: [],
      ),
    );
  }
}
