import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

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
          width: 45.w,
          height: 44.h,
          decoration: const BoxDecoration(color: ColorsManager.primaryCyan),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementQuantity,
          ),
        ),
        Text(
          quantity.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _incrementQuantity,
        ),
      ],
    );
  }
}
