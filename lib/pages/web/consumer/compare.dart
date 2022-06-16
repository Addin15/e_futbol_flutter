import 'dart:developer';

import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/constants/widget.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

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

  selectArena(int index) async {
    dynamic res = await showDialog(
        context: context, builder: (context) => const SearchDialog());

    if (res != null) {
      setState(() {
        if (index == 0) {
          firstArena = res as Arena;
        } else {
          secondArena = res as Arena;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
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
                                            onPressed: () {
                                              selectArena(0);
                                            },
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
                              firstArena!.arenaName!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // provider name
                            Text(
                              firstArena!.providerName!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number field
                            Text(
                              firstArena!.numberField.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // grass type
                            Text(
                              firstArena!.grassType!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number light
                            Text(
                              firstArena!.numberLight.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // day price
                            Text(
                              'RM${firstArena!.dayPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // night price
                            Text(
                              'RM${firstArena!.nightPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // refferee
                            Text(
                              firstArena!.refferee! == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // subs bench
                            Text(
                              firstArena!.subsBench! == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // specs seat
                            Text(
                              firstArena!.spectatorsSeat! == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // address
                            Text(
                              firstArena!.address!,
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
                    SizedBox(height: 7.h),
                    // provider name
                    firstArena == null && secondArena == null
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
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
                                            onPressed: () {
                                              selectArena(1);
                                            },
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
                              secondArena!.arenaName!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            // provider name
                            Text(
                              secondArena!.providerName!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number field
                            Text(
                              secondArena!.numberField.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // grass type
                            Text(
                              secondArena!.grassType!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // number light
                            Text(
                              secondArena!.numberLight.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // day price
                            Text(
                              'RM${secondArena!.dayPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // night price
                            Text(
                              'RM${secondArena!.nightPrice!.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // refferee
                            Text(
                              secondArena!.refferee == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // subs bench
                            Text(
                              secondArena!.subsBench == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // specs seat
                            Text(
                              secondArena!.spectatorsSeat == true
                                  ? 'Provided'
                                  : 'Not Provided',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 4.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            // address
                            Text(
                              secondArena!.address!,
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

class SearchDialog extends StatefulWidget {
  const SearchDialog({Key? key}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  // For dialog
  bool searchingState = false;
  bool searching = false;
  Arena? selectedArena;

  List<Arena> searchedArenas = [];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.sp)),
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
              onChange: (query) async {
                setState(() {
                  searching = true;
                  searchingState = true;
                });

                if (query.isNotEmpty) {
                  List<Arena> data = await ArenaController.search(query: query);

                  setState(() {
                    searching = false;
                    searchedArenas = data;
                  });
                } else {
                  setState(() {
                    searching = false;
                    searchingState = false;
                  });
                }
              }),
        ),
        SizedBox(height: 2.h),
        searchingState
            ? searching
                ? Container(
                    height: 20.h,
                    width: 50.w,
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: SpinKitChasingDots(color: primary),
                  )
                : SizedBox(
                    height: 30.h,
                    width: 50.w,
                    child: searchedArenas.isEmpty
                        ? Center(
                            child: Text(
                              'No matched arena found',
                              style: TextStyle(fontSize: 3.sp),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchedArenas.length,
                            itemBuilder: (context, index) {
                              Arena arena = searchedArenas[index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedArena = arena;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.5.h),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(arena.arenaName!)),
                                      selectedArena == arena
                                          ? Icon(
                                              Icons.check,
                                              size: 3.sp,
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  )
            : Container(
                height: 30.h,
                width: 50.w,
                alignment: Alignment.center,
                child: Text(
                  'Search arena to select',
                  style: TextStyle(fontSize: 3.sp),
                ),
              ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
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
                padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 2.h),
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.sp),
                  side: BorderSide(color: primary),
                ),
              ),
              onPressed: () => Navigator.pop(
                context,
                selectedArena,
              ),
              child: Text(
                'Select',
                style: TextStyle(fontSize: 3.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
