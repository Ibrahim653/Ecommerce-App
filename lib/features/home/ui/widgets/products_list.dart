import 'package:e_commerce_app/features/home/data/models/product_model/products_model.dart';
import 'package:e_commerce_app/features/home/ui/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.products,
    required this.categoryId,
    this.scrollDirection, this.listHeight,
  });

  final ProductsModel products;
  final int categoryId;
  final Axis? scrollDirection;
  final double? listHeight;
  @override
  Widget build(BuildContext context) {
    final filteredProducts = _filterProductsByCategoryId(products, categoryId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height:listHeight?? 210.h,
          child: ListView.builder(
            scrollDirection: scrollDirection ?? Axis.horizontal,
            itemCount: filteredProducts.length,
            itemBuilder: (context, index) {
              final product = filteredProducts[index];
              return ProductItem(
                name: product.name ?? "No name",
                price: product.price ?? "No price",
                productImage:
                    product.imageLink ?? "https://via.placeholder.com/150",
                id: product.id ?? 0,
              );
            },
          ),
          
        ),
  
      ],
    );
  }

  List<Result> _filterProductsByCategoryId(
      ProductsModel products, int categoryId) {
    return products.results
        .where((product) => product.category?.id == categoryId)
        .toList();
  }
}
