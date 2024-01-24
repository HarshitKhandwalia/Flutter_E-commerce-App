import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> Cart = [];

  void addProduct(Map<String, dynamic> Product) {
    Cart.add(Product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> Product) {
    Cart.remove(Product);
    notifyListeners();
  }
}
