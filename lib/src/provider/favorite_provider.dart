import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductModel> _favoriteList = [];
  List<ProductModel> get favoriteCart => _favoriteList;

  FavoriteProvider() {
    _loadFavorites();
  }

  void toggleFavorite({required ProductModel product}) async {
    if (_favoriteList.contains(product)) {
      _favoriteList.remove(product);
    } else {
      _favoriteList.add(product);
    }
    notifyListeners();
    await _saveFavorites();
  }

  //
  bool isExist(ProductModel model) {
    final isExist = _favoriteList.contains(model);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }

  //save Favorites
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteList = _favoriteList
        .map(
          (product) => jsonEncode(product.toJson()),
        )
        .toList();
    await prefs.setStringList("favorites", favoriteList);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favoriteList = prefs.getStringList('favorites');
    if (favoriteList != null) {
      _favoriteList.addAll(favoriteList
          .map(
            (e) => ProductModel.fromJson(jsonDecode(e)),
          )
          .toList());
    }
  }
}
