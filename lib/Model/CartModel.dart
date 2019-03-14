import 'package:flutter/material.dart';

class CartItem{
  String name;
  double price;
  CartItem({this.name,this.price});
}

class CartModel extends ChangeNotifier{
  List<CartItem> _cart=[];
  addToCart(CartItem item){
    _cart.add(item);
    notifyListeners();
  }

  getCart()=>_cart;

  void delFromCart({String name}) {
    for(int i =0;i<_cart.length;i++){
      if(_cart[i].name == name){
        _cart.removeAt(i);
      }
    }
    notifyListeners();
  }

  getTotalPrice(){
    double totalPrice=0.0;
    for(int i =0;i<_cart.length;i++){
      totalPrice+=_cart[i].price;
    }
    notifyListeners();
    return totalPrice;
  }

}

