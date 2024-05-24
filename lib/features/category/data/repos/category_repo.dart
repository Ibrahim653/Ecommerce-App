import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/category_model.dart';

class CategoryRepo {
  final ApiService _apiService;

  CategoryRepo(this._apiService);

  Future<ApiResult<CategoryResponse>> getCategories(
      ) async {
    try {
      String accessToken = CacheHelper.getString(Constants.accessToken) ?? "";
     // String refreshToken = CacheHelper.getString(Constants.refreshToken) ?? "";
      final  response =
          await _apiService.getCategories("Bearer $accessToken");
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}



