import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/product_model/products_model.dart';

class GetProductsRepo {
  final ApiService _apiService;

  GetProductsRepo(this._apiService);

  Future<ApiResult<ProductsModel>> getProducts(
      ) async {
    try {
      String accessToken = CacheHelper.getString(Constants.accessToken) ?? "";
      String refreshToken = CacheHelper.getString(Constants.refreshToken) ?? "";
      final  response =
          await _apiService.getProducts("Bearer $accessToken");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
