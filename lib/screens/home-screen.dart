import 'package:basketbuddy/widgets/shopping-list-item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> shoppingList=['a','b'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
    ),
     body: ListView.builder(
      itemCount: shoppingList.length,
      itemBuilder: (ctx,index)=>const ShoppingListItem()),
    );
  }
}