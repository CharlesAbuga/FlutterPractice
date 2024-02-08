import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_edit_controller/cubit/favourite_items_cubit.dart';
import 'package:test_edit_controller/product_class.dart';

class FavouriteProducts extends StatefulWidget {
  const FavouriteProducts({super.key});

  @override
  State<FavouriteProducts> createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Products'),
      ),
      body: BlocBuilder<FavouriteItemsCubit, List<Product>>(
        builder: (context, products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Dismissible(
                key: ValueKey(products[index]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    BlocProvider.of<FavouriteItemsCubit>(context).removeItem(product.title,product.imageUrl);
                  });
                },
                child: ListTile(
                  leading: Image.asset(product.imageUrl),
                  title: Text(product.title),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
