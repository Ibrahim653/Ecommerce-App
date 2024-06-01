import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/products_by_category_id/logic/cubit/categories_details_cubit.dart';
import 'package:e_commerce_app/features/home/ui/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product_details/ui/widgets/product_shimmer.dart';
import '../logic/cubit/categories_details_state.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key, required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'المنتجات المصنفة',
        ),
        body: BlocBuilder<GetCategoriesByIdCubit, CategoriesDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initial State')),
              loading: () => const ProductShimmer(),
              success: (categories) {
              if (categories.results.isEmpty) {
                    return const Center(
                      child: Text('لا توجد منتجات متاحة'),
                    );
                  }
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ProductsList(
                              products: categories,
                              categoryId: categories.results[index].category.id,
                              scrollDirection: Axis.vertical,
                              listHeight: MediaQuery.of(context).size.height*0.8,
                            );
                          },
                          childCount: 1,
                        ),
                      ),
                    ),
                  
                  ],
                );
              },
              error: (String error) => Center(child: Text(error)),
            );
          },
        ),
      ),
    );
  }
}
