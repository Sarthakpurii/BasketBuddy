import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/models/shopping-item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListNotifier extends StateNotifier<Map<ShoppingItem,List<GroceryItem>>>{
      ShoppingListNotifier():super({const ShoppingItem(title: 'Morning',newItemStatus: false):[],const ShoppingItem(title: 'Tomorrow',newItemStatus: true):[]});


  void addItem(ShoppingItem item,GroceryItem newGroceryItem) async {
    state={...state,item:state[item]!+[newGroceryItem]};
  }

  void addShoppingItem(String title,bool newItemStatus){
    state={ShoppingItem(title:title,newItemStatus: newItemStatus):[],...state}; 
  }
}


final shoppingListProvider=StateNotifierProvider<ShoppingListNotifier,Map<ShoppingItem,List<GroceryItem>>>((ref) => ShoppingListNotifier());