import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class QuantitySelector extends StatefulWidget {
  final double price;
  const QuantitySelector({super.key, required this.price});

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
    double totalPrice = widget.price * quantity;
    return Row(
      children: [
        Container(
          height: 44.h,
          width: 45.w,
          decoration: BoxDecoration(
              color: ColorsManager.primaryCyan,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(4.r),
                topRight: Radius.circular(4.r),
              )),
          child: IconButton(
              icon: Icon(Icons.add, size: 21.sp),
              color: ColorsManager.white,
              onPressed: () {
                _incrementQuantity();
              }),
        ),
        SizedBox(
          width: 60.w,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: Styles.font16GreyMedium,
          ),
        ),
        Container(
          height: 44.h,
          width: 45.w,
          decoration: BoxDecoration(
              color: ColorsManager.primaryCyan,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.r),
                bottomLeft: Radius.circular(4.r),
              )),
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
        const Spacer(),
        Container(
          height: 44.h,
          width: 159.w,
          decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.circular(4.r),
          ),
          child: Center(
            child: Text(
              '${totalPrice.toStringAsFixed(2)} ج.م',
              style: Styles.font16GreyMedium,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
