import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';

class CatgroiyItem extends StatelessWidget {
  const CatgroiyItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage(
            Constants.loginLogo,
          ),
          radius: 30.r,
        ),
        verticalSpace(7),
        Text(
          'أزياء',
          style: Styles.font12GreyMedium
        ),
      ],
    );
  }
}