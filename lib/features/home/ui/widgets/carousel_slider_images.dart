import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';

class CarouselSliderImages extends StatelessWidget {
  final int activeIndex;
  final Function(int) onPageChanged;

  const CarouselSliderImages({
    super.key,
    required this.activeIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            onPageChanged(index);
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
          onPageChanged(index);
        },
      ),
    );
  }
}
