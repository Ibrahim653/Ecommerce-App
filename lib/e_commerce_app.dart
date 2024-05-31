import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/core/helpers/constants.dart';
import 'package:e_commerce_app/core/helpers/shared_prefs_helper.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      //  splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: ColorsManager.appBackgroundColor),
            primaryColor: ColorsManager.mainBlue,
            fontFamily: Constants.fontFamily),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute:  CacheHelper.getString(Constants.autoLogin) == null
            ? Routes.loginScreen
            : Routes.homeScreen,
      ),
    );
  }
}
