import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class TotalSection extends StatelessWidget {
  const TotalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('(352)', style: Styles.font14CyanBold),
                  Text(' عنصر', style: Styles.font14GreyMedium),
                ],
              ),
              Row(
                children: [
                  Text('الإجمالى', style: Styles.font14CyanBold),
                  horizontalSpace(5),
                  Text('70.048 ج.م', style: Styles.font14GreyMedium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}