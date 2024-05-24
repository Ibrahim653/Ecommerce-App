import 'package:e_commerce_app/features/category/data/repos/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(const CategoryState.initial());

  void getCategories() async {
    emit(const CategoryState.loading());
    try {
      final response = await categoryRepo.getCategories();
      response.when(
        success: (categories) {
          emit(CategoryState.success(categories));
        },
        failure: (error) {
          emit(CategoryState.error(
              error: error.apiErrorModel.message ?? 'Unknown error'));
        },
      );
    } catch (e) {
      emit(CategoryState.error(error: e.toString()));
    }
  }
}
