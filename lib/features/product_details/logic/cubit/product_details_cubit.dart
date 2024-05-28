import 'package:e_commerce_app/features/product_details/logic/cubit/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/product_details_repo.dart';

class GetProductByIdCubit extends Cubit<ProductDetailsState> {
  final GetProductByIdRepo _getProductByIdRepo;

  GetProductByIdCubit(this._getProductByIdRepo)
      : super(const ProductDetailsState.initial());

  Future<void> fetchProductById( int id) async {
    emit(const ProductDetailsState.loading());

    try {
      final response = await _getProductByIdRepo.getProductById(id);
      response.when(
        success: (productDetails) {
          emit(ProductDetailsState.success(productDetails));
        },
        failure: (error) {
          emit(ProductDetailsState.error(
              error: error.apiErrorModel.message ?? 'Unknown error'));
        },
      );
    } catch (error) {
      emit(ProductDetailsState.error(error: error.toString()));
    }
  }
}
