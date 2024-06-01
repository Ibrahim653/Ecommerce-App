import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 8.h),
      child: Container(
        height: 38.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 207, 203, 203),
          borderRadius: BorderRadius.circular(27),
        ),
        child: TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'عم تبحث ؟',
            hintStyle: Styles.font12GreyMedium,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 14.w),
              child: Icon(
                Icons.search,
                size: 23.sp,
                color: Colors.black54,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 38.h,
              minWidth: 38.h,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            fillColor: Colors.transparent,
            filled: true,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(27),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
