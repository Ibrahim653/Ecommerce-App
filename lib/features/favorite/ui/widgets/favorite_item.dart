import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/favorite_cubit.dart';

class FavoriteItem extends StatelessWidget {
  final int id;
  final String name;
  final String price;
  final String productImage;

  const FavoriteItem({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 16.h),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 424.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: productImage,
                    height: 253.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 253.h,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().toggleFavorite({
                          'id': id,
                          'name': name,
                          'price': price,
                          'image_link': productImage,
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: ColorsManager.secondaryPink,
                        size: 27.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                child: Text(
                  name,
                  style: Styles.font16GreyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Row(
                  children: [
                    Text(
                      '$price ',
                      style: Styles.font18CyanMedium,
                    ),
                    Text(
                      'ج.م',
                      style: Styles.font14CyanBold,
                    ),
                  ],
                ),
              ),
              AppTextButton(
                buttonText: 'نقل إلى سلة التسوق',
                textStyle: Styles.font16WhiteBold,
                onPressed: () {},
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4.r),
                  bottomRight: Radius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
