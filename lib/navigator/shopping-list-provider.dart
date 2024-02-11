import 'package:basketbuddy/models/grocery-item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListNotifier extends StateNotifier<Map<String,List<GroceryItem>>>{
  ShoppingListNotifier():super({'Morning':[],'Tomorrow':[]});

  void addItem(String title,GroceryItem item){
    state={...state,title:state[title]!+[item]};
  }
  

}

final shoppingListProvider=StateNotifierProvider((ref) => ShoppingListNotifier());