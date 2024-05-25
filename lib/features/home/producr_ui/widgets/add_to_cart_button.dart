import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => ColorsManager.primaryCyan),
        foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(0, 44.h)),
      ),
      onPressed: () {
        // Add to cart logic
      },
      icon:  Icon(Icons.add_shopping_cart, color: Colors.white,size: 21.sp,),
      label: Text('اضف للسلة', style: Styles.font16WhiteBold),
    );
  }
}
