import 'package:atto_flutter_assignment/pages/checkout_page.dart';
import 'package:atto_flutter_assignment/providers/cart_provider.dart';
import 'package:atto_flutter_assignment/providers/product_provider.dart';
import 'package:atto_flutter_assignment/widgets/productcard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008fb6),
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: context.read<ProductProvider>().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff008fb6),
                    ),
                  ),
                );
              } else {
                return Consumer<ProductProvider>(
                  builder: (context, productProvider, _) =>
                      Consumer<CartProvider>(
                    builder: (context, cartProvider, _) => Column(
                      children: productProvider.products
                          .map(
                            (product) => ProductCardWidget(
                              title: product.title!,
                              carts: cartProvider.carts,
                              productItem: product,
                              decrementQty: () {
                                context.read<CartProvider>().decreaseQty(
                                      productItem: product,
                                    );
                              },
                              incrementQty: () {
                                context.read<CartProvider>().addToCart(
                                      productItem: product,
                                    );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
      bottomSheet: Consumer<CartProvider>(
        builder: (context, cartProvider, _) {
          if (cartProvider.getTotalItems != 0) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Checkout ( ${cartProvider.getTotalItems} )'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff008fb6),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
