import 'package:e_commerce_app/features/cart/ui/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.productImage,
  });
  final int id;
  final String name;
  final String price;
  final String productImage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isInCart = state.isInCart(id);

        return ElevatedButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => ColorsManager.primaryCyan),
            foregroundColor:
                MaterialStateColor.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(0, 44.h)),
          ),
          onPressed: () {
            context.read<CartCubit>().toggleCart({
              'id': id,
              'name': name,
              'price': price,
              'image_link': productImage
            });
          },
          icon: Icon(
            isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
            size: 21.sp,
            color: isInCart ? ColorsManager.secondaryPink : Colors.white,
          ),
          label: Text(
            isInCart ? 'مضاف للسلة' : 'اضف للسلة',
            style: isInCart ? Styles.font16PinkBold : Styles.font16WhiteBold,
          ),

          // icon: Icon(
          //   Icons.add_shopping_cart,
          //   color: Colors.white,
          //   size: 21.sp,
          // ),
          // label: Text(
          //   isInCart ? 'مضاف للسلة' : 'اضف للسلة',
          //   style: Styles.font16WhiteBold,
          // ),
        );
      },
    );
  }
}
