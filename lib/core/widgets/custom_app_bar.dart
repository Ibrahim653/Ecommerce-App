import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onPressedIcon, required this.title});
final void Function()? onPressedIcon;
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      title: Text(
        title,
        style: Styles.font16GreyMedium,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 22.sp,
          color: Colors.black54,
        ),
        onPressed: () {},
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
            icon: Icon(
              Icons.search,
              size: 22.sp,
              color: Colors.black54,
            ),
            onPressed: onPressedIcon,
          ),
        ),
    
      ],
    );
  }
}
