import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/styles.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 18.w,right: 18.w,bottom:16.h),
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
                    imageUrl: 'https://e7.pngegg.com/pngimages/420/138/png-clipart-pair-of-yellow-and-black-nike-shoes-illustration-wu-tang-clan-the-swarm-nike-dunk-hip-hop-music-nike-shoes-comics-outdoor-shoe-thumbnail.png',
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
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 27.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
                child: Text(
                  'padding: EdgeInsets.only(left: 20.w) , padding: EdgeInsets.only(left: 20.w), padding: EdgeInsets.only(left: 20.w)',
                  style: Styles.font16GreyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
               child:  Row(
                      children: [
                        Text('122.00 ', style: Styles.font18CyanMedium),
                        Text('ج.م', style: Styles.font14CyanBold),
                      ],
                    ),
              ),
              AppTextButton(buttonText: 'نقل إلى سلة التسوق', textStyle: Styles.font16WhiteBold, onPressed: (){},
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
