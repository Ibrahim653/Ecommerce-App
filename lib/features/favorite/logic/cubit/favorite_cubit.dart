import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_prefs_helper.dart';
import '../../../cart/ui/logic/cubit/cart_cubit.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteService favoriteService;
  final CartCubit cartCubit;  

  FavoriteCubit(this.favoriteService, this.cartCubit) : super(const FavoriteState(favorites: []));

  Future<void> loadFavorites() async {
    final favorites = await favoriteService.getFavorites();
    emit(FavoriteState(favorites: favorites));
  }

  Future<void> toggleFavorite(Map<String, dynamic> product) async {
    if (state.isFavorite(product['id'])) {
      await favoriteService.removeFavorite(product['id']);
    } else {
      await favoriteService.addFavorite(product);
    }
    await loadFavorites();
  }

  Future<void> moveToCart(Map<String, dynamic> product) async {
    await favoriteService.removeFavorite(product['id']);
    await cartCubit.addProductToCart(product);
    await loadFavorites();
    await cartCubit.loadCartItems();
  }
}
