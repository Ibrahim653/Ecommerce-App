import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class ProductPriceAndRating extends StatelessWidget {
  final String? price;
  final String? rate;

  const ProductPriceAndRating({required this.price, required this.rate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text('$price ', style: Styles.font18CyanMedium),
            Text('ج.م', style: Styles.font14CyanBold),
          ],
        ),
        const Spacer(),
        Text(
          '$rate',
          style: Styles.font14GreyMedium,
        ),
        horizontalSpace(3.w),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
