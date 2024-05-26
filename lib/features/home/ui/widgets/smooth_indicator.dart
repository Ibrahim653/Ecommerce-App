import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors.dart';

class SmoothIndeicator extends StatelessWidget {
  const SmoothIndeicator({
    super.key,
    required this.activeIndex,
    required this.count,
    this.dotHeight,
    this.dotWidth,
    this.activeDotColor,
    this.spacing,
  });

  final int activeIndex;
  final int count;
  final double? dotHeight;
  final double? dotWidth;
  final Color? activeDotColor;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ExpandingDotsEffect(
          dotHeight: dotHeight ?? 4,
          dotWidth: dotWidth ?? 5,
          spacing: spacing ?? 5,
      
          
          dotColor: Colors.grey,
          activeDotColor: activeDotColor ?? ColorsManager.primaryCyan,
          paintStyle: PaintingStyle.fill),
    );
  }
}
