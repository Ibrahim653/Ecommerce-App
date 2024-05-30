import 'package:e_commerce_app/features/product_details/data/models/product_details_model.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class GetProductByIdRepo {
  final ApiService _apiService;

  GetProductByIdRepo(this._apiService);

  Future<ApiResult<List<ProductDetailsModel>>> getProductById(int id) async {
    try {
      String accessToken = CacheHelper.getString(Constants.accessToken) ?? "";
      final response = await _apiService.getProductById("Bearer $accessToken", id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
