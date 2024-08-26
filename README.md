# Flutter Practice

A new Flutter project.

## Project Description
This project involves a few flutter practices to get you started with flutter.
In this project I used the following:

## Documentation
Below are some of the images to show how to Navigate the project

## Tech Stack

**Client:** Flutter, BLoc


## Usage/Examples

```flutter
class Product {
  final String title;
  final String imageUrl;

  Product({required this.title, required this.imageUrl});
  
}
```

Below is an example of the Cubit file that holds the FavouriteState 
```

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_edit_controller/product_class.dart';


class FavouriteItemsCubit extends Cubit<List<Product>> {
  FavouriteItemsCubit() : super([]);

  void toggleFavorite(Product product) {
    if (state.any((element) => element.title == product.title)) {
      // If the product already exists, remove it from the list
      emit([...state.where((element) => element.title != product.title)]);
    } else {
      // If the product doesn't exist, add it to the list
      state.add(product);
      emit([...state]);
    }
  }
  
  void removeItem(String title, String imageUrl){
    emit([...state.where((element) => element.title != title)]);

  }
}
```


