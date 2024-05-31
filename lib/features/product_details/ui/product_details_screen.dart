import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/add_to_cart_button.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/favorite_share_buttons.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/product_description.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/product_expansion_tile.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/product_image.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/product_price_rating.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/quantity_selctor.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../logic/cubit/product_details_cubit.dart';
import '../logic/cubit/product_details_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetProductByIdCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial State')),
            loading: () => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            ),
            success: (products) {
              final product = products[0];
              if (product != null) {
                return SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductImage(imageLink: product.imageLink),
                        FavoriteShareButtons(
                          id: product.id,
                          name: product.name,
                          price: product.price,
                          productImage: product.imageLink,
                        ),
                        verticalSpace(21.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductDescription(
                                  description: product.description),
                              verticalSpace(5.h),
                              ProductPriceAndRating(
                                price: product.price,
                                rate: product.rate,
                              ),
                              SizedBox(height: 5.h),
                              Divider(
                                thickness: 1,
                                color: ColorsManager.lightGrey.withOpacity(0.7),
                              ),
                              ProductDetailsExpansionTile(
                                  description: product.description),
                              Divider(
                                thickness: 1,
                                color: ColorsManager.lightGrey.withOpacity(0.7),
                              ),
                              verticalSpace(5.h),
                              QuantitySelector(
                                price: double.parse(product.price),
                              ),
                              verticalSpace(25.h),
                              Center(
                                  child: AddToCartButton(
                                id: product.id,
                                name: product.name,
                                price: product.price,
                                productImage: product.imageLink,
                              )),
                              verticalSpace(25.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                    child: Text('No product details available'));
              }
            },
            error: (String error) => Center(child: Text(error)),
          );
        },
      ),
    );
  }
}
