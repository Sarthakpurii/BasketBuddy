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

  void _addShoppingItemToList(){
    ref.read(shoppingListProvider.notifier).addShoppingItem('', true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
    fnode.requestFocus();
  });  }

  late final TextEditingController _titleController;
  late final FocusNode fnode;

  @override
  void initState() {
    super.initState();
    _titleController=TextEditingController();
    fnode=FocusNode();
  }


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
      itemBuilder: (ctx,index)=>ShoppingListItem(item: shoppingListTitle[index], titleController: shoppingListTitle[index].newItemStatus ? _titleController : null,
  fnode: shoppingListTitle[index].newItemStatus ? fnode : null,)),

    floatingActionButton: FloatingActionButton(elevation: 0,
    onPressed: _addShoppingItemToList,
    shape: const CircleBorder(),
    child: const Icon(Icons.add),),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    fnode.dispose();
    super.dispose();
  }
}