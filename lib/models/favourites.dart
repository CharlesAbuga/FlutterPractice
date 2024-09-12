import 'package:flutter/material.dart';

class Favourites extends ChangeNotifier {
  final List<int> _favouriteItems = [];

  List<int> get items => _favouriteItems;

  void add(int ItemNo) {
    _favouriteItems.add(ItemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favouriteItems.remove(itemNo);
    notifyListeners();
  }
}
