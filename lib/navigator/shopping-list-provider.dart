import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/screens/form-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingListNotifier extends StateNotifier<Map<String,List<GroceryItem>>>{
  ShoppingListNotifier():super({'Morning':[],'Tomorrow':[]});
  void addItem(String title,GroceryItem newGroceryItem) async {
    state={...state,title:state[title]!+[newGroceryItem]};
  }
}


final shoppingListProvider=StateNotifierProvider<ShoppingListNotifier,Map<String,List<GroceryItem>>>((ref) => ShoppingListNotifier());