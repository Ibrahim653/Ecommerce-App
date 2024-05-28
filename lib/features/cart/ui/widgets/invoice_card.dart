import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class InvoiceCard extends StatelessWidget {
  const InvoiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.only(right: 11.w, left: 11.w, top: 9.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الإجمالى', style: Styles.font14CyanBold),
                  horizontalSpace(5),
                  Text('70.048 ج.م', style: Styles.font14GreyMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الضرائب', style: Styles.font14CyanBold),
                  Text('5.00 ج.م', style: Styles.font14GreyMedium),
                ],
              ),
              const Spacer(),
              const Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المبلغ المطلوب', style: Styles.font14CyanBold),
                  Text('75.048 ج.م', style: Styles.font14GreyMedium),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
