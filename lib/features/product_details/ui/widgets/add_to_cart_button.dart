import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class AddToCartButton extends StatefulWidget {
  final int productId;
  final Map<String, dynamic> productDetails;

  const AddToCartButton({super.key, required this.productId, required this.productDetails});

  @override
  AddToCartButtonState createState() => AddToCartButtonState();
}

class AddToCartButtonState extends State<AddToCartButton> {
  bool isInCart = false;
  final CartService _cartService = CartService();

  @override
  void initState() {
    super.initState();
    _checkIfInCart();
  }

  Future<void> _checkIfInCart() async {
    bool inCart = await _cartService.isProductInCart(widget.productId);
    setState(() {
      isInCart = inCart;
    });
  }

  Future<void> _toggleCart() async {
    if (isInCart) {
      await _cartService.removeProductFromCart(widget.productId);
    } else {
      await _cartService.addProductToCart(widget.productDetails);
    }
    setState(() {
      isInCart = !isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => ColorsManager.primaryCyan
        ),
        foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(Size(0, 44.h)),
      ),
      onPressed: _toggleCart,
      icon: Icon(
        Icons.add_shopping_cart,
        color: Colors.white,
        size: 21.sp,
      ),
      label: Text(
        isInCart ? 'مضاف للسلة' : 'اضف للسلة',
        style: Styles.font16WhiteBold,
      ),
    );
  }
}
