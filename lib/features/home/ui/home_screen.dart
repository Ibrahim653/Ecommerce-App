import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce_app/features/category/ui/category_screen.dart';
import 'package:e_commerce_app/features/home/producr_ui/product_details_screen.dart';
import 'package:e_commerce_app/features/home/ui/widgets/home_screen_content.dart';
import 'package:flutter/material.dart';

import '../../../core/theming/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int selectedPage = 0;

   final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.shopping_cart,
    Icons.person,
  ];

  final List<Widget> _pages = [
    const HomePageContent(),
    const CategoriesScreen(),
    const ProductDetailsScreen(),
    const CategoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPage],
      floatingActionButton: selectedPage == 0
          ? null
          : FloatingActionButton(
              onPressed: () {},
              backgroundColor: ColorsManager.secondaryPink,
              child: const Icon(Icons.shopping_cart),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: selectedPage,
        gapLocation: selectedPage == 0 ? GapLocation.none : GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        activeColor: ColorsManager.primaryCyan,
        splashColor: ColorsManager.primaryCyan.withOpacity(0.2),
        inactiveColor: Colors.grey,
    
        backgroundColor: Colors.white,
      ),
    );
  }
}





 //   appBar: AppBar(
    //     title: const Text('Home Screen'),
    //   ),
    //   body: BlocBuilder<GetProductCubit, GetProductState>(
    //     builder: (context, state) {
    //       return state.when(
    //         initial: () => const Center(child: Text('Initial State')),
    //         loading: () => const Center(child: CircularProgressIndicator()),
    //         success: (products) {
    //           if (products.results != null && products.results!.isNotEmpty) {
    //             return ListView.builder(
    //               itemCount: products.results!.length,
    //               itemBuilder: (context, index) {
    //                 final product = products.results![index];
    //                 return ListTile(
    //                   title: Text(product.name),
    //                   onTap: () {
    //                     Navigator.pushNamed(
    //                       context,
    //                       Routes.productScreen,
    //                       arguments: products.results?[1].id?? 1,
    //                     );
    //                   },
    //                 );
    //               },
    //             );
    //           } else {
    //             return const Center(child: Text('No products available'));
    //           }
    //         },
    //         error: (error) => Center(child: Text(error)),
    //       );
    //     },
    //   ),
    // );