import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/products_model.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/add_to_cart_button.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/favorite_share_buttons.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/product_description.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/product_expansion_tile.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/product_image.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/product_price_rating.dart';
import 'package:e_commerce_app/features/home/producr_ui/widgets/quantity_selctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailsContent({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(imageUrl: product.results?[0].imageLink),
            const FavoriteShareButtons(),
            verticalSpace(21.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDescription(
                      description: product.results?[1].description),
                  verticalSpace(5.h),
                  ProductPriceAndRating(
                    price: product.results?[1].price,
                    rate: product.results?[1].rate,
                  ),
                  SizedBox(height: 5.h),
                  Divider(
                    thickness: 1,
                    color: ColorsManager.lightGrey.withOpacity(0.7),
                  ),
                  ProductDetailsExpansionTile(
                    description: product.results?[1].description,
                  ),
                  Divider(
                    thickness: 1,
                    color: ColorsManager.lightGrey.withOpacity(0.7),
                  ),
                  verticalSpace(5.h),
                  const QuantitySelector(),
                  verticalSpace(25.h),
                  const Center(
                    child: AddToCartButton(),
                  ),
                  verticalSpace(25.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
