import 'package:ar_visionary_explora/screens/main/myhome/items.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Items> _cartItems = [];

  List<Items> get cartItems => _cartItems;

  void addToCart(Items item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Items item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
