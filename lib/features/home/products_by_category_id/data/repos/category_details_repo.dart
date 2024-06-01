

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../data/models/product_model/products_model.dart';

class CategoryDetailsRepo {
  final ApiService _apiService;

  CategoryDetailsRepo(this._apiService);

  Future<ApiResult<ProductsModel>> getProductsByCategoryId(int id
      ) async {
    try {
      String accessToken = CacheHelper.getString(Constants.accessToken) ?? "";
      final  response =
          await _apiService.getProductsByCategoryId("Bearer $accessToken",  id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
