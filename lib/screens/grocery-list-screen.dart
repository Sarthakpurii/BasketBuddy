import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/screens/form-screen.dart';
import 'package:basketbuddy/widgets/grocery-list-item.dart';
import 'package:flutter/material.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key,required this.groceryData});
  final List<GroceryItem> groceryData;

  @override
  State<GroceryListScreen> createState() => GroceryListScreenState();
}

class GroceryListScreenState extends State<GroceryListScreen> {


  void _addItemScreenSwitcher() async{
    final newGroceryItem=await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(builder: (context)=>NewItemScreen()));

    if (newGroceryItem!=null){
      setState(() {
        widget.groceryData.add(newGroceryItem);
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBuddy'),
      ),
      body: ListView.builder(
          itemCount: widget.groceryData.length,
          itemBuilder: (ctx, index) => GroceryListItem(
                grocery: widget.groceryData[index],
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
