import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../category/logic/cubit/category_cubit.dart';
import '../../category/ui/category_screen.dart';
import '../logic/product_cubit/get_product_cubit.dart';
import '../logic/product_cubit/get_product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
         actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: () {
              final categoryCubit = context.read<CategoryCubit>();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: categoryCubit,
                    child: const CategoriesScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
            success: (products) {
              if (products.results != null && products.results!.isNotEmpty) {
                return ListView.builder(
                  itemCount: products.results!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products.results![index].name),
                    );
                  },
                );
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
