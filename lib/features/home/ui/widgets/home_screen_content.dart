import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_state.dart';
import 'package:e_commerce_app/features/home/ui/widgets/carousel_slider_images.dart';
import 'package:e_commerce_app/features/home/ui/widgets/gradient_background.dart';
import 'package:e_commerce_app/features/home/ui/widgets/list_categories_items.dart';
import 'package:e_commerce_app/features/home/ui/widgets/products_list.dart';
import 'package:e_commerce_app/features/home/ui/widgets/smooth_indicator.dart';
import 'package:e_commerce_app/features/home/ui/widgets/title_above_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custome_search_text_field.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int activeIndex = 0;
  bool isColor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: BlocBuilder<GetProductCubit, GetProductState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                },
                loading: () {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(child: CircularProgressIndicator()));
                },
                success: (products) {
                  if (products.results != null && products.results!.isNotEmpty) {
                    return Stack(
                      children: [
                        GradientBackground(isColor: isColor),
                        Column(
                          children: [
                            const CustomAppBar(title: 'الرئيسية', backgroundColor: Colors.transparent,),
                            const CustomSearchTextField(),
                            CarouselSliderImages(
                              activeIndex: activeIndex,
                              onPageChanged: (index) {
                                setState(() {
                                  activeIndex == 0 ? activeIndex = 1 : activeIndex = 0;
                                  isColor = !isColor;
                                });
                              },
                            ),
                            verticalSpace(20),
                            SmoothIndeicator(activeIndex: activeIndex, count: 2),
                            verticalSpace(30),
                            Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Column(
                                children: [
                                  const ListCategoriesItems(),
                                  const TitleAboveList(title: "وصل حديثا"),
                                  ProductsList(
                                    products: products,
                                    categoryId: 5, // Display products of category 5
                                  ),
                                  const TitleAboveList(title: "الأكثر شعبية"),
                                  ProductsList(
                                    products: products,
                                    categoryId: 1, // Display products of category 1
                                  ),
                                  verticalSpace(50),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: Text('No products available'));
                  }
                },
                error: (String error) {
                  return Center(child: Text(error));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
