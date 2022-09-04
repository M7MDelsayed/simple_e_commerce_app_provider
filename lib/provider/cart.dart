import 'package:e_commerce_app/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final selectedItems = <Item>[];

  double get price {
    double _price = 0;
    for (final e in selectedItems) {
      _price += e.price.round();
    }
    return _price;
  }

  void add(Item product) {
    selectedItems.add(product);

    notifyListeners();
  }

  void delete(Item product) {
    selectedItems.remove(product);
    notifyListeners();
  }
}
