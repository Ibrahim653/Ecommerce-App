import 'package:e_commerce_app/features/favorite/ui/widgets/favorite_item.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/custom_app_bar.dart';

class FavorietScreen extends StatelessWidget {
  const FavorietScreen({super.key});

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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const FavoriteItem();
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
