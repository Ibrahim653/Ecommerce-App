class ApiConstants {
  static const String apiBaseUrl = 'https://flutterapi.kortobaa.net/';
  static const String login = 'users/login/';
  static const String register = 'users/register/';
  static const String getProducts = 'api/v1/products/';
  static const String getCategories = 'api/v1/categories';
  static const String getProductById = 'api/v1/products/{id}/';
  static const String getProductsByCategoryId = 'api/v1/products/category/{id}';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
