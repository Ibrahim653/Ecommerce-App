import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class GradientBackground extends StatelessWidget {
  final bool isColor;
  const GradientBackground({super.key, required this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isColor
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
    );
  }
}
