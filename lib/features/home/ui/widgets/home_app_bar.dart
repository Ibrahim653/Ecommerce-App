import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        'الرئيسية',
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
    );
  }
}
