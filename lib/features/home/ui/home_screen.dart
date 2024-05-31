import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce_app/core/helpers/extensions.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/features/category/ui/category_screen.dart';
import 'package:e_commerce_app/features/favorite/ui/favorite_screen.dart';
import 'package:e_commerce_app/features/home/ui/widgets/home_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Icons.category,
    Icons.favorite,
    Icons.person,
  ];

  final labelList = [
    'الرئيسية',
    'الأقسام',
    'المفضلة',
    'الحساب',
  ];

  final List<Widget> _pages = [
    const HomePageContent(),
    const CategoriesScreen(),
    const FavoriteScreen(),
    const CategoriesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[selectedPage],
        floatingActionButton: selectedPage == 0
            ? null
            : FloatingActionButton(
                onPressed: () {
                  context.pushNamed(Routes.cartScreen);
                },
                backgroundColor: ColorsManager.secondaryPink,
                shape: const CircleBorder(),
                child: Icon(Icons.shopping_cart, size: 23.sp),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          height: 55.h,
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? ColorsManager.primaryCyan : Colors.black54;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 20.sp,
                  color: color,
                ),
                SizedBox(height: 4.h),
                Text(
                  labelList[index],
                  style: Styles.font12GreyMedium.copyWith(
                    color: color,
                  ),
                ),
              ],
            );
          },
          activeIndex: selectedPage,
          gapLocation:
              selectedPage == 0 ? GapLocation.none : GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          splashColor: ColorsManager.primaryCyan.withOpacity(0.2),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
