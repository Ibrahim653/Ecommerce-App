import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key,  });

  @override
  QuantitySelectorState createState() => QuantitySelectorState();
}

class QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 38.h,
          width: 38.w,
          decoration: BoxDecoration(
              color: ColorsManager.primaryCyan,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(3.r),
              )),
          child: IconButton(
              icon: Icon(Icons.add, size: 21.sp),
              color: ColorsManager.white,
              onPressed: () {
                _incrementQuantity();
              }),
        ),
        SizedBox(
          width: 47.w,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: Styles.font16GreyMedium,
          ),
        ),
        Container(
          height: 38.h,
          width: 38.w,
          color: ColorsManager.primaryCyan,
          child: IconButton(
              icon: Icon(
                Icons.remove,
                size: 21.sp,
              ),
              color: ColorsManager.white,
              onPressed: () {
                _decrementQuantity();
              }),
        ),
        Expanded(
          child: Container(
            height: 38.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorsManager.white,
              border: Border(
                top: BorderSide(
                  color: Colors.black45,
                  width: 0.4,
                ),
              ),
            ),
            child: Center(
              child: Text(
                '398.00 ج.م',
                style: Styles.font16GreyMedium,
              ),
            ),
          ),
        ),
        Container(
               height: 38.h,
          width: 38.w,
              decoration: BoxDecoration(
            color:ColorsManager.secondaryPink ,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3.r),
              )),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.delete_forever),
                color: ColorsManager.white,
                ))
      ],
    );
  }
}
