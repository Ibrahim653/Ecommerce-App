part of 'favorite_cubit.dart';

class FavoriteState {
  final List<Map<String, dynamic>> favorites;

  const FavoriteState({required this.favorites});

  bool isFavorite(int id) {
    return favorites.any((product) => product['id'] == id);
  }
}
