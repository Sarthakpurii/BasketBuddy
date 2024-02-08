import 'package:basketbuddy/data/dummy_items.dart';
import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/screens/form-screen.dart';
import 'package:basketbuddy/widgets/grocery-list-item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<GroceryItem> groceryData=[];

  void _addItemScreenSwitcher() async{
    final newGroceryItem=await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(builder: (context)=>NewItemScreen()));

    if (newGroceryItem!=null) groceryData.add(newGroceryItem);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
      ),
      body: ListView.builder(
          itemCount: groceryData.length,
          itemBuilder: (ctx, index) => GroceryListItem(
                grocery: groceryData[index],
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemScreenSwitcher,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        ),
    );
  }
}
