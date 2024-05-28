import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/cart_item.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/coupon_section.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/invoice_card.dart';
import 'package:e_commerce_app/features/cart/ui/widgets/total_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const TotalSection(),
                const CartItem(
                  name:
                      'عطر برائحة البرتقال والسدر الجبلي مناسب للسهرات والهدايا مغلف في زجاجة مزخرفة بالذهب',
                  imageUrl:
                      'https://e7.pngegg.com/pngimages/420/138/png-clipart-pair-of-yellow-and-black-nike-shoes-illustration-wu-tang-clan-the-swarm-nike-dunk-hip-hop-music-nike-shoes-comics-outdoor-shoe-thumbnail.png',
                ),
                const CartItem(
                  name: 'تيشرت-كم طويل-للن-وينتر-نسيائى-',
                  imageUrl:
                      'https://e7.pngegg.com/pngimages/420/138/png-clipart-pair-of-yellow-and-black-nike-shoes-illustration-wu-tang-clan-the-swarm-nike-dunk-hip-hop-music-nike-shoes-comics-outdoor-shoe-thumbnail.png',
                ),
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
        ),
      ),
    );
  }
}
