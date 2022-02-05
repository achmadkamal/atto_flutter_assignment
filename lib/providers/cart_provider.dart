import 'package:atto_flutter_assignment/models/product_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<ProductModel> _carts = [];
  List<ProductModel> get carts => _carts;

  void addToCart({
    required ProductModel productItem,
  }) {
    if (!_carts.contains(productItem)) {
      var cartItem = productItem;
      cartItem.qty = 1;
      _carts.add(cartItem);
    } else {
      var index =
          _carts.indexWhere((cartItem) => cartItem.id == productItem.id);
      _carts[index].qty = _carts[index].qty! + 1;
    }
    notifyListeners();
  }

  void decreaseQty({
    required ProductModel productItem,
  }) {
    var index = _carts.indexWhere((cartItem) => cartItem.id == productItem.id);
    var product = carts[index];

    if (product.qty! > 0) {
      product.qty = product.qty! - 1;
    }
    notifyListeners();
  }

  int get getTotalItems {
    int totalItems = 0;
    for (var item in _carts) {
      totalItems += item.qty!;
    }
    return totalItems;
  }

  void buy() {
    _carts.clear();
    notifyListeners();
  }
}
