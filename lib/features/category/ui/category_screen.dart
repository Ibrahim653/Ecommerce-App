import 'package:e_commerce_app/features/category/logic/cubit/category_cubit.dart';
import 'package:e_commerce_app/features/category/logic/cubit/category_state.dart';
import 'package:e_commerce_app/features/category/ui/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Screen'),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(child: Text('Initial State'));
            },
            loading: () {
              return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()));
            },
            success: (categories) {
              if (categories.results != null &&
                  categories.results!.isNotEmpty) {
                return CategoryList(categories: categories);
              } else {
                return const Center(child: Text('No products available'));
              }
            },
            error: (String error) {
              return Center(child: Text(error));
            },
          );
        },
      ),
    );
  }
}
