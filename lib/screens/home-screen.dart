import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/widgets/shopping-list-item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final Map<String,List<GroceryItem>> shoppingList={'Morning':[],'Tomorrow':[]};

  @override
  Widget build(BuildContext context) {
    final List<String> shoppingListTitle=shoppingList.keys.toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
    ),
     body: ListView.builder(
      itemCount: shoppingList.length,
      itemBuilder: (ctx,index)=>ShoppingListItem(title: shoppingListTitle[index],)),

    floatingActionButton: FloatingActionButton(elevation: 0,
    onPressed: (){},
    shape: const CircleBorder(),
    child: const Icon(Icons.add),),
    );
  }
}