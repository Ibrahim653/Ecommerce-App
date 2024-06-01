import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_details_state.freezed.dart';
@freezed
class CategoriesDetailsState<T> with _$CategoriesDetailsState<T> {
  const factory CategoriesDetailsState.initial() = _Initial;
  const factory CategoriesDetailsState.loading() = Loading;
  const factory CategoriesDetailsState.success(T productDetails) = Success<T>;
  const factory CategoriesDetailsState.error({required String error}) = Error;
}


