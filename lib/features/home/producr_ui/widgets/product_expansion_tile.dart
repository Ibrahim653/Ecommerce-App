import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ProductDetailsExpansionTile extends StatelessWidget {
  final String? description;

  const ProductDetailsExpansionTile({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      iconColor: ColorsManager.lightGrey,
      childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: Text(
        "الوصف",
        style: Styles.font16GreyMedium,
      ),
      children: [
        Text(
          description ?? 'description',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }
}
