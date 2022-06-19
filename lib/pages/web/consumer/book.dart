import 'dart:developer';

import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/controllers/arena_controller.dart';
import 'package:e_futbol_flutter/controllers/field_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/models/booking.dart';
import 'package:e_futbol_flutter/models/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ArenaBook extends StatefulWidget {
  const ArenaBook({required this.arena, Key? key}) : super(key: key);

  final Arena arena;

  @override
  State<ArenaBook> createState() => _ArenaBookState();
}

class _ArenaBookState extends State<ArenaBook> {
  bool isGettingData = true;
  int? selectedField;
  DateTime? selectedDate;
  List<Field> fields = [];
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int length = 0;
  List<Booking>? booked;
  bool isGettingAvailability = false;
  List<int> selected = [];

  getData() async {
    List<Field> data =
        await ArenaController.getFields(arenaID: widget.arena.id.toString());

    if (mounted) {
      setState(() {
        fields = data;
        isGettingData = false;
      });
    }
  }

  updateAvailability() async {
    booked = [];
    setState(() {
      isGettingAvailability = true;
    });

    if (selectedField != null && selectedDate != null) {
      List<Booking> bookingData = await FieldController.getAvailability(
          selectedField.toString(),
          DateFormat('yyyy-MM-dd').format(selectedDate!));

      log(bookingData.first.time.toString());

      setState(() {
        booked = bookingData;
        isGettingAvailability = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    selectedDate = DateTime.now();

    // get start time and end time
    int start = widget.arena.startDayTime!;
    int end = widget.arena.endNightTime!;
    startTime = TimeOfDay(hour: start, minute: 0);
    endTime = TimeOfDay(hour: end, minute: 0);
    length = endTime!.hour - startTime!.hour;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isGettingData
        ? Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: SpinKitChasingDots(
              color: primary,
            ),
          )
        : Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 10.h,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
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
                    ),
                  ),
                ),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Select field',
                                    style: TextStyle(
                                        fontSize: 3.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 1.h),
                                  DropdownButton(
                                      hint: const Text(
                                        '-- Select Field --',
                                        textAlign: TextAlign.center,
                                      ),
                                      value: selectedField,
                                      isExpanded: true,
                                      items: [
                                        ...fields.map((field) {
                                          return DropdownMenuItem(
                                            child: Text(field.name!),
                                            value: field.id,
                                          );
                                        }).toList()
                                      ],
                                      onChanged: (int? val) {
                                        if (mounted) {
                                          setState(() {
                                            selectedField = val;
                                          });
                                          updateAvailability();
                                        }
                                      })
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Select a date',
                                    style: TextStyle(
                                        fontSize: 3.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 1.h),
                                  TextButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(
                                            DateTime.now().year + 1,
                                            DateTime.now().month,
                                            DateTime.now().day,
                                          ),
                                        );

                                        if (pickedDate != null) {
                                          setState(() {
                                            selectedDate = pickedDate;
                                          });
                                          updateAvailability();
                                        }
                                      },
                                      child: Text(DateFormat.yMMMMEEEEd()
                                          .format(selectedDate!))),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h),
                        booked == null
                            ? const SizedBox.shrink()
                            : isGettingAvailability
                                ? Container(
                                    alignment: Alignment.center,
                                    color: Colors.white,
                                    child: SpinKitChasingDots(
                                      color: primary,
                                    ),
                                  )
                                : GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            childAspectRatio: 2),
                                    itemCount: length + 1,
                                    itemBuilder: (context, index) {
                                      int start = startTime!.hour + index;
                                      String startString =
                                          TimeOfDay(hour: start, minute: 0)
                                              .format(context);
                                      int end = start + 1;
                                      String endString =
                                          TimeOfDay(hour: end, minute: 0)
                                              .format(context);
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(startString + ' - ' + endString),
                                          SizedBox(height: 1.h),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(2.sp),
                                            child: InkWell(
                                              onTap: () {
                                                addOrRemove(start);
                                              },
                                              child: Card(
                                                elevation: 3,
                                                child: Container(
                                                  height: 10.sp,
                                                  width: 25.sp,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.sp),
                                                    color: checkIfSelected(
                                                            start)
                                                        ? Colors.green
                                                        : checkIfBooked(start)
                                                            ? Colors.red
                                                            : Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  checkIfSelected(int start) {
    for (int i = 0; i < selected.length; i++) {
      if (selected[i] == start) {
        return true;
      }
    }
    return false;
  }

  checkIfBooked(int start) {
    for (int i = 0; i < booked!.length; i++) {
      if (booked![i].time == start) {
        return true;
      }
    }
    return false;
  }

  addOrRemove(int start) {
    if (!checkIfBooked(start)) {
      for (int i = 0; i < selected.length; i++) {
        if (selected[i] == start) {
          setState(() {
            selected.remove(start);
          });
          return;
        }
      }

      setState(() {
        selected.add(start);
      });
      return;
    }
  }
}
