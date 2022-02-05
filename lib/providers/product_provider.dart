import 'package:atto_flutter_assignment/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  Future<dynamic> getProducts() async {
    try {
      Uri url = Uri.parse(baseUrl);

      final response = await http.get(url);
      final data = productModelFromJson(response.body);

      if (response.statusCode == 200) {
        _products = data;
        notifyListeners();

        return data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
