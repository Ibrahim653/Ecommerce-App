import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/features/home/logic/product_cubit/get_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/product_details_content.dart';

class ProductDetailsScreen extends StatelessWidget {

  const ProductDetailsScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocBuilder<GetProductCubit, GetProductState>(
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
                return  ProductDetailsContent(product: categories);
              } else {
                return const Center(child: Text('No products available'));
              }
            },
            error: (String error) {
              return Center(child: Text(error));
            },
          );

          // if (state is ProductDetailsLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (state is ProductDetailsLoaded) {
          //   return ProductDetailsContent(product: state.product);
          // } else if (state is ProductDetailsError) {
          //   return Center(child: Text(state.message));
          // } else {
          //   return const Center(child: Text('Unknown state'));
          // }
        },
      ),
    );
  }
}
