import 'package:e_commerce_app/features/category/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  final CategoryResponse categories;

  const CategoryList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
      itemCount: categories.results.length,
      itemBuilder: (context, index) {
        final category = categories.results[index];
        return Column(
          children: [
            CategoryItem(
              name: category.name,
              
              imageUrl: category.imageLink,
            ),
          ],
        );
      },
    );
  }
}
