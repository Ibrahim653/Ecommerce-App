import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class InvoiceCard extends StatelessWidget {
  final double totalPrice;
  static const double tax = 5.0;

  const InvoiceCard({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final double totalAmount = totalPrice + tax;

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
                  Text('${totalPrice.roundToDouble()} ج.م', style: Styles.font14GreyMedium),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الضرائب', style: Styles.font14CyanBold),
                  Text('$tax ج.م', style: Styles.font14GreyMedium),
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
                  Text('${totalAmount.roundToDouble()} ج.م', style: Styles.font14GreyMedium),
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