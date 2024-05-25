import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'quantity_selctor.dart';

class ProductDetailsContent extends StatelessWidget {
  final ProductsModel product;

  const ProductDetailsContent({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(4.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.results?[0].imageLink ?? '/images',
                  height: 340.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 340.h,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.05), // less shadow
                            spreadRadius: 1,
                            blurRadius: 2, // reduced blur
                            offset: const Offset(0, 1), // reduced offset
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite,
                            color: ColorsManager.secondaryPink),
                        label: Text(
                          'مضاف للمفضلة',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 1, // reduced elevation
                          minimumSize: Size(0.w, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5.w,
                    height: 48.h,
                    color: ColorsManager.lightGrey,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share,
                            color: ColorsManager.lightGrey),
                        label: Text(
                          'مشاركة المنتج',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          elevation: 1,
                          minimumSize: Size(0.w, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(21.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.results?[1].description ?? 'description',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${product.results?[1].price} ج.م',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text('4.5'),
                        horizontalSpace(3.w),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Divider(
                      thickness: 1,
                      color: ColorsManager.lightGrey.withOpacity(0.7),
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      iconColor: ColorsManager.lightGrey,
                      childrenPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      title: Text(
                        "الوصف",
                        style: Styles.font16GreyMedium,
                      ),
                      children: [
                        Text(
                          product.results?[1].description ?? 'description',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorsManager.lightGrey.withOpacity(0.7),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const QuantitySelector(),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                      },
                      child: const Text('اضافة للسلة'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
