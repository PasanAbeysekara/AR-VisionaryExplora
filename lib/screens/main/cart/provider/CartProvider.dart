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

  // Calculate the total price of products in the cart
  double calculateProductPrice() {
    double productPrice = 0;
    for (Items item in _cartItems) {
      productPrice += double.parse(item.itemPrice ?? '0');
    }
    return productPrice;
  }

  // Calculate the total price with discount and tax
  double calculateTotalPrice() {
    double productPrice = calculateProductPrice();
    double discount = 10000; // Replace with your discount logic
    double tax = 5000; // Replace with your tax logic
    return productPrice - discount + tax;
  }
}
