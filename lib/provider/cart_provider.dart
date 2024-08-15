import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> value) {
    cart.add(value);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> value) {
    cart.remove(value);
    notifyListeners();
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}
