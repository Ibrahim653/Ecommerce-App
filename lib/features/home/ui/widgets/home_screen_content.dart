import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/features/home/ui/widgets/home_app_bar.dart';
import 'package:e_commerce_app/features/home/ui/widgets/list_categories_items.dart';
import 'package:e_commerce_app/features/home/ui/widgets/product_item.dart';
import 'package:e_commerce_app/features/home/ui/widgets/smooth_indicator.dart';
import 'package:e_commerce_app/features/home/ui/widgets/title_above_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int activeIndex = 0;
  int selectedPage = 0;
  bool iscolor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 0),
                height: 230.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: iscolor
                        ? [
                            const Color(0xFF8B6FC4),
                            const Color.fromARGB(255, 166, 125, 201),
                            ColorsManager.appBackgroundColor,
                          ]
                        : [
                            const Color.fromARGB(255, 223, 127, 3),
                            const Color.fromARGB(255, 219, 171, 65),
                            ColorsManager.appBackgroundColor,
                          ],
                    stops: const [0.0, 0.4, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  const HomeAppBar(),
                  CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeIndex == 1
                                ? activeIndex = 0
                                : activeIndex = 1;
                            iscolor = !iscolor;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: activeIndex == 0
                                  ? const AssetImage(Constants.homeImage2)
                                  : const AssetImage(Constants.homeImage1),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 2,
                    options: CarouselOptions(
                      viewportFraction: 0.98,
                      aspectRatio: 2.6,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                          iscolor = !iscolor;
                        });
                      },
                    ),
                  ),
                  verticalSpace(20),
                  SmoothIndeicator(
                    activeIndex: activeIndex,
                    count: 2,
                  ),
                  verticalSpace(20),
                  const ListCatgroiesItems(),
                  verticalSpace(20),
                  const TitleAboveList(
                    title: "وصل حديثا",
                  ),
                  SizedBox(
                    height: 210.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5.w,
                      ),
                      itemBuilder: (context, index) => const ProdectItems(),
                    ),
                  ),
                  const TitleAboveList(
                    title: "وصل حديثا",
                  ),
                  SizedBox(
                    height: 210.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5.w,
                      ),
                      itemBuilder: (context, index) => const ProdectItems(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
