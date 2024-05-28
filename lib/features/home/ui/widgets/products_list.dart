import 'package:e_commerce_app/core/helpers/extensions.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/products_model.dart';
import 'package:e_commerce_app/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.products,
  });

  final ProductsModel products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.results.length,
        itemBuilder: (context, index) {
          final product = products.results[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(
              
                Routes.productScreen,
              //  arguments: product.id,
              );
            },
            child: ProductItem(
              name: product.name ?? "No name",
              price: product.price ?? "No price",
              productImage: product.imageLink ?? "https://via.placeholder.com/150",
            ),
          );
        },
      ),
    );
  }
}
