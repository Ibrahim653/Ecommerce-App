import 'package:e_commerce_app/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/features/product_details/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class FavoriteShareButtons extends StatelessWidget {
  const FavoriteShareButtons({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.productImage,
  });
  final int id;
  final String name;
  final String price;
  final String productImage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite = state.isFavorite(id);

        return Row(
          children: [
            Expanded(
              child: CustomButton(
                icon: Icons.favorite,
                label: Text(
                  isFavorite ? 'مضاف للمفضلة' : 'اضف للمفضلة',
                  style: isFavorite
                      ? Styles.font14PinkBold
                      : Styles.font14GreyMedium,
                ),
                iconColor:
                    isFavorite ? ColorsManager.secondaryPink : Colors.grey,
                onPressed: () {
                  context.read<FavoriteCubit>().toggleFavorite({
                    'id': id,
                    'name': name,
                    'price': price,
                    'image_link': productImage
                  });
                },
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
                label: Text(
                  'مشاركة المنتج',
                  style: Styles.font14GreyMedium,
                ),
                iconColor: ColorsManager.lightGrey,
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
