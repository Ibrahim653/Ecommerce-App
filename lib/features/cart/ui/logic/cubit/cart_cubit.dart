import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/shared_prefs_helper.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartService cartService;

  CartCubit(this.cartService) : super(const CartState(cartItems: []));

  Future<void> loadCartItems() async {
    final cartItems = await cartService.getCartItems();
    emit(CartState(cartItems: cartItems));
  }

  Future<void> toggleCart(Map<String, dynamic> product) async {
    if (state.isInCart(product['id'])) {
      await cartService.removeProductFromCart(product['id']);
    } else {
      await cartService.addProductToCart(product);
    }
    await loadCartItems();
  }

  Future<void> addProductToCart(Map<String, dynamic> product) async {
    await cartService.addProductToCart(product);
    await loadCartItems();
  }

  Future<void> removeProductFromCart(int productId) async {
    await cartService.removeProductFromCart(productId);
    await loadCartItems();
  }
}
