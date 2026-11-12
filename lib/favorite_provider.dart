
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  static final FavoriteProvider instance = FavoriteProvider();
  static const String _key = 'natureverse_favorites';

  List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final savedData = prefs.getStringList(_key) ?? [];

    _favorites = savedData
        .map((item) => Map<String, dynamic>.from(jsonDecode(item)))
        .toList();

    notifyListeners();
  }

  bool isFavorite(String id) {
    return _favorites.any((item) => item['id'] == id);
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    final id = item['id'];

    if (isFavorite(id)) {
      _favorites.removeWhere((element) => element['id'] == id);
    } else {
      _favorites.add(item);
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      _key,
      _favorites.map((item) => jsonEncode(item)).toList(),
    );

    notifyListeners();
  }
}
