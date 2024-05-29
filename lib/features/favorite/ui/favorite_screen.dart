import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/features/favorite/ui/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';

import '../logic/cubit/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const CustomAppBar(
              title: 'المفضلة',
            ),
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  final favorites = state.favorites;
                  if (favorites.isEmpty) {
                    return Center(child: Text('No favorites added', style: Styles.font16GreyMedium,));
                  }
                  return ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = favorites[index];
                      return FavoriteItem(
                        id: product['id'],
                        name: product['name'],
                        price: product['price'],
                        productImage: product['image_link'],
                      );
                    },
                  );
                },
              ),
            ),
            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
