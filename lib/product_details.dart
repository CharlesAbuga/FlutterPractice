import 'package:flutter/material.dart';
import 'package:test_edit_controller/product_class.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag:product.imageUrl,
              child: Image.asset(product.imageUrl)),
            Text(product.title)
          ],)
      ),
    );
  }
}
