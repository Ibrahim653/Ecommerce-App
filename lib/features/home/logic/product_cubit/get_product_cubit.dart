import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repos/get_products_repo.dart';
import 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  final GetProductsRepo getProductsRepo;

  GetProductCubit(this.getProductsRepo ) : super(const GetProductState.initial());

  void getAllProducts() async {
    emit(const GetProductState.loading());
    try {
      final response = await getProductsRepo.getProducts();
      response.when(
        success: (getProducts) {
          emit(GetProductState.success(getProducts));
        },
        failure: (error) {
          emit(GetProductState.error(
              error: error.apiErrorModel.message ?? 'Unknown error'));
        },
      );
    } catch (e) {
      emit(GetProductState.error(error: e.toString()));
    }
  }
}
