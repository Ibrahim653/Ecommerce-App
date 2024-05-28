import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/category/data/repos/category_repo.dart';
import 'package:e_commerce_app/features/category/logic/cubit/category_cubit.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../features/login/data/repos/login_repo.dart';
import '../../../features/login/logic/cubit/login_cubit.dart';
import '../../../features/register/data/repos/register_repo.dart';
import '../../../features/register/logic/cubit/register_cubit.dart';
import '../../features/home/data/repos/get_products_repo.dart';
import '../../features/product_details/data/repos/product_details_repo.dart';
import '../../features/product_details/logic/cubit/product_details_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // dio and api service
  Dio dio = DioFactory.getdio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //register
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  //get products
  getIt.registerLazySingleton<GetProductsRepo>(() => GetProductsRepo(getIt()));
  getIt.registerLazySingleton<GetProductCubit>(() => GetProductCubit(getIt()));

  //get categories
  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit(getIt()));
    //get product By Id
  getIt.registerLazySingleton<GetProductByIdRepo>(() => GetProductByIdRepo(getIt()));
  getIt.registerLazySingleton<GetProductByIdCubit>(() => GetProductByIdCubit(getIt()));
}
