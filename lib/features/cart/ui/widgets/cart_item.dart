import 'package:e_commerce_app/features/cart/ui/widgets/quantity_slector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CartItem({
    required this.name,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                          Text('122.00 ', style: Styles.font14CyanBold),
                          Text('ج.م', style: Styles.font12CyanMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const QuantitySelector()
        ],
      ),
    );
  }
}