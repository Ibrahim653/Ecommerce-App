import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_state.freezed.dart';

@freezed
class CategoryState<T> with _$CategoryState<T> {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = Loading;
  const factory CategoryState.success(T getCategory) = Success<T>;
  const factory CategoryState.error({required String error}) = Error;
}







