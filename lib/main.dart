import 'package:e_commerce_app/e_commerce_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';

void main() async {
  // To fix texts being hidden bun in flutter_screen_util in release mode
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(EcommerceApp(
    appRouter: AppRouter(),
  ));
}