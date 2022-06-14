import 'package:e_futbol_flutter/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required FocusNode focusNode,
  required String hintText,
  bool isObscured = false,
}) =>
    TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.sp),
          borderSide: BorderSide(
            color: primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.sp),
          borderSide: BorderSide(
            color: primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.sp),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
