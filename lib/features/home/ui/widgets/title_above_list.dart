import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAboveList extends StatelessWidget {
  const TitleAboveList({
    super.key,
    required this.title,
    this.titletwo,
  });
  final String title;
  final String? titletwo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            titletwo ?? "عرض الكل",
            style: TextStyle(
              fontSize: 16.sp,
              //fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
