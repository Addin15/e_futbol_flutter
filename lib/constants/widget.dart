import 'package:e_futbol_flutter/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget customTextFormField({
  required TextEditingController controller,
  required FocusNode focusNode,
  required String hintText,
  bool isObscured = false,
  bool isSearch = false,
  Function(String)? onChange,
}) =>
    TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscured,
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: !isSearch
            ? const SizedBox.shrink()
            : Icon(Icons.search_outlined, size: 4.sp),
        isDense: true,
        alignLabelWithHint: true,
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
