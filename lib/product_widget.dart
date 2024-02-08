import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_edit_controller/cubit/favourite_items_cubit.dart';
import 'package:test_edit_controller/favorite_products.dart';
import 'package:test_edit_controller/global_variables.dart';
import 'package:test_edit_controller/product_details.dart';
import 'product_class.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget>  with SingleTickerProviderStateMixin{

  late AnimationController animController;
  late Animation<double> sizeAnim;

   @override
  void initState(){
    super.initState();

    animController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    sizeAnim = Tween<double>(begin: 1 , end: 2).animate(animController);


  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteItemsCubit, List<Product>>(
      builder: (context, favouriteProducts) {
        final isFavourite = BlocProvider.of<FavouriteItemsCubit>(context).state.any((element) => element.title == widget.product.title);
        return Card(
          surfaceTintColor: Colors.white,
          color: Colors.blue[200],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: widget.product),),);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Hero(
                        tag:widget.product.imageUrl,
                        child: Image.asset(widget.product.imageUrl, height: 180))),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Text(widget.product.title),
                trailing: IconButton(
                  icon:  isFavourite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                  onPressed: () {
                    setState((){
                    });
                      BlocProvider.of<FavouriteItemsCubit>(context).toggleFavorite(widget.product);
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
