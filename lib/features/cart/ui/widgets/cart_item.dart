import 'package:e_commerce_app/features/cart/ui/widgets/quantity_slector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/styles.dart';
import '../logic/cubit/cart_cubit.dart';

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
  final double price;
  final int id;

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
                          Text(price.toString(), style: Styles.font14CyanBold),
                          Text('ج.م', style: Styles.font12CyanMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          QuantitySelector(
            price: price,
            onRemove: () {
              context.read<CartCubit>().removeProductFromCart(id);
            },
          ),
        ],
      ),
    );
  }
}
