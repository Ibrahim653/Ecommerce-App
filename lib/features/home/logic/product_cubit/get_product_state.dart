
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_product_state.freezed.dart';
@freezed
class GetProductState<T> with _$GetProductState<T> {
  const factory GetProductState.initial() = _Initial;
  const factory GetProductState.loading() = Loading;
  const factory GetProductState.success(T getProducts) = Success<T>;
  const factory GetProductState.error({required String error}) = Error;
}



