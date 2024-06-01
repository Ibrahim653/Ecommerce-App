import 'package:e_commerce_app/features/home/products_by_category_id/data/repos/category_details_repo.dart';
import 'package:e_commerce_app/features/home/products_by_category_id/logic/cubit/categories_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GetCategoriesByIdCubit extends Cubit<CategoriesDetailsState> {
  final CategoryDetailsRepo _categoryDetailsRepo;

  GetCategoriesByIdCubit(this._categoryDetailsRepo)
      : super(const CategoriesDetailsState.initial());

  Future<void> fetchCategoriesById(int id) async {
    emit(const CategoriesDetailsState.loading());

    try {
      final response = await _categoryDetailsRepo.getProductsByCategoryId(id);
      response.when(
        success: (categoriesDetails) {
          emit(CategoriesDetailsState.success(categoriesDetails));
        },
        failure: (error) {
          emit(CategoriesDetailsState.error(
              error: error.apiErrorModel.message ?? 'Unknown error'));
        },
      );
    } catch (error) {
      emit(CategoriesDetailsState.error(error: error.toString()));
    }
  }
}
