import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/ui/cart_screen.dart';
import 'package:e_commerce_app/features/category/ui/category_screen.dart';
import 'package:e_commerce_app/features/home/ui/home_screen.dart';
import 'package:e_commerce_app/features/product_details/ui/product_details_screen.dart';
import 'package:e_commerce_app/features/login/ui/login_screen.dart';
import 'package:e_commerce_app/features/register/ui/register_screen.dart';
import 'package:e_commerce_app/features/favorite/ui/favorite_screen.dart';
import 'package:e_commerce_app/features/cart/ui/logic/cubit/cart_cubit.dart';
import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/category/logic/cubit/category_cubit.dart';
import 'package:e_commerce_app/features/favorite/logic/cubit/favorite_cubit.dart';

import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/product_details/logic/cubit/product_details_cubit.dart';
import '../../features/register/logic/cubit/register_cubit.dart';

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
              BlocProvider(
                create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
              ),
              BlocProvider.value(
                value: getIt<CartCubit>()..loadCartItems(),
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
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<GetProductByIdCubit>()
                  ..fetchProductById(productId),
              ),
              BlocProvider.value(
                value:  getIt<FavoriteCubit>()..loadFavorites(),
              ),
                BlocProvider.value(
                value:  getIt<CartCubit>()..loadCartItems(),
              ),
            ],
            child: ProductDetailsScreen(
              productId: productId,
            ),
          ),
        );
      
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<FavoriteCubit>()..loadFavorites(),
            child: const FavoriteScreen(),
          ),
        );

      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<CartCubit>(),
            child: const CartScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
