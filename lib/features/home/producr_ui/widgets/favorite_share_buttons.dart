import 'package:e_commerce_app/features/home/producr_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class FavoriteShareButtons extends StatelessWidget {
  const FavoriteShareButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      icon: Icons.favorite,
                      label: Text('مضاف للمفضلة',
                      style: Styles.font14PinkBold,
                      ),
                      iconColor: ColorsManager.secondaryPink,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: 0.5.w,
                    height: 48.h,
                    color: ColorsManager.lightGrey,
                  ),
                  Expanded(
                    child: CustomButton(
                      icon: Icons.share,
                      label:Text( 'مشاركة المنتج',
                      style: Styles.font14GreyMedium,
                      ),
                      iconColor: ColorsManager.lightGrey,
                      onPressed: () {},
                    ),
                  ),
                ],
              );
  }
}