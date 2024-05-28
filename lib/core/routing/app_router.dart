import 'package:e_commerce_app/features/category/ui/category_screen.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/features/product_details/ui/product_details_screen.dart';
import 'package:e_commerce_app/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/login/logic/cubit/login_cubit.dart';
import '../../../features/login/ui/login_screen.dart';
import '../../../features/register/logic/cubit/register_cubit.dart';
import '../../../features/register/ui/register_screen.dart';
import '../../features/category/logic/cubit/category_cubit.dart';
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<GetProductCubit>()..getAllProducts(),
              ),
              BlocProvider(
                create: (context) => getIt<CategoryCubit>()..getCategories(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CategoryCubit>()..getCategories(),
            child: const CategoriesScreen(),
          ),
        );

      case Routes.productScreen:
        final productId = settings.arguments;
        if (productId is int) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) =>
                  getIt<GetProductByIdCubit>()..fetchProductById(productId),
              child: ProductDetailsScreen(
                productId: productId,
              ),
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(child: Text('Invalid Product ID: $productId')),
            ),
          );
        }

      default:
        return null;
    }
  }
}
