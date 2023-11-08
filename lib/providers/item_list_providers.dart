import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/item.dart';

class ItemListProvider extends ChangeNotifier {
  List<Item> _itemList = [];

  List<Item> get itemList => _itemList;

  void addItem(Item item) {
    _itemList.add(item);
    notifyListeners();
  }
}