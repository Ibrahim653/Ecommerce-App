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
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.loginScreen,
      ),
    );
  }
}