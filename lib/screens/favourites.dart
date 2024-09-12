import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favourites.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  static String routeName = 'favourites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: Consumer<Favourites>(builder: (context, favourites, child) {
          return ListView.builder(
            itemCount: favourites.items.length,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            itemBuilder: (context, index) {
              return FavouriteItemTile(favourites.items[index]);
            },
          );
        }));
  }
}

class FavouriteItemTile extends StatelessWidget {
  const FavouriteItemTile(this.itemNo, {super.key});

  final int itemNo;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
          ),
          title: Text(
            'Item $itemNo',
            key: Key('favorites_text_$itemNo'),
          ),
          trailing: IconButton(
            key: Key('remove_icon_$itemNo'),
            onPressed: () {
              Provider.of<Favourites>(context, listen: false).remove(itemNo);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Removed from favourites.'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            icon: Icon(Icons.close),
          ),
        ));
  }
}
