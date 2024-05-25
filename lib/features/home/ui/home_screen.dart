import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routing/routes.dart';
import '../logic/product_cubit/get_product_cubit.dart';
import '../logic/product_cubit/get_product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial State')),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (products) {
              if (products.results != null && products.results!.isNotEmpty) {
                return ListView.builder(
                  itemCount: products.results!.length,
                  itemBuilder: (context, index) {
                    final product = products.results![index];
                    return ListTile(
                      title: Text(product.name),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.productScreen,
                          arguments: products.results?[1].id?? 1,
                        );
                      },
                    );
                  },
                );
              } else {
                return const Center(child: Text('No products available'));
              }
            },
            error: (error) => Center(child: Text(error)),
          );
        },
      ),
    );
  }
}
