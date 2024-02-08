import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_edit_controller/cubit/favourite_items_cubit.dart';
import 'package:test_edit_controller/favorite_products.dart';
import 'package:test_edit_controller/product_class.dart';
import 'package:test_edit_controller/product_widget.dart';
import 'product_class.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar')),
      body: Center(child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(products.length, (index) {
          return Center(child: ProductWidget(product: products[index]));
        }),
      )),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 11, 135, 176),
            ),
            child: Text('Animations'),
          ),
          const ListTile(
            hoverColor: Colors.amber,
            title: TextField(
              decoration: InputDecoration(
                  hintText: 'Search Products',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
            ),
          ),
          const ListTile(leading: Icon(Icons.home), title: Text('Home')),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteProducts()));
            },
            leading: const Icon(Icons.favorite),
            title: const Text('Favourites'),
          ),
        ]),
      ),
    );
  }
}
