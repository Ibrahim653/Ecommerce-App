import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/styles.dart';

class ProdectItems extends StatelessWidget {
  const ProdectItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 133.w,
        height: 205.h,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 115.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Constants.loginLogo),
                        fit: BoxFit.contain),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                      size: 27.sp,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " نسائية مطلية بالذهب على شك  قلادة نسائية مطلية بالذهب على شكل",
                  style: Styles.font12GreyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('199.00 ', style: Styles.font14CyanBold),
                          Text('ج.م', style: Styles.font12CyanMedium),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_shopping_cart,
                            size: 21.sp,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
