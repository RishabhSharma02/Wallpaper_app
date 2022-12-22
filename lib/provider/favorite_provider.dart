import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _imgf = [];
  List<String> get imgf => _imgf;

  void toggleFavorite(String url) {
    final isExist = _imgf.contains(url);
    if (isExist) {
      _imgf.remove(url);
    } else {
      _imgf.add(url);
    }
    notifyListeners();
  }

  bool isExist(String url) {
    final isExist = _imgf.contains(url);
    return isExist;
  }

  void clearFavorite() {
    _imgf = [];
    notifyListeners();
  }
}
