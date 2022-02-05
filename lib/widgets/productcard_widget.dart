import 'package:atto_flutter_assignment/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final String title;
  final List<ProductModel> carts;
  final ProductModel productItem;
  final VoidCallback decrementQty;
  final VoidCallback incrementQty;

  const ProductCardWidget({
    Key? key,
    required this.title,
    required this.decrementQty,
    required this.incrementQty,
    required this.carts,
    required this.productItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _currentItem = carts.firstWhere(
      (cartItem) => cartItem.title == productItem.title,
      orElse: () => ProductModel(qty: 0),
    );
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xff008fb6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: decrementQty,
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 25),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  _currentItem.qty.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: incrementQty,
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 25),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff008fb6),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
