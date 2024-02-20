import 'package:basketbuddy/models/grocery-item.dart';
import 'package:basketbuddy/models/shopping-item.dart';
import 'package:basketbuddy/providers/shopping-list-provider.dart';
import 'package:basketbuddy/screens/form-screen.dart';
import 'package:basketbuddy/widgets/grocery-list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroceryListScreen extends ConsumerStatefulWidget {
  const GroceryListScreen({super.key,required this.item});
  // final List<GroceryItem> groceryData;
  final ShoppingItem item;

  @override
  ConsumerState<GroceryListScreen> createState() => GroceryListScreenState();
}

class GroceryListScreenState extends ConsumerState<GroceryListScreen> {


  void _addItemScreenSwitcher() async{
    final newGroceryItem=await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(builder: (context)=>NewItemScreen()));

    if (newGroceryItem!=null){
      setState(() {
        ref.read(shoppingListProvider.notifier).addItem(widget.item, newGroceryItem);
      });
    }
  }

  @override
  Widget build(context) {
    final List<GroceryItem> groceryData=ref.watch(shoppingListProvider)[widget.item]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: ListView.builder(
          itemCount: groceryData.length,
          itemBuilder: (ctx, index) => GroceryListItem(
                grocery: groceryData[index],
              )),
      floatingActionButton: FloatingActionButton(
        onPressed:_addItemScreenSwitcher,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
        ),
    );
  }
}
