import 'dart:developer';

import 'package:e_futbol_flutter/auth.dart';
import 'package:e_futbol_flutter/constants/color.dart';
import 'package:e_futbol_flutter/controllers/field_controller.dart';
import 'package:e_futbol_flutter/models/arena.dart';
import 'package:e_futbol_flutter/pages/web/consumer/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ArenaPayment extends StatefulWidget {
  const ArenaPayment({
    required this.arena,
    required this.selected,
    Key? key,
  }) : super(key: key);

  final Arena arena;
  final List<Prebook> selected;

  @override
  State<ArenaPayment> createState() => _ArenaPaymentState();
}

enum PaymentMethod {
  fpx,
  ewallet,
}

class _ArenaPaymentState extends State<ArenaPayment> {
  int currentStep = 0;

  PaymentMethod method = PaymentMethod.fpx;
  bool? isAccepted;

  checkIfZero() {
    if (widget.selected.isEmpty) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    checkIfZero();
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            height: 100.h,
            child: Stepper(
              currentStep: currentStep,
              physics: const NeverScrollableScrollPhysics(),
              type: StepperType.horizontal,
              onStepContinue: () async {
                if (currentStep == 2) {
                  Navigator.pop(context);
                  log('Continue to home');
                } else if (currentStep == 1) {
                  bool? res = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.sp)),
                            title: Text('Dummy payment process'),
                            content:
                                Text('Select if payment is successful or not'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.h),
                                ),
                                child: Text(
                                  'Failed',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 2.sp,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.sp)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 1.h),
                                ),
                                child: Text(
                                  'Success',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 2.sp,
                                  ),
                                ),
                              ),
                            ],
                          ));

                  if (res != null) {
                    if (res == true) {
                      AuthService auth =
                          Provider.of<AuthService>(context, listen: false);
                      await FieldController.bookFields(
                          auth.user!.userID!, 400, widget.selected);
                    }
                    setState(() {
                      currentStep++;
                      isAccepted = res;
                    });
                  }
                } else {
                  setState(() {
                    currentStep++;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep == 0) {
                  Navigator.pop(context);
                } else {
                  setState(() {
                    currentStep--;
                  });
                }
              },
              steps: [
                Step(
                  title: Text(
                    'Booking Details',
                    style: TextStyle(
                      color: currentStep >= 0 ? primary : Colors.black,
                      fontSize: 3.sp,
                    ),
                  ),
                  content: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.sp),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 2.h),
                          Image.asset(
                            'dummy/dummy.jpg',
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            widget.arena.arenaName!,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 4.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          ...widget.selected.map((field) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 1.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    child: Text(
                                      field.fieldName,
                                      style: TextStyle(
                                          fontSize: 3.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(TimeOfDay(hour: field.time, minute: 0)
                                          .format(context) +
                                      ' - ' +
                                      TimeOfDay(hour: field.time + 1, minute: 0)
                                          .format(context)),
                                  SizedBox(width: 2.w),
                                  Text(
                                    'RM' + field.price.toStringAsFixed(2),
                                  ),
                                  SizedBox(width: 2.w),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.selected.removeWhere(
                                            (e) => e.fieldID == field.fieldID);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      size: 4.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Total: RM' +
                                    calculateTotal().toStringAsFixed(2),
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 4.5.sp,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 3.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Step(
                  title: Text(
                    'Payment',
                    style: TextStyle(
                      color: currentStep >= 1 ? primary : Colors.black,
                      fontSize: 3.sp,
                    ),
                  ),
                  content: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.sp)),
                    child: Container(
                      height: 50.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.sp),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Payment Method',
                            style: TextStyle(fontSize: 3.sp),
                          ),
                          SizedBox(height: 1.h),
                          Container(
                            width: double.infinity,
                            child: DropdownButton(
                              isExpanded: true,
                              value: method,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    'FPX',
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                  value: PaymentMethod.fpx,
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    'E-wallet',
                                    style: TextStyle(fontSize: 3.sp),
                                  ),
                                  value: PaymentMethod.ewallet,
                                ),
                              ],
                              onChanged: (PaymentMethod? val) {
                                setState(() {
                                  method = val!;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                ),
                Step(
                  title: Text(
                    'Done',
                    style: TextStyle(
                      color: currentStep >= 2 ? primary : Colors.black,
                      fontSize: 3.sp,
                    ),
                  ),
                  content: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.sp),
                    ),
                    child: Container(
                      height: 50.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.sp),
                        color: Colors.white,
                      ),
                      child: isAccepted == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment Successful',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.h),
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.sp))),
                                  child: Text(
                                    'Back to Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Payment Failed',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2.w, vertical: 2.h),
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.sp))),
                                  child: Text(
                                    'Back to Home',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 3.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateTotal() {
    double total = 0;
    for (int i = 0; i < widget.selected.length; i++) {
      total += widget.selected[i].price;
    }

    return total;
  }
}
