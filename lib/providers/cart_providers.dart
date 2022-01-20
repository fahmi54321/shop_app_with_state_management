import 'package:flutter/material.dart';

//todo 1 create model
class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

//todo 2
class CartProvider with ChangeNotifier {
  //set
  Map<String, CartItem> _items = {}; //todo 3

  //get
  Map<String, CartItem> get items { //todo 4
    return {..._items};
  }

  //count items
  int get itemCount{
    return _items.length; //todo 5
  }

  //todo 6 add cart (next main.dart)
  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // add item baru pada cart
      _items.update(
        productId,
            (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );

    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }
}
