import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/models/shopping-item.dart';
import 'package:basketbuddy/providers/shopping-list-provider.dart';
import 'package:basketbuddy/widgets/shopping-list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  // void _addShoppingItemTo

  @override
  Widget build(BuildContext context) {
    final Map<ShoppingItem,List<GroceryItem>> shoppingList=ref.watch(shoppingListProvider);

    final List<ShoppingItem> shoppingListTitle=shoppingList.keys.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
    ),
     body: ListView.builder(
      itemCount: shoppingList.length,
      itemBuilder: (ctx,index)=>ShoppingListItem(item: shoppingListTitle[index],)),

    floatingActionButton: FloatingActionButton(elevation: 0,
    onPressed: (){},
    shape: const CircleBorder(),
    child: const Icon(Icons.add),),
    );
  }
}