import 'package:e_commerce_app/core/theming/styles.dart';
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
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Styles.font14GreyBold,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              titletwo ?? "عرض الكل",
              style: Styles.font12GreyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
