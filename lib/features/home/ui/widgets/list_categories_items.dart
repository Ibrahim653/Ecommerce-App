import 'package:e_commerce_app/features/home/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListCatgroiesItems extends StatelessWidget {
  const ListCatgroiesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          width: 8.w,
        ),
        itemBuilder: (context, index) => const CatgroiyItem(),
      ),
    );
  }
}