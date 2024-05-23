import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/ui/home_screen.dart';
import '../../../features/login/logic/cubit/login_cubit.dart';
import '../../../features/login/ui/login_screen.dart';
import '../../../features/register/logic/cubit/register_cubit.dart';
import '../../../features/register/ui/register_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetProductCubit>()..getAllProducts(),
            child: const HomeScreen(),
          ),
        );
    }
    return null;
  }
}
