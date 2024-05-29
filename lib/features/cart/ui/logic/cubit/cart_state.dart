part of 'cart_cubit.dart';

class CartState  {
  final List<Map<String, dynamic>> cartItems;

  const CartState({required this.cartItems});

   bool isInCart(int id) {
     return cartItems.any((product) => product['id'] == id);
   }
}



