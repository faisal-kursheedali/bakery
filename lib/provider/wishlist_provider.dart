import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  List<Map<String, dynamic>> wishlist = [];

  bool addToWishlist(Map<String, dynamic> value) {
    if (!wishlist.contains(value)) {
      wishlist.add(value);
      notifyListeners();
      return true;
    }
    return false;
  }

  void removeFromWishlist(Map<String, dynamic> value) {
    wishlist.remove(value);
    notifyListeners();
  }

  void clearWishlist() {
    wishlist.clear();
    notifyListeners();
  }
}
