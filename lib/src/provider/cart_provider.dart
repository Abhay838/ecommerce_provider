import 'package:ecommerce_provider/src/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _cart = [];
  List<ProductModel> get cart => _cart;

  void toggleFavorite({required ProductModel product}) {
    if (_cart.contains(product)) {
      for (ProductModel element in cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incrementQTN(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  decrementQTN(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  //
  totalPrice() {
    double total = 0;
    for (ProductModel model in _cart) {
      total += model.price * model.quantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
