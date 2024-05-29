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

