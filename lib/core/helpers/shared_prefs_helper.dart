import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences.getString(key);
  }

  static Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }

  static Future<bool> clearData() async {
    return await _preferences.clear();
  }
}

class FavoriteService {
  static const String _favoritesKey = 'favorites';

  Future<void> addFavorite(Map<String, dynamic> product) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.add(product);
    await prefs.setString(_favoritesKey, jsonEncode(favorites));
  }

  Future<void> removeFavorite(int productId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.removeWhere((product) => product['id'] == productId);
    await prefs.setString(_favoritesKey, jsonEncode(favorites));
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString(_favoritesKey);
    if (favoritesString == null) {
      return [];
    } else {
      final List<dynamic> jsonFavorites = jsonDecode(favoritesString);
      return jsonFavorites.cast<Map<String, dynamic>>();
    }
  }

  Future<bool> isFavorite(int productId) async {
    final favorites = await getFavorites();
    return favorites.any((product) => product['id'] == productId);
  }
}

class CartService {
  static const String _cartKey = 'cart';

   Future<void> addProductToCart(Map<String, dynamic> product) async {
    final preferences = await SharedPreferences.getInstance();

    final cartItems = await getCartItems();
    cartItems.add(product);
    await preferences.setString(_cartKey, jsonEncode(cartItems));
  }

   Future<void> removeProductFromCart(int productId) async {
    final preferences = await SharedPreferences.getInstance();

    final cartItems = await getCartItems();
    cartItems.removeWhere((product) => product['id'] == productId);
    await preferences.setString(_cartKey, jsonEncode(cartItems));
  }

   Future<List<Map<String, dynamic>>> getCartItems() async {
    final preferences = await SharedPreferences.getInstance();

    final cartString = preferences.getString(_cartKey);
    if (cartString == null) {
      return [];
    } else {
      final List<dynamic> jsonCart = jsonDecode(cartString);
      return jsonCart.cast<Map<String, dynamic>>();
    }
  }

   Future<bool> isProductInCart(int productId) async {
    final cartItems = await getCartItems();
    return cartItems.any((product) => product['id'] == productId);
  }
}
