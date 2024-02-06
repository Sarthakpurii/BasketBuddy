import 'package:basketbuddy/data/dummy_items.dart';
import 'package:basketbuddy/screens/form-screen.dart';
import 'package:basketbuddy/widgets/grocery-list-item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addItemScreenSwitcher(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewItemScreen()));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: groceryItems.length,
            itemBuilder: (ctx, index) => GroceryListItem(
                  grocery: groceryItems[index],
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemScreenSwitcher,
        child: Icon(Icons.add),
        elevation: 0,
        shape: CircleBorder(),
        ),
    );
  }
}
