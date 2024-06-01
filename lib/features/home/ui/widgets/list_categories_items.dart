import 'package:e_commerce_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../category/logic/cubit/category_cubit.dart';
import '../../../category/logic/cubit/category_state.dart';

class ListCategoriesItems extends StatelessWidget {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30.r,
                    ),
                    verticalSpace(7),
                    Container(
                      width: 60.w,
                      height: 12.h,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          success: (categories) => SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.results.length,
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.pushNamed(Routes.categoryDetailsScreen,
                      arguments: categories.results[index].id);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        categories.results[index].imageLink,
                      ),
                      radius: 30.r,
                    ),
                    verticalSpace(7),
                    Text(
                      categories.results[index].name,
                      style: Styles.font12GreyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (message) => SizedBox(
            height: 100.h,
            child: Center(child: Text(message)),
          ),
        );
      },
    );
  }
}
