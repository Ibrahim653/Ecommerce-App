// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/features/cart/ui/widgets/quantity_slector.dart';

import '../../../../core/theming/styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.id,
  });
  final String name;
  final String imageUrl;
  final String price;
  final int id;
  // int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // double itemPrice = double.parse(price);
    // double totalPrice = itemPrice * quantity;

    return Card(
      elevation: 0,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                imageUrl,
                height: 111.h,
                width: 123.w,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SizedBox(
                        height: 67.h,
                        child: Text(
                          name,
                          style: Styles.font12GreyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Row(
                        children: [
                          Text('211 ', style: Styles.font14CyanBold),
                          Text('ج.م', style: Styles.font12CyanMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const QuantitySelector(),
        ],
      ),
    );
  }
}
