import 'package:flutter/material.dart';
import 'package:shoppingapp_provider/models/models.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> cartItems = [];

  List<Product> get items => cartItems;

  void addProduct(Product item){
    cartItems.add(item);
    notifyListeners();
  }

  void removeProduct(Product item){
    cartItems.remove(item);
    notifyListeners();
  }

  void removeAll(){
    cartItems.clear();
    notifyListeners(); 
  }

  double getCartTotal(){
    return cartItems.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
