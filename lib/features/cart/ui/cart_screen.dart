import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/cart/ui/logic/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/cart_item.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/coupon_section.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/invoice_card.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/total_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'سلة التسوق'),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cartItem = state.cartItems;

            if (cartItem.isEmpty) {
              return Center(
                  child: Text(
                'No Products added',
                style: Styles.font16GreyMedium,
              ));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const TotalSection(),
                    ...state.cartItems.map((item) => CartItem(
                          name: item['name'],
                          imageUrl: item['image_link'],
                          price: item['price'],
                          id: item['id'],
                        )),
                    verticalSpace(15),
                    const CouponSection(),
                    const InvoiceCard(),
                    verticalSpace(5),
                    AppTextButton(
                      buttonText: 'إتمام الشراء',
                      textStyle: Styles.font16WhiteBold,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
